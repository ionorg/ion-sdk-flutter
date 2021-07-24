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

abstract class Signal {
  Function(RTCSessionDescription jsep)? onnegotiate;
  Function()? onready;
  Function(int code, String reason)? onclose;
  Function(Trickle trickle)? ontrickle;

  Future<bool> join(String sid, String uid, Map<String, String> parameters);

  Future<RTCSessionDescription> offer(RTCSessionDescription offer);

  void answer(RTCSessionDescription answer);

  void trickle(Trickle trickle);

  Future<void> connect();

  void close();
}
