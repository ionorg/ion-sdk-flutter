import 'dart:async';
import 'dart:convert';

import 'package:events2/events2.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:grpc/grpc.dart';
import 'package:uuid/uuid.dart';

import '_proto/library/sfu.pbgrpc.dart' as grpc;
import 'grpc-web/_channel.dart'
    if (dart.library.html) 'grpc-web/_channel_html.dart';
import 'signal.dart';

class GRPCWebSignal extends Signal {
  GRPCWebSignal(this._uri) {
    var uri = Uri.parse(_uri);
    var channel = createChannel(uri.host, uri.port);
    _client = grpc.SFUClient(channel);
    _requestStream = StreamController<grpc.SignalRequest>();
  }

  final String _uri;
  final JsonDecoder _jsonDecoder = JsonDecoder();
  final JsonEncoder _jsonEncoder = JsonEncoder();
  final Uuid _uuid = Uuid();
  final EventEmitter _emitter = EventEmitter();
  late grpc.SFUClient _client;
  late StreamController<grpc.SignalRequest> _requestStream;
  late ResponseStream<grpc.SignalReply> _replyStream;

  void _onSignalReply(grpc.SignalReply reply) {
    switch (reply.whichPayload()) {
      case grpc.SignalReply_Payload.join:
        var map =
            _jsonDecoder.convert(String.fromCharCodes(reply.join.description));
        var desc = RTCSessionDescription(map['sdp'], map['type']);
        _emitter.emit('join-reply', desc);
        break;
      case grpc.SignalReply_Payload.description:
        var map = _jsonDecoder.convert(String.fromCharCodes(reply.description));
        var desc = RTCSessionDescription(map['sdp'], map['type']);
        if (desc.type == 'offer') {
          onnegotiate?.call(desc);
        } else {
          _emitter.emit('description', reply.id, desc);
        }
        break;
      case grpc.SignalReply_Payload.trickle:
        var map = {
          'target': reply.trickle.target.value,
          'candidate': _jsonDecoder.convert(reply.trickle.init)
        };
        ontrickle?.call(Trickle.fromMap(map));
        break;
      case grpc.SignalReply_Payload.iceConnectionState:
      case grpc.SignalReply_Payload.error:
      case grpc.SignalReply_Payload.notSet:
        break;
    }
  }

  @override
  void connect() {
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
    var request = grpc.SignalRequest()
      ..id = id
      ..join = (grpc.JoinRequest()
        ..description = utf8.encode(_jsonEncoder.convert(offer.toMap()))
        ..sid = sid
        ..uid = uid);
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
  Future<RTCSessionDescription> offer(RTCSessionDescription offer) {
    Completer completer = Completer<RTCSessionDescription>();
    var id = _uuid.v4();
    var request = grpc.SignalRequest()
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
    var reply = grpc.SignalRequest()
      ..description = utf8.encode(_jsonEncoder.convert(answer.toMap()));
    _requestStream.add(reply);
  }

  @override
  void trickle(Trickle trickle) {
    var reply = grpc.SignalRequest()
      ..trickle = (grpc.Trickle()
        ..target = grpc.Trickle_Target.valueOf(trickle.target)!
        ..init = _jsonEncoder.convert(trickle.candidate.toMap()));
    _requestStream.add(reply);
  }
}
