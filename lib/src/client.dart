import 'dart:async';
import 'dart:convert';

import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'logger.dart';
import 'signal/signal.dart';
import 'stream.dart';
import 'utils.dart';

const API_CHANNEL = 'ion-sfu';
const ERR_NO_SESSION = 'no active session, join first';

abstract class Sender {
  MediaStream get stream;

  /// [kind in 'video' | 'audio']
  RTCRtpTransceiver get transceivers;
}

class RTCConfiguration {
  /// 'vp8' | 'vp9' | 'h264'
  late String codec;
}

class Transport {
  Transport(this.signal);

  static Future<Transport> create(
      {required int role,
      required Signal signal,
      required Map<String, dynamic> config}) async {
    var transport = Transport(signal);
    var pc = await createPeerConnection(config);

    transport.pc = pc;

    if (role == RolePub) {
      transport.api = await pc.createDataChannel(
          API_CHANNEL, RTCDataChannelInit()..maxRetransmits = 30);
    }

    pc.onIceCandidate = (candidate) {
      signal.trickle(Trickle(target: role, candidate: candidate));
    };

    pc.onIceConnectionState = (state) => {
          if (pc.iceConnectionState ==
              RTCIceConnectionState.RTCIceConnectionStateDisconnected)
            {
              /* TODO: implement pc.restartIce for flutter_webrtc.
              if (pc.restartIce) {
                // this will trigger onNegotiationNeeded
                pc.restartIce();
              }*/
            }
        };

    return transport;
  }

  bool hasRemoteDescription = false;
  Function()? onapiopen;
  RTCDataChannel? api;
  Signal signal;
  RTCPeerConnection? pc;
  List<RTCIceCandidate> candidates = [];
}

class Client {
  Client(this.signal, this.config) {
    signal.onnegotiate = negotiate;
    signal.ontrickle = trickle;
  }
  static Future<Client> create(
      {required String sid,
      required String uid,
      required Signal signal,
      Map<String, dynamic>? config}) async {
    var client = Client(signal, config ?? defaultConfig);

    client.transports = {
      RolePub: await Transport.create(
          role: RolePub, signal: signal, config: config ?? defaultConfig),
      RoleSub: await Transport.create(
          role: RoleSub, signal: signal, config: config ?? defaultConfig)
    };

    client.signal.onready = () async {
      if (!client.initialized) {
        await client.join(sid, uid);
        client.initialized = true;
      }
    };
    unawaited(client.signal.connect());
    return client;
  }

  Map<String, dynamic> config;
  Function(MediaStreamTrack track, RemoteStream stream)? ontrack;
  Function(RTCDataChannel channel)? ondatachannel;
  Function(Map<String, dynamic> speakers)? onspeaker;

  static final defaultConfig = {
    'iceServers': [
      //{'urls': 'stun:stun.stunprotocol.org:3478'}
    ],
    'sdpSemantics': 'unified-plan'
  };

  bool initialized = false;
  Signal signal;
  Map<int, Transport> transports = {};

  Future<List<StatsReport>> getPubStats(MediaStreamTrack? selector) {
    return transports[RolePub]!.pc!.getStats(selector);
  }

  Future<List<StatsReport>> getSubStats(MediaStreamTrack? selector) {
    return transports[RoleSub]!.pc!.getStats(selector);
  }

  Future<void> publish(LocalStream stream) async {
    await stream.publish(transports[RolePub]!.pc!);
  }

  void close() {
    transports.forEach((key, element) {
      element.pc!.close();
      element.pc!.dispose();
    });
    signal.close();
  }

  Future<void> join(String sid, String uid) async {
    var completer = Completer<void>();
    try {
      transports[RoleSub]!.pc!.onTrack = (RTCTrackEvent ev) {
        var remote = makeRemote(ev.streams[0], transports[RoleSub]!);
        ontrack?.call(ev.track, remote);
      };
      transports[RoleSub]!.pc!.onDataChannel = (RTCDataChannel channel) {
        if (channel.label == API_CHANNEL) {
          transports[RoleSub]!.api = channel;
          transports[RoleSub]!.onapiopen?.call();
          final json = JsonDecoder();
          channel.onMessage = (RTCDataChannelMessage msg) {
            onspeaker?.call(json.convert(msg.text));
          };
          completer.complete();
        }
        ondatachannel?.call(channel);
      };

      var pc = transports[RolePub]!.pc;
      if (pc != null) {
        try {
          unAwaited(pc.createOffer({}).then((offer) async {
            await pc.setLocalDescription(offer);
            var answer = await signal.join(sid, uid, offer);
            await pc.setRemoteDescription(answer);
            transports[RolePub]!.hasRemoteDescription = true;
            transports[RolePub]!
                .candidates
                .forEach((c) async => await pc.addCandidate(c));
            pc.onRenegotiationNeeded = onnegotiationneeded;
          }));
        } catch (e) {
          completer.completeError(e);
        }
      }
    } catch (e) {
      print('join: e => ${e.toString()}');
      completer.completeError(e);
    }
    return completer.future;
  }

  void trickle(Trickle trickle) async {
    var pc = transports[trickle.target]!.pc;
    if (pc != null && transports[trickle.target]!.hasRemoteDescription) {
      await pc.addCandidate(trickle.candidate);
    } else {
      transports[trickle.target]!.candidates.add(trickle.candidate);
    }
  }

  void negotiate(RTCSessionDescription description) async {
    try {
      var pc = transports[RoleSub]!.pc;
      if (pc != null) {
        await pc.setRemoteDescription(description);
        transports[RoleSub]!.candidates.forEach((c) => pc.addCandidate(c));
        transports[RoleSub]!.candidates = [];
        var answer = await pc.createAnswer({});
        await pc.setLocalDescription(answer);
        signal.answer(answer);
      }
    } catch (err) {
      log.error('negotiate: e => ${err.toString()}');
    }
  }

  Future<void> onnegotiationneeded() async {
    try {
      var pc = transports[RolePub]!.pc;
      if (pc != null) {
        var offer = await pc.createOffer({});
        setPreferredCodec(offer);
        await pc.setLocalDescription(offer);
        var answer = await signal.offer(offer);
        await pc.setRemoteDescription(answer);
      }
    } catch (err, st) {
      log.error('onnegotiationneeded: e => ${err.toString()} $st');
    }
  }

  void setPreferredCodec(RTCSessionDescription description) {
    var capSel = CodecCapabilitySelector(description.sdp!);
    var acaps = capSel.getCapabilities('audio');
    if (acaps != null) {
      acaps.codecs = acaps.codecs
          .where((e) => (e['codec'] as String).toLowerCase() == 'opus')
          .toList();
      acaps.setCodecPreferences('audio', acaps.codecs);
      capSel.setCapabilities(acaps);
    }

    var vcaps = capSel.getCapabilities('video');
    if (vcaps != null) {
      vcaps.codecs = vcaps.codecs
          .where((e) => (e['codec'] as String).toLowerCase() == 'vp8')
          .toList();
      vcaps.setCodecPreferences('video', vcaps.codecs);
      capSel.setCapabilities(vcaps);
    }
    description.sdp = capSel.sdp();
  }

  Future<RTCDataChannel> createDataChannel(String label) {
    if (transports.isEmpty) {
      throw AssertionError(ERR_NO_SESSION);
    }
    return transports[RolePub]!
        .pc!
        .createDataChannel(label, RTCDataChannelInit()..maxRetransmits = 30);
  }
}
