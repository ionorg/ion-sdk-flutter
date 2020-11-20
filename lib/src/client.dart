import 'dart:async';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:sdp_transform/sdp_transform.dart' as sdpTransform;

import 'logger.dart';
import 'signal/signal.dart';
import 'stream.dart';

abstract class Sender {
  MediaStream get stream;

  /// [kind in 'video' | 'audio']
  RTCRtpTransceiver get transceivers;
}

class RTCConfiguration {
  /// 'vp8' | 'vp9' | 'h264'
  String codec;
}

class Transport {
  Transport(this.signal);

  static Future<Transport> create(
      {int role, Signal signal, Map<String, dynamic> config}) async {
    var transport = Transport(signal);
    var pc = await createPeerConnection(config);

    transport.pc = pc;

    if (role == RolePub) {
      pc.createDataChannel(
          'ion-sfu', RTCDataChannelInit()..maxRetransmits = 30);
    }

    pc.onDataChannel = (channel) {
      transport.api = channel;
      transport.api.onDataChannelState = (state) {
        if (state == RTCDataChannelState.RTCDataChannelOpen) {
          transport.onapiopen?.call();
        }
      };
    };

    pc.onIceCandidate = (candidate) {
      if (candidate != null) {
        signal.trickle(Trickle(target: role, candidate: candidate));
      }
    };

    pc.onIceGatheringState = (state) {
      print(state);
    };

    pc.onConnectionState = (state) {
      print(state);
    };

    return transport;
  }

  Function() onapiopen;
  RTCDataChannel api;
  Signal signal;
  RTCPeerConnection pc;
  List<RTCIceCandidate> candidates = [];
}

class Client {
  Client(this.signal);
  static Future<Client> create(
      {String sid, Signal signal, Map<String, dynamic> config}) async {
    var client = Client(signal);
    client.transports = {
      RolePub: await Transport.create(
          role: RolePub, signal: signal, config: config ?? defaultConfig),
      RoleSub: await Transport.create(
          role: RoleSub, signal: signal, config: config ?? defaultConfig)
    };

    client.transports[RoleSub].pc.onTrack = (RTCTrackEvent ev) {
      var stream = ev.streams[0];
      var remote = makeRemote(stream, client.transports[RoleSub]);
      client.ontrack?.call(ev.track, remote);
    };

    client.signal.onnegotiate = (desc) => client.negotiate(desc);
    client.signal.ontrickle = (trickle) => client.trickle(trickle);
    client.signal.onready = () {
      if (!client.initialized) {
        client.join(sid);
        client.initialized = true;
      }
    };
    client.signal.connect();
    return client;
  }

  static final defaultConfig = {
    'iceServers': [
      {'urls': 'stun:stun.stunprotocol.org:3478'}
    ],
    'sdpSemantics': "unified-plan"
  };

  bool initialized = false;
  Signal signal;
  Map<int, Transport> transports = {};
  Function(MediaStreamTrack track, RemoteStream stream) ontrack;

  Future<List<StatsReport>> getPubStats(MediaStreamTrack selector) {
    return transports[RolePub].pc.getStats(selector);
  }

  Future<List<StatsReport>> getSubStats(MediaStreamTrack selector) {
    return transports[RoleSub].pc.getStats(selector);
  }

  void publish(LocalStream stream) {
    stream.publish(transports[RolePub].pc);
  }

  void close() {
    transports.forEach((key, element) {
      element.pc.close();
    });
    signal.close();
  }

  void join(String sid) async {
    var offer = await transports[RolePub].pc.createOffer();
    await transports[RolePub].pc.setLocalDescription(offer);
    var answer = await signal.join(sid, offer);

    await transports[RolePub].pc.setRemoteDescription(answer);
    transports[RolePub]
        .candidates
        .forEach((c) => transports[RolePub].pc.addCandidate(c));
    transports[RolePub].pc.onRenegotiationNeeded = onNegotiationNeeded;
  }

  void trickle(Trickle trickle) async {
    var pc = transports[trickle.target].pc;
    //var remoteDesc = await pc.getRemoteDescription();
    if (pc != null) {
      pc.addCandidate(trickle.candidate);
    } else {
      transports[trickle.target].candidates.add(trickle.candidate);
    }
  }

  void negotiate(RTCSessionDescription description) async {
    try {
      await transports[RoleSub].pc.setRemoteDescription(description);
      var answer = await transports[RoleSub].pc.createAnswer();
      await transports[RoleSub].pc.setLocalDescription(answer);
      signal.answer(answer);
    } catch (err) {
      /* tslint:disable-next-line:no-console */
      log.error(err);
    }
  }

  void onNegotiationNeeded() async {
    try {
      var offer = await transports[RolePub].pc.createOffer();
      await transports[RolePub].pc.setLocalDescription(offer);
      var answer = await signal.offer(offer);
      await transports[RolePub].pc.setRemoteDescription(answer);
    } catch (err) {
      /* tslint:disable-next-line:no-console */
      log.error(err);
    }
  }
}
