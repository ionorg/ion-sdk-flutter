///
//  Generated code. Do not modify.
//  source: sfu.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'sfu.pb.dart' as $1;
export 'sfu.pb.dart';

class SFUClient extends $grpc.Client {
  static final _$signal = $grpc.ClientMethod<$1.SignalRequest, $1.SignalReply>(
      '/sfu.SFU/Signal',
      ($1.SignalRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.SignalReply.fromBuffer(value));

  SFUClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$1.SignalReply> signal(
      $async.Stream<$1.SignalRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$signal, request, options: options);
  }
}

abstract class SFUServiceBase extends $grpc.Service {
  $core.String get $name => 'sfu.SFU';

  SFUServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.SignalRequest, $1.SignalReply>(
        'Signal',
        signal,
        true,
        true,
        ($core.List<$core.int> value) => $1.SignalRequest.fromBuffer(value),
        ($1.SignalReply value) => value.writeToBuffer()));
  }

  $async.Stream<$1.SignalReply> signal(
      $grpc.ServiceCall call, $async.Stream<$1.SignalRequest> request);
}
