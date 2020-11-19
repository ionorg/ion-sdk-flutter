import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'interface/signal.dart';

class JsonRPCSignal extends Signal {
  JsonRPCSignal(this._uri);

  final String _uri;

  @override
  void answer(RTCSessionDescription offer) {
    // TODO: implement answer
  }

  @override
  void close() {
    // TODO: implement close
  }

  @override
  Future<RTCSessionDescription> join(String sid, RTCSessionDescription offer) {
    // TODO: implement join
    throw UnimplementedError();
  }

  @override
  Future<RTCSessionDescription> offer(RTCSessionDescription offer) {
    // TODO: implement offer
    throw UnimplementedError();
  }

  @override
  void trickle(Trickle trickle) {
    // TODO: implement trickle
  }
}
