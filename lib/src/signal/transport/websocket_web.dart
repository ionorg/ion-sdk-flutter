// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import '../../logger.dart';
import 'common.dart';

class SimpleWebSocket {
  SimpleWebSocket(this._url) {
    _url = _url.replaceAll('https:', 'wss:');
  }

  String _url;
  var _socket;
  OnOpenCallback onOpen;
  OnMessageCallback onMessage;
  OnCloseCallback onClose;

  void connect() async {
    try {
      _socket = WebSocket(_url);
      _socket.onOpen.listen((e) {
        onOpen?.call();
      });

      _socket.onMessage.listen((e) {
        onMessage?.call(e.data);
      });

      _socket.onClose.listen((e) {
        onClose?.call(e.code, e.reason);
      });
    } catch (e) {
      onClose?.call(500, e.toString());
    }
  }

  void send(data) {
    if (_socket != null && _socket.readyState == WebSocket.OPEN) {
      _socket.send(data);
      log.debug('send: $data');
    } else {
      log.error('WebSocket not connected, message $data not sent');
    }
  }

  void close() {
    _socket?.close();
  }
}
