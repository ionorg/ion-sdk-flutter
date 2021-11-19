import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:grpc/grpc.dart';
import 'package:grpc/src/client/call.dart';
import 'package:grpc/src/client/connection.dart';
import 'package:grpc/src/client/transport/transport.dart';
import 'package:grpc/src/client/transport/web_streams.dart';
import 'package:grpc/src/shared/message.dart';
import 'package:web_socket_channel/html.dart';

class WebSocketTransportStream implements GrpcTransportStream {
  final ErrorHandler _onError;
  final Function(WebSocketTransportStream stream) _onDone;
  final StreamController<ByteBuffer> _incomingProcessor = StreamController();
  final StreamController<GrpcMessage> _incomingMessages = StreamController();
  final StreamController<List<int>> _outgoingMessages = StreamController();
  late HtmlWebSocketChannel _channel;
  final Map<String, String> _metadata;
  final Completer<bool> _firstMessageReceived = Completer();
  final Uri _uri;

  @override
  Stream<GrpcMessage> get incomingMessages => _incomingMessages.stream;

  @override
  StreamSink<List<int>> get outgoingMessages => _outgoingMessages.sink;

  WebSocketTransportStream(this._uri, this._metadata, {onError, onDone})
      : _onError = onError,
        _onDone = onDone {
    _incomingProcessor.stream
        .transform(GrpcWebDecoder())
        .transform(grpcDecompressor())
        .listen((event) {
      if (event is GrpcMetadata) {
        final metadata = event.metadata;
        if (metadata.containsKey('grpc-status')) {
          _close();
        }
        //print(event.toString());
      }
      _incomingMessages.add(event);
    }, onError: _onError, onDone: _incomingMessages.close);

    _runRequest();
  }

  Future<void> _runRequest() async {
    if (_incomingMessages.isClosed) {
      return;
    }

    _channel =
        HtmlWebSocketChannel.connect(_uri, protocols: ['grpc-websockets']);
    _metadata.addAll({
      'content-type': 'application/grpc-web+proto',
      'x-grpc-web': '1',
    });
    // Force a metadata message with headers.
    _channel.sink.add(headersToBytes(_metadata));

    _outgoingMessages.stream.listen((message) {
      final frame = ByteData(message.length + 6);
      frame.setUint32(2, message.length);
      var idx = 6;
      for (var i = 0; i < message.length; i++) {
        frame.setUint8(idx++, message[i]);
      }
      _channel.sink.add(frame);
    });

    _channel.stream.listen((message) async {
      final listBuffer = <int>[];
      for (var i = 0; i < message.length; i++) {
        listBuffer.add(message[i]);
      }
      _incomingProcessor.add(Uint8List.fromList(listBuffer).buffer);
    }, onDone: _onDone(this), onError: _onError);
  }

  final Uint8List finishSendFrame = Uint8List.fromList([1]);

  final AsciiCodec ascii = AsciiCodec();

  Uint8List headersToBytes(Map<String, String> headers) {
    var asString = '';
    headers.forEach((key, value) {
      asString += '$key: $value\r\n';
    });
    return ascii.encoder.convert(asString);
  }

  void _close() {
    if (!_firstMessageReceived.isCompleted) {
      _firstMessageReceived.complete(false);
    }
    _incomingProcessor.close();
    _outgoingMessages.close();
    _onDone(this);
  }

  @override
  Future<void> terminate() async {
    _channel.sink.add(finishSendFrame);
    _close();
  }
}

class WebSocketClientConnection extends ClientConnection {
  final String host;
  final int? port;
  final ChannelOptions options;
  final Set<WebSocketTransportStream> _requests = <WebSocketTransportStream>{};

  WebSocketClientConnection(this.host, this.port, {required this.options})
      : assert(host.isNotEmpty == true),
        assert(port == null || port > 0);

  @override
  String get authority =>
      '$host:${port ?? (options.credentials.isSecure ? 443 : 80)}';

  @override
  String get scheme => "ws${options.credentials.isSecure ? "s" : ""}";

/*
  void _initializeRequest(
      IOWebSocketChannel channel, Map<String, String> metadata) {
    for (final header in metadata.keys) {
      request.headers.add(header, metadata[header]);
    }
    request.headers.add('Content-Type', 'application/grpc-web+proto');
    request.headers.add('X-User-Agent', 'grpc-web-dart/0.1');
    request.headers.add('X-Grpc-Web', '1');
  }
*/

  @override
  GrpcTransportStream makeRequest(String path, Duration? timeout,
      Map<String, String> metadata, ErrorHandler onRequestFailure,
      {required CallOptions callOptions}) {
    final uri = Uri.parse('$scheme://$host:$port$path');
    final transportStream = WebSocketTransportStream(uri, metadata,
        onError: onRequestFailure, onDone: _removeStream);
    _requests.add(transportStream);
    return transportStream;
  }

  void _removeStream(WebSocketTransportStream stream) {
    _requests.remove(stream);
  }

  @override
  Future<void> terminate() async {
    for (var request in _requests) {
      await request.terminate();
    }
  }

  @override
  void dispatchCall(ClientCall call) {
    call.onConnectionReady(this);
  }

  @override
  Future<void> shutdown() async {}
}
