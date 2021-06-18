import 'package:flutter_webrtc/flutter_webrtc.dart';

class Trickle {
  Trickle({required this.target, required this.candidate});
  factory Trickle.fromMap(Map<String, dynamic> map) => Trickle(
      candidate: RTCIceCandidate(
        map['candidate']['candidate'],
        map['candidate']['sdpMid'],
        map['candidate']['sdpMLineIndex'],
      ),
      target: map['target']);
  RTCIceCandidate candidate;
  int target;
  Map toMap() => {'target': target, 'candidate': candidate.toMap()};
}

final RolePub = 0;
final RoleSub = 1;

typedef OnNegotiateCallback = Function(RTCSessionDescription jsep);
typedef OnReadyCallback = Function();
typedef OnTrickleCallback = Function(Trickle trickle);
typedef OnCloseCallback = Function(int code, String reason);

abstract class Signal {
  OnNegotiateCallback? onnegotiate;

  OnReadyCallback? onready;

  OnCloseCallback? onclose;

  OnTrickleCallback? ontrickle;

  Future<RTCSessionDescription> join(
      String sid, String uid, RTCSessionDescription offer);

  Future<RTCSessionDescription> offer(RTCSessionDescription offer);

  void answer(RTCSessionDescription answer);

  void trickle(Trickle trickle);

  Future<void> connect();

  void close();
}
