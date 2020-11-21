import 'dart:async';
import 'dart:convert';

import 'package:events2/events2.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:uuid/uuid.dart';

import '../logger.dart';
import 'signal.dart';
import 'transport/websocket.dart'
    if (dart.library.js) 'transport/websocket_web.dart';

class JsonRPCSignal extends Signal {
  JsonRPCSignal(this._uri) {
    _socket = SimpleWebSocket(_uri);

    _socket.onOpen = () => onready?.call();

    _socket.onClose = (int code, String reason) => onclose?.call(code, reason);

    _socket.onMessage = (msg) => _onmessage(msg);
  }

  final String _uri;
  final JsonDecoder _jsonDecoder = JsonDecoder();
  final JsonEncoder _jsonEncoder = JsonEncoder();
  final Uuid _uuid = Uuid();
  final EventEmitter _emitter = EventEmitter();
  SimpleWebSocket _socket;

  void _onmessage(msg) {
    log.debug('msg: $msg');
    try {
      var resp = _jsonDecoder.convert(msg);
      if (resp['method'] != null || resp['result'] != null) {
        if (resp['method'] == 'offer') {
          onnegotiate?.call(RTCSessionDescription(
              resp['params']['sdp'], resp['params']['type']));
        } else if (resp['method'] == 'trickle') {
          ontrickle?.call(Trickle.fromMap(resp['params']));
        } else {
          _emitter.emit('message', resp);
        }
      } else if (resp['error'] != null) {
        var code = resp['error']['code'];
        var message = resp['error']['message'];
        log.error('error: code => $code, message => $message');
      }
    } catch (e) {
      log.error('onmessage: err => $e');
    }
  }

  @override
  void connect() {
    _socket.connect();
  }

  @override
  void close() {
    _socket.close();
  }

  @override
  Future<RTCSessionDescription> join(String sid, RTCSessionDescription offer) {
    Completer completer = Completer<RTCSessionDescription>();
    var id = _uuid.v4();
    _socket.send(_jsonEncoder.convert(<String, dynamic>{
      'method': 'join',
      'params': {'sid': sid, 'offer': offer.toMap()},
      'id': id
    }));

    Function(dynamic) handler;
    handler = (resp) {
      if (resp['id'] == id) {
        completer.complete(RTCSessionDescription(
            resp['result']['sdp'], resp['result']['type']));
      }
    };
    _emitter.once('message', handler);
    return completer.future;
  }

  @override
  Future<RTCSessionDescription> offer(RTCSessionDescription offer) {
    Completer completer = Completer<RTCSessionDescription>();
    var id = _uuid.v4();
    _socket.send(_jsonEncoder.convert(<String, dynamic>{
      'method': 'offer',
      'params': {'desc': offer.toMap()},
      'id': id
    }));

    Function(dynamic) handler;
    handler = (resp) {
      if (resp['id'] == id) {
        completer.complete(RTCSessionDescription(
            resp['result']['sdp'], resp['result']['type']));
      }
    };
    _emitter.once('message', handler);
    return completer.future;
  }

  @override
  void answer(RTCSessionDescription answer) {
    _socket.send(_jsonEncoder.convert(<String, dynamic>{
      'method': 'answer',
      'params': {'desc': answer.toMap()},
    }));
  }

  @override
  void trickle(Trickle trickle) {
    _socket.send(_jsonEncoder.convert(<String, dynamic>{
      'method': 'trickle',
      'params': trickle.toMap(),
    }));
  }
}
