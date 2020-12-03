import 'package:grpc/grpc.dart';
import 'websocket_channel.dart';

ClientChannel createChannel(String host, int port) {
  return WebSocketClientChannel(host,
      port: port,
      options:
          const ChannelOptions(credentials: ChannelCredentials.insecure()));
}
