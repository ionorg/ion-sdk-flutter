import 'dart:async';
import 'dart:convert';

import 'package:events2/events2.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:grpc/grpc.dart';
import 'package:uuid/uuid.dart';

import '../_library/proto/sfu/sfu.pbgrpc.dart' as pb;

import 'grpc-web/_channel.dart'
    if (dart.library.html) 'grpc-web/_channel_html.dart';
import 'signal.dart';

class GRPCWebSignal extends Signal {
  GRPCWebSignal(this._uri) {
    var uri = Uri.parse(_uri);
    var channel = createChannel(uri.host, uri.port, uri.scheme == 'https');
    _client = pb.SFUClient(channel);
    _requestStream = StreamController<pb.SignalRequest>();
  }

  final String _uri;
  final JsonDecoder _jsonDecoder = JsonDecoder();
  final JsonEncoder _jsonEncoder = JsonEncoder();
  final Uuid _uuid = Uuid();
  final EventEmitter _emitter = EventEmitter();
  late pb.SFUClient _client;
  late StreamController<pb.SignalRequest> _requestStream;
  late ResponseStream<pb.SignalReply> _replyStream;

  void _onSignalReply(pb.SignalReply reply) {
    switch (reply.whichPayload()) {
      case pb.SignalReply_Payload.join:
        var map =
            _jsonDecoder.convert(String.fromCharCodes(reply.join.description));
        var desc = RTCSessionDescription(map['sdp'], map['type']);
        _emitter.emit('join-reply', desc);
        break;
      case pb.SignalReply_Payload.description:
        var map = _jsonDecoder.convert(String.fromCharCodes(reply.description));
        var desc = RTCSessionDescription(map['sdp'], map['type']);
        if (desc.type == 'offer') {
          onnegotiate?.call(desc);
        } else {
          _emitter.emit('description', reply.id, desc);
        }
        break;
      case pb.SignalReply_Payload.trickle:
        var map = {
          'target': reply.trickle.target.value,
          'candidate': _jsonDecoder.convert(reply.trickle.init)
        };
        ontrickle?.call(Trickle.fromMap(map));
        break;
      case pb.SignalReply_Payload.iceConnectionState:
      case pb.SignalReply_Payload.error:
      case pb.SignalReply_Payload.notSet:
        break;
    }
  }

  @override
  Future<void> connect() async {
    _replyStream = _client.signal(_requestStream.stream);
    _replyStream.listen(_onSignalReply,
        onDone: () => onclose?.call(0, 'closed'),
        onError: (e) => onclose?.call(500, '$e'));
    onready?.call();
  }

  @override
  void close() {
    _requestStream.close();
    _replyStream.cancel();
  }

  @override
  Future<RTCSessionDescription> join(
      String sid, String uid, RTCSessionDescription offer) {
    Completer completer = Completer<RTCSessionDescription>();
    var id = _uuid.v4();
    var request = pb.SignalRequest()
      ..id = id
      ..join = (pb.JoinRequest()
        ..description = utf8.encode(_jsonEncoder.convert(offer.toMap()))
        ..sid = sid
        ..uid = uid);
    _requestStream.add(request);

    Function(RTCSessionDescription) handler;
    handler = (desc) {
      completer.complete(desc);
    };
    _emitter.once('join-reply', handler);
    return completer.future as Future<RTCSessionDescription>;
  }

  @override
  Future<RTCSessionDescription> offer(RTCSessionDescription offer) {
    Completer completer = Completer<RTCSessionDescription>();
    var id = _uuid.v4();
    var request = pb.SignalRequest()
      ..id = id
      ..description = utf8.encode(_jsonEncoder.convert(offer.toMap()));
    _requestStream.add(request);
    Function(String, dynamic) handler;
    handler = (respid, desc) {
      if (respid == id) {
        completer.complete(desc);
      }
    };
    _emitter.once('description', handler);
    return completer.future as Future<RTCSessionDescription>;
  }

  @override
  void answer(RTCSessionDescription answer) {
    var reply = pb.SignalRequest()
      ..description = utf8.encode(_jsonEncoder.convert(answer.toMap()));
    _requestStream.add(reply);
  }

  @override
  void trickle(Trickle trickle) {
    var reply = pb.SignalRequest()
      ..trickle = (pb.Trickle()
        ..target = pb.Trickle_Target.valueOf(trickle.target)!
        ..init = _jsonEncoder.convert(trickle.candidate.toMap()));
    _requestStream.add(reply);
  }
}
