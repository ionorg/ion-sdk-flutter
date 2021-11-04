///
//  Generated code. Do not modify.
//  source: apps/room/proto/room.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'room.pb.dart' as $0;
export 'room.pb.dart';

class RoomServiceClient extends $grpc.Client {
  static final _$createRoom =
      $grpc.ClientMethod<$0.CreateRoomRequest, $0.CreateRoomReply>(
          '/room.RoomService/CreateRoom',
          ($0.CreateRoomRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateRoomReply.fromBuffer(value));
  static final _$updateRoom =
      $grpc.ClientMethod<$0.UpdateRoomRequest, $0.UpdateRoomReply>(
          '/room.RoomService/UpdateRoom',
          ($0.UpdateRoomRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateRoomReply.fromBuffer(value));
  static final _$endRoom =
      $grpc.ClientMethod<$0.EndRoomRequest, $0.EndRoomReply>(
          '/room.RoomService/EndRoom',
          ($0.EndRoomRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.EndRoomReply.fromBuffer(value));
  static final _$getRooms =
      $grpc.ClientMethod<$0.GetRoomsRequest, $0.GetRoomsReply>(
          '/room.RoomService/GetRooms',
          ($0.GetRoomsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.GetRoomsReply.fromBuffer(value));
  static final _$addPeer =
      $grpc.ClientMethod<$0.AddPeerRequest, $0.AddPeerReply>(
          '/room.RoomService/AddPeer',
          ($0.AddPeerRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.AddPeerReply.fromBuffer(value));
  static final _$updatePeer =
      $grpc.ClientMethod<$0.UpdatePeerRequest, $0.UpdatePeerReply>(
          '/room.RoomService/UpdatePeer',
          ($0.UpdatePeerRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdatePeerReply.fromBuffer(value));
  static final _$removePeer =
      $grpc.ClientMethod<$0.RemovePeerRequest, $0.RemovePeerReply>(
          '/room.RoomService/RemovePeer',
          ($0.RemovePeerRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RemovePeerReply.fromBuffer(value));
  static final _$getPeers =
      $grpc.ClientMethod<$0.GetPeersRequest, $0.GetPeersReply>(
          '/room.RoomService/GetPeers',
          ($0.GetPeersRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.GetPeersReply.fromBuffer(value));

  RoomServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateRoomReply> createRoom(
      $0.CreateRoomRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateRoomReply> updateRoom(
      $0.UpdateRoomRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.EndRoomReply> endRoom($0.EndRoomRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$endRoom, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRoomsReply> getRooms($0.GetRoomsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRooms, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddPeerReply> addPeer($0.AddPeerRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addPeer, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdatePeerReply> updatePeer(
      $0.UpdatePeerRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePeer, request, options: options);
  }

  $grpc.ResponseFuture<$0.RemovePeerReply> removePeer(
      $0.RemovePeerRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removePeer, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPeersReply> getPeers($0.GetPeersRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPeers, request, options: options);
  }
}

abstract class RoomServiceBase extends $grpc.Service {
  $core.String get $name => 'room.RoomService';

  RoomServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateRoomRequest, $0.CreateRoomReply>(
        'CreateRoom',
        createRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateRoomRequest.fromBuffer(value),
        ($0.CreateRoomReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateRoomRequest, $0.UpdateRoomReply>(
        'UpdateRoom',
        updateRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateRoomRequest.fromBuffer(value),
        ($0.UpdateRoomReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EndRoomRequest, $0.EndRoomReply>(
        'EndRoom',
        endRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EndRoomRequest.fromBuffer(value),
        ($0.EndRoomReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRoomsRequest, $0.GetRoomsReply>(
        'GetRooms',
        getRooms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRoomsRequest.fromBuffer(value),
        ($0.GetRoomsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddPeerRequest, $0.AddPeerReply>(
        'AddPeer',
        addPeer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddPeerRequest.fromBuffer(value),
        ($0.AddPeerReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdatePeerRequest, $0.UpdatePeerReply>(
        'UpdatePeer',
        updatePeer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdatePeerRequest.fromBuffer(value),
        ($0.UpdatePeerReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemovePeerRequest, $0.RemovePeerReply>(
        'RemovePeer',
        removePeer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemovePeerRequest.fromBuffer(value),
        ($0.RemovePeerReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPeersRequest, $0.GetPeersReply>(
        'GetPeers',
        getPeers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPeersRequest.fromBuffer(value),
        ($0.GetPeersReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateRoomReply> createRoom_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateRoomRequest> request) async {
    return createRoom(call, await request);
  }

  $async.Future<$0.UpdateRoomReply> updateRoom_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdateRoomRequest> request) async {
    return updateRoom(call, await request);
  }

  $async.Future<$0.EndRoomReply> endRoom_Pre(
      $grpc.ServiceCall call, $async.Future<$0.EndRoomRequest> request) async {
    return endRoom(call, await request);
  }

  $async.Future<$0.GetRoomsReply> getRooms_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetRoomsRequest> request) async {
    return getRooms(call, await request);
  }

  $async.Future<$0.AddPeerReply> addPeer_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AddPeerRequest> request) async {
    return addPeer(call, await request);
  }

  $async.Future<$0.UpdatePeerReply> updatePeer_Pre($grpc.ServiceCall call,
      $async.Future<$0.UpdatePeerRequest> request) async {
    return updatePeer(call, await request);
  }

  $async.Future<$0.RemovePeerReply> removePeer_Pre($grpc.ServiceCall call,
      $async.Future<$0.RemovePeerRequest> request) async {
    return removePeer(call, await request);
  }

  $async.Future<$0.GetPeersReply> getPeers_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetPeersRequest> request) async {
    return getPeers(call, await request);
  }

  $async.Future<$0.CreateRoomReply> createRoom(
      $grpc.ServiceCall call, $0.CreateRoomRequest request);
  $async.Future<$0.UpdateRoomReply> updateRoom(
      $grpc.ServiceCall call, $0.UpdateRoomRequest request);
  $async.Future<$0.EndRoomReply> endRoom(
      $grpc.ServiceCall call, $0.EndRoomRequest request);
  $async.Future<$0.GetRoomsReply> getRooms(
      $grpc.ServiceCall call, $0.GetRoomsRequest request);
  $async.Future<$0.AddPeerReply> addPeer(
      $grpc.ServiceCall call, $0.AddPeerRequest request);
  $async.Future<$0.UpdatePeerReply> updatePeer(
      $grpc.ServiceCall call, $0.UpdatePeerRequest request);
  $async.Future<$0.RemovePeerReply> removePeer(
      $grpc.ServiceCall call, $0.RemovePeerRequest request);
  $async.Future<$0.GetPeersReply> getPeers(
      $grpc.ServiceCall call, $0.GetPeersRequest request);
}

class RoomSignalClient extends $grpc.Client {
  static final _$signal = $grpc.ClientMethod<$0.Request, $0.Reply>(
      '/room.RoomSignal/Signal',
      ($0.Request value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Reply.fromBuffer(value));

  RoomSignalClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.Reply> signal($async.Stream<$0.Request> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$signal, request, options: options);
  }
}

abstract class RoomSignalServiceBase extends $grpc.Service {
  $core.String get $name => 'room.RoomSignal';

  RoomSignalServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Request, $0.Reply>(
        'Signal',
        signal,
        true,
        true,
        ($core.List<$core.int> value) => $0.Request.fromBuffer(value),
        ($0.Reply value) => value.writeToBuffer()));
  }

  $async.Stream<$0.Reply> signal(
      $grpc.ServiceCall call, $async.Stream<$0.Request> request);
}
