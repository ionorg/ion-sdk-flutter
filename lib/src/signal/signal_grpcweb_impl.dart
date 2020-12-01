import 'dart:async';
import 'dart:convert';

import 'package:events2/events2.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:uuid/uuid.dart';

import '../logger.dart';
import '_proto/library/sfu.pbgrpc.dart' as grpc;
import 'grpc-web/websocket_channel.dart';
import 'signal.dart';

class GRPCWebSignal extends Signal {
  GRPCWebSignal(this._uri) {
    var uri = Uri.parse(_uri);
    _client = grpc.SFUClient(WebSocketClientChannel(uri.host,
        port: uri.port,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure())));
  }

  final String _uri;
  final JsonDecoder _jsonDecoder = JsonDecoder();
  final JsonEncoder _jsonEncoder = JsonEncoder();
  final Uuid _uuid = Uuid();
  final EventEmitter _emitter = EventEmitter();

  grpc.SFUClient _client;
  StreamController<grpc.SignalRequest> _requestStream;
  ResponseStream<grpc.SignalReply> _replyStream;

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
    _replyStream.listen(_onSignalReply);
  }

  @override
  void close() {
    _requestStream.close();
  }

  @override
  Future<RTCSessionDescription> join(String sid, RTCSessionDescription offer) {
    Completer completer = Completer<RTCSessionDescription>();
    var id = _uuid.v4();
    var request = grpc.SignalRequest()
      ..id = id
      ..join = (grpc.JoinRequest()
        ..description = utf8.encode(_jsonEncoder.convert(offer.toMap()))
        ..sid = sid);
    _requestStream.add(request);

    Function(String, dynamic) handler;
    handler = (respid, desc) {
      if (respid == id) {
        completer.complete(desc);
      }
    };
    _emitter.once('description', handler);
    return completer.future;
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
    return completer.future;
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
        ..target = grpc.Trickle_Target.valueOf(trickle.target)
        ..init = _jsonEncoder.convert(trickle.candidate));
    _requestStream.add(reply);
  }
}
