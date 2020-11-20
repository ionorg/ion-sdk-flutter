import 'package:flutter_webrtc/flutter_webrtc.dart';

class Trickle {
  Trickle({this.target, this.candidate});
  factory Trickle.fromMap(Map<String, dynamic> map) => Trickle(
      candidate: RTCIceCandidate(
        map['candidate']['candidate'],
        map['candidate']['sdpMid'],
        map['candidate']['sdpMLineIndex'],
      ),
      target: map['target']);
  RTCIceCandidate candidate;
  int target;
  Map toMap() => {'role': target, 'candidate': candidate.toMap()};
}

final RolePub = 0;
final RoleSub = 1;

typedef OnNegotiateCallback = void Function(RTCSessionDescription jsep);
typedef OnReadyCallback = void Function();
typedef OnTrickleCallback = void Function(Trickle trickle);
typedef OnCloseCallback = void Function(int code, String reason);

abstract class Signal {
  OnNegotiateCallback onnegotiate;

  OnReadyCallback onready;

  OnCloseCallback onclose;

  OnTrickleCallback ontrickle;

  Future<RTCSessionDescription> join(String sid, RTCSessionDescription offer);

  Future<RTCSessionDescription> offer(RTCSessionDescription offer);

  void answer(RTCSessionDescription answer);

  void trickle(Trickle trickle);

  void connect();

  void close();
}
