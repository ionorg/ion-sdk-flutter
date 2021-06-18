///
//  Generated code. Do not modify.
//  source: proto/sfu/sfu.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'sfu.pb.dart' as $0;
export 'sfu.pb.dart';

class SFUClient extends $grpc.Client {
  static final _$signal = $grpc.ClientMethod<$0.SignalRequest, $0.SignalReply>(
      '/sfu.SFU/Signal',
      ($0.SignalRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SignalReply.fromBuffer(value));

  SFUClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.SignalReply> signal(
      $async.Stream<$0.SignalRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$signal, request, options: options);
  }
}

abstract class SFUServiceBase extends $grpc.Service {
  $core.String get $name => 'sfu.SFU';

  SFUServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SignalRequest, $0.SignalReply>(
        'Signal',
        signal,
        true,
        true,
        ($core.List<$core.int> value) => $0.SignalRequest.fromBuffer(value),
        ($0.SignalReply value) => value.writeToBuffer()));
  }

  $async.Stream<$0.SignalReply> signal(
      $grpc.ServiceCall call, $async.Stream<$0.SignalRequest> request);
}
