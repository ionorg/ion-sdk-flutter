import 'package:grpc/grpc.dart';

ClientChannel createChannel(String host, int port, bool secure,
    {List<int>? certificates, String? authority, String? password}) {
  return ClientChannel(host, // Your IP here or localhost
      port: port,
      options: ChannelOptions(
        credentials: secure
            ? ChannelCredentials.secure(
                certificates: certificates,
                authority: authority,
                password: password)
            : ChannelCredentials.insecure(),
        idleTimeout: Duration(seconds: 1),
      ));
}
