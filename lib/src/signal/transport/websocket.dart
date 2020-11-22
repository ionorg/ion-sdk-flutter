import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import '../../logger.dart';
import 'common.dart';

class SimpleWebSocket {
  SimpleWebSocket(this._url);

  final String _url;
  var _socket;

  OnOpenCallback onOpen;
  OnMessageCallback onMessage;
  OnCloseCallback onClose;

  void connect() async {
    try {
      //_socket = await WebSocket.connect(_url);
      _socket = await _connectForSelfSignedCert(_url);
      onOpen?.call();
      _socket.listen((data) {
        onMessage?.call(data);
      }, onDone: () {
        onClose?.call(_socket.closeCode, _socket.closeReason);
      });
    } catch (e) {
      print('connect: error => $e');
      onClose?.call(500, e.toString());
    }
  }

  void send(data) {
    if (_socket != null) {
      _socket.add(data);
      log.debug('send: $data');
    }
  }

  void close() {
    _socket?.close();
  }

  Future<WebSocket> _connectForSelfSignedCert(url) async {
    try {
      var r = Random();
      var key = base64.encode(List<int>.generate(8, (_) => r.nextInt(255)));
      var client = HttpClient(context: SecurityContext());
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        log.debug(
            'SimpleWebSocket: Allow self-signed certificate => $host:$port. ');
        return true;
      };

      var parsed_uri = Uri.parse(url);
      var uri = parsed_uri.replace(
          scheme: parsed_uri.scheme == 'wss' ? 'https' : 'http');

      var request = await client.getUrl(uri); // form the correct url here
      request.headers.add('Connection', 'Upgrade');
      request.headers.add('Upgrade', 'websocket');
      request.headers.add(
          'Sec-WebSocket-Version', '13'); // insert the correct version here
      request.headers.add('Sec-WebSocket-Key', key.toLowerCase());

      var response = await request.close();
      // ignore: close_sinks
      var socket = await response.detachSocket();
      var webSocket = WebSocket.fromUpgradedSocket(
        socket,
        protocol: 'signaling',
        serverSide: false,
      );

      return webSocket;
    } catch (e) {
      log.error(e);
      rethrow;
    }
  }
}
