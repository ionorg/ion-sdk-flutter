import 'dart:async';
import 'package:grpc/grpc.dart' as grpc;
import '../signal/grpc-web/_channel.dart'
    if (dart.library.html) '../signal/grpc-web/_channel_html.dart';

abstract class Service {
  late String name;
  Future<void> connect();
  bool connected = false;
  void close();
}

class Connector {
  final String _uri;
  Map<String, String> metadata = <String, String>{};
  Map<String, String> trailers = <String, String>{};
  Map<String, Service> services = <String, Service>{};
  void Function(Service service)? onopen;
  void Function(Service service, grpc.GrpcError? err)? onclose;

  Connector(this._uri, {String? token}) {
    if (token != null) {
      metadata['authorization'] = token;
    }
  }

  grpc.ClientChannel grpcClientChannel() {
    var uri = Uri.parse(_uri);
    return createChannel(uri.host, uri.port, uri.scheme == 'https');
  }

  grpc.CallOptions callOptions() {
    return grpc.CallOptions(
      metadata: metadata,
    );
  }

  void close() {
    services.forEach((String name, Service service) {
      if (service.connected) {
        service.close();
      }
    });
  }

  void onHeaders(Service service, Map<String, String> headers) {
    print('Received header for ${service.name}  metadata: $headers');
    // Merge metadata.
    headers.forEach((key, value) {
      if (key.toLowerCase() != 'trailer' &&
          key.toLowerCase() != 'content-type') {
        metadata[key] = value;
      }
    });
    service.connected = true;
    onopen?.call(service);
  }

  void onTrailers(Service service, Map<String, String> trailers) {
    print('Received trailer for ${service.name} metadata: $trailers');
    // Merge trailers.
    trailers.forEach((key, value) {
      this.trailers[key] = value;
    });
  }

  void onClosed(Service service) {
    service.connected = false;
    onclose?.call(service, null);
  }

  void onError(Service service, grpc.GrpcError err) {
    service.connected = false;
    onclose?.call(service, err);
  }

  void registerService(Service service) {
    services[service.name] = service;
  }
}
