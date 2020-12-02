import 'package:grpc/grpc.dart';

ClientChannel createChannel(String host, int port) {
  return ClientChannel(
    host, // Your IP here or localhost
    port: port,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      idleTimeout: Duration(seconds: 1),
    ),
  );
}
