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
  Transport({int role, Signal signal, Map<String, dynamic> config}) {
    signal = signal;
    createPeerConnection(config).then((value) => pc = value);
    candidates = [];

    if (role == RolePub) {
      pc.createDataChannel('ion-sfu', RTCDataChannelInit());
    }

    pc.onDataChannel = (channel) {
      api = channel;
    };

    pc.onIceCandidate = (candidate) {
      if (candidate != null) {
        signal.trickle(Trickle(target: role, candidate: candidate));
      }
    };
  }

  RTCDataChannel api;
  Signal signal;
  RTCPeerConnection pc;
  List<RTCIceCandidate> candidates = [];
}

class Client {
  Client({String sid, Signal singal, Map<String, dynamic> config}) {
    signal = signal;
    codec = config['codec'];
    transports = {
      RolePub: Transport(role: RolePub, signal: signal, config: config),
      RoleSub: Transport(role: RoleSub, signal: signal, config: config)
    };

    transports[RoleSub].pc.onTrack = (RTCTrackEvent ev) {
      var stream = ev.streams[0];
      var remote = makeRemote(stream, transports[RoleSub]);
      ontrack?.call(ev.track, remote);
    };

    signal.onnegotiate = negotiate;
    signal.ontrickle = trickle;
    signal.onready = () {
      if (!initialized) {
        join(sid);
        initialized = true;
      }
    };
  }
  final defaultConfig = {
    'codec': 'vp8',
    'iceServers': [
      {'urls': 'stun:stun.stunprotocol.org:3478'}
    ],
  };
  bool initialized = false;
  Signal signal;
  String codec;
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
    var remoteDesc = await transports[trickle.target].pc.getRemoteDescription();
    if (remoteDesc != null) {
      transports[trickle.target].pc.addCandidate(trickle.candidate);
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

const DefaultPayloadTypePCMU = 0;
const DefaultPayloadTypePCMA = 8;
const DefaultPayloadTypeG722 = 9;
const DefaultPayloadTypeOpus = 111;
const DefaultPayloadTypeVP8 = 96;
const DefaultPayloadTypeVP9 = 98;
const DefaultPayloadTypeH264 = 102;

_payloadModify(desc, codec, sender) {
  if (codec == null) return desc;

  log.debug('SDP string => ${desc.sdp}');
  var session = sdpTransform.parse(desc.sdp);
  //logger.debug('SDP object => $session');

  var audioIndex = session['media'].indexWhere((e) => e['type'] == 'audio');
  if (audioIndex != -1) {
    var codeName = "OPUS";
    var payload = 111;
    log.debug('Setup audio codec => $codeName, payload => $payload');
    var rtp = [
      {"payload": payload, "codec": codeName, "rate": 48000, "encoding": 2},
    ];
    var fmtp = [
      {"payload": payload, "config": "minptime=10;useinbandfec=1"}
    ];

    session['media'][audioIndex]["payloads"] = '$payload';
    session['media'][audioIndex]["rtp"] = rtp;
    session['media'][audioIndex]["fmtp"] = fmtp;

    if (sender) {
      session['media'][audioIndex]["direction"] = "sendonly";
    } else {
      session['media'][audioIndex]["direction"] = "recvonly";
    }
  }

  var videoIdx = session['media'].indexWhere((e) => e['type'] == 'video');

  if (videoIdx != -1) {
    var payload;
    var rtx = 97;
    var codeName = '';
    if (codec.toLowerCase() == 'vp8') {
      payload = DefaultPayloadTypeVP8;
      codeName = "VP8";
    } else if (codec.toLowerCase() == 'vp9') {
      payload = DefaultPayloadTypeVP9;
      codeName = "VP9";
    } else if (codec.toLowerCase() == 'h264') {
      payload = 102;
      codeName = "H264";
    } else {
      return desc;
    }

    log.debug('Setup video codec => $codeName, payload => $payload');

    var rtp = [
      {"payload": payload, "codec": codeName, "rate": 90000, "encoding": null},
      //{"payload": rtx, "codec": "rtx", "rate": 90000, "encoding": null}
    ];

    var fmtp = [
      //{"payload": rtx, "config": "apt=$payload"}
    ];

    if (payload == DefaultPayloadTypeH264) {
      fmtp.add({
        "payload": payload,
        "config":
            "level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f"
      });
    }

    var rtcpFB = [
      {"payload": payload, "type": "goog-remb", "subtype": null},
      {"payload": payload, "type": "transport-cc", "subtype": null},
      {"payload": payload, "type": "ccm", "subtype": null},
      {"payload": payload, "type": "ccm", "subtype": "fir"},
      {"payload": payload, "type": "nack", "subtype": null},
      {"payload": payload, "type": "nack", "subtype": "pli"}
    ];

    session['media'][videoIdx]["payloads"] = '$payload'; // $rtx';
    session['media'][videoIdx]["rtp"] = rtp;
    session['media'][videoIdx]["fmtp"] = fmtp;
    session['media'][videoIdx]["rtcpFb"] = rtcpFB;

    if (session['media'][videoIdx]['ssrcGroups'] != null) {
      var ssrcGroup = session['media'][videoIdx]['ssrcGroups'][0];
      var ssrcs = ssrcGroup['ssrcs'];
      var videoSsrc = ssrcs.split(" ")[0];
      log.debug('ssrcs => $ssrcs, video $videoSsrc');

      List newSsrcs = session['media'][videoIdx]['ssrcs'] as List;
      newSsrcs.removeWhere((item) => '${item['id']}' != videoSsrc);

      session['media'][videoIdx]['ssrcGroups'] = [];
      session['media'][videoIdx]['ssrcs'] = newSsrcs;
    }

    if (sender) {
      session['media'][videoIdx]["direction"] = "sendonly";
    } else {
      session['media'][videoIdx]["direction"] = "recvonly";
    }
  }

  /*else {
      List<Map<String, dynamic>> payloadMap = [
        {
          'codec': "VP8",
          'payload': DefaultPayloadTypeVP8,
          'rtx': 97,
        },
        {
          'codec': "VP9",
          'payload': DefaultPayloadTypeVP9,
          'rtx': 124,
        },
        {
          'codec': "H264",
          'payload': DefaultPayloadTypeH264,
          'rtx': 125,
        }
      ];

      var payloads = "";
      var rtps = [];
      var fmtps = [];
      var rtcpFBs = [];

      payloadMap.map((e) {
        var name = e['name'];
        var payload = e['payload'];
        var rtx = e['rtx'];

        payloads += '$payload $rtx';

        rtps.add({
          "payload": payload,
          "codec": name,
          "rate": 90000,
          "encoding": null
        });
        rtps.add(
            {"payload": rtx, "codec": "rtx", "rate": 90000, "encoding": null});

        fmtps.add({"payload": rtx, "config": "apt=$payload"});

        rtcpFBs.addAll([
          {"payload": payload, "type": "transport-cc", "subtype": null},
          {"payload": payload, "type": "ccm", "subtype": "fir"},
          {"payload": payload, "type": "nack", "subtype": null},
          {"payload": payload, "type": "nack", "subtype": "pli"}
        ]);
      });

      session['media'][videoIdx]["payloads"] = payloads;
      session['media'][videoIdx]["rtp"] = rtps;
      session['media'][videoIdx]["fmtp"] = fmtps;
      session['media'][videoIdx]["rtcpFb"] = rtcpFBs;
    }*/

  var tmp = desc;
  tmp.sdp = sdpTransform.write(session, null);
  log.debug('SDP => ${tmp.sdp}');
  return tmp;
}
