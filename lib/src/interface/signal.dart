import 'dart:html';

import 'package:flutter_webrtc/flutter_webrtc.dart';

class Trickle {
  RTCIceCandidate candidate;
  Role target;
}

enum Role {
  pub,
  sub,
}

typedef OnNegotiateCallback = void Function(RtcSessionDescription jsep);
typedef OnReadyCallback = void Function();
typedef OnTrickleCallback = void Function(Trickle trickle);

abstract class Signal {
  OnNegotiateCallback onnegotiate;

  OnReadyCallback onready;

  OnTrickleCallback ontrickle;

  Future<RTCSessionDescription> join(String sid, RTCSessionDescription offer);

  Future<RTCSessionDescription> offer(RTCSessionDescription offer);

  void answer(RTCSessionDescription offer);

  void trickle(Trickle trickle);

  void close();
}
