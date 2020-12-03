import 'package:grpc/grpc.dart';
import 'package:grpc/src/client/connection.dart';
import 'transport/websocket_transport.dart';

class WebSocketClientChannel extends ClientChannel {
  @override
  final String host;
  @override
  final int port;
  @override
  final ChannelOptions options;

  WebSocketClientChannel(this.host, {this.port, this.options})
      : assert(host?.isNotEmpty == true),
        super(host, port: port, options: options);

  @override
  ClientConnection createConnection() {
    return WebSocketClientConnection(host, port, options: options);
  }
}
