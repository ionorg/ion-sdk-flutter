///
//  Generated code. Do not modify.
//  source: proto/room/room.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'room.pb.dart' as $0;
export 'room.pb.dart';

class RoomClient extends $grpc.Client {
  static final _$join = $grpc.ClientMethod<$0.JoinRequest, $0.JoinReply>(
      '/room.Room/Join',
      ($0.JoinRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.JoinReply.fromBuffer(value));
  static final _$leave = $grpc.ClientMethod<$0.LeaveRequest, $0.LeaveReply>(
      '/room.Room/Leave',
      ($0.LeaveRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LeaveReply.fromBuffer(value));
  static final _$getParticipants =
      $grpc.ClientMethod<$0.Empty, $0.GetParticipantsReply>(
          '/room.Room/GetParticipants',
          ($0.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetParticipantsReply.fromBuffer(value));
  static final _$receiveNotification =
      $grpc.ClientMethod<$0.Empty, $0.Notification>(
          '/room.Room/ReceiveNotification',
          ($0.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Notification.fromBuffer(value));
  static final _$setImportance =
      $grpc.ClientMethod<$0.SetImportanceRequest, $0.SetImportanceReply>(
          '/room.Room/SetImportance',
          ($0.SetImportanceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SetImportanceReply.fromBuffer(value));
  static final _$lockConference =
      $grpc.ClientMethod<$0.LockConferenceRequest, $0.LockConferenceReply>(
          '/room.Room/LockConference',
          ($0.LockConferenceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.LockConferenceReply.fromBuffer(value));
  static final _$endConference =
      $grpc.ClientMethod<$0.EndConferenceRequest, $0.EndConferenceReply>(
          '/room.Room/EndConference',
          ($0.EndConferenceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.EndConferenceReply.fromBuffer(value));
  static final _$editParticipantInfo = $grpc.ClientMethod<
          $0.EditParticipantInfoRequest, $0.EditParticipantInfoReply>(
      '/room.Room/EditParticipantInfo',
      ($0.EditParticipantInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.EditParticipantInfoReply.fromBuffer(value));
  static final _$addParticipant =
      $grpc.ClientMethod<$0.AddParticipantRequest, $0.AddParticipantReply>(
          '/room.Room/AddParticipant',
          ($0.AddParticipantRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AddParticipantReply.fromBuffer(value));
  static final _$removeParticipant = $grpc.ClientMethod<
          $0.RemoveParticipantRequest, $0.RemoveParticipantReply>(
      '/room.Room/RemoveParticipant',
      ($0.RemoveParticipantRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.RemoveParticipantReply.fromBuffer(value));
  static final _$sendMessage =
      $grpc.ClientMethod<$0.SendMessageRequest, $0.SendMessageReply>(
          '/room.Room/SendMessage',
          ($0.SendMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SendMessageReply.fromBuffer(value));

  RoomClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.JoinReply> join($0.JoinRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$join, request, options: options);
  }

  $grpc.ResponseFuture<$0.LeaveReply> leave($0.LeaveRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$leave, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetParticipantsReply> getParticipants(
      $0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getParticipants, request, options: options);
  }

  $grpc.ResponseStream<$0.Notification> receiveNotification($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$receiveNotification, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.SetImportanceReply> setImportance(
      $0.SetImportanceRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setImportance, request, options: options);
  }

  $grpc.ResponseFuture<$0.LockConferenceReply> lockConference(
      $0.LockConferenceRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$lockConference, request, options: options);
  }

  $grpc.ResponseFuture<$0.EndConferenceReply> endConference(
      $0.EndConferenceRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$endConference, request, options: options);
  }

  $grpc.ResponseFuture<$0.EditParticipantInfoReply> editParticipantInfo(
      $0.EditParticipantInfoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editParticipantInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddParticipantReply> addParticipant(
      $0.AddParticipantRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addParticipant, request, options: options);
  }

  $grpc.ResponseFuture<$0.RemoveParticipantReply> removeParticipant(
      $0.RemoveParticipantRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeParticipant, request, options: options);
  }

  $grpc.ResponseFuture<$0.SendMessageReply> sendMessage(
      $0.SendMessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendMessage, request, options: options);
  }
}

abstract class RoomServiceBase extends $grpc.Service {
  $core.String get $name => 'room.Room';

  RoomServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.JoinRequest, $0.JoinReply>(
        'Join',
        join_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.JoinRequest.fromBuffer(value),
        ($0.JoinReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LeaveRequest, $0.LeaveReply>(
        'Leave',
        leave_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LeaveRequest.fromBuffer(value),
        ($0.LeaveReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.GetParticipantsReply>(
        'GetParticipants',
        getParticipants_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.GetParticipantsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Notification>(
        'ReceiveNotification',
        receiveNotification_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Notification value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.SetImportanceRequest, $0.SetImportanceReply>(
            'SetImportance',
            setImportance_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.SetImportanceRequest.fromBuffer(value),
            ($0.SetImportanceReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.LockConferenceRequest, $0.LockConferenceReply>(
            'LockConference',
            lockConference_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.LockConferenceRequest.fromBuffer(value),
            ($0.LockConferenceReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.EndConferenceRequest, $0.EndConferenceReply>(
            'EndConference',
            endConference_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.EndConferenceRequest.fromBuffer(value),
            ($0.EndConferenceReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EditParticipantInfoRequest,
            $0.EditParticipantInfoReply>(
        'EditParticipantInfo',
        editParticipantInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.EditParticipantInfoRequest.fromBuffer(value),
        ($0.EditParticipantInfoReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.AddParticipantRequest, $0.AddParticipantReply>(
            'AddParticipant',
            addParticipant_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.AddParticipantRequest.fromBuffer(value),
            ($0.AddParticipantReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveParticipantRequest,
            $0.RemoveParticipantReply>(
        'RemoveParticipant',
        removeParticipant_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RemoveParticipantRequest.fromBuffer(value),
        ($0.RemoveParticipantReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendMessageRequest, $0.SendMessageReply>(
        'SendMessage',
        sendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SendMessageRequest.fromBuffer(value),
        ($0.SendMessageReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.JoinReply> join_Pre(
      $grpc.ServiceCall call, $async.Future<$0.JoinRequest> request) async {
    return join(call, await request);
  }

  $async.Future<$0.LeaveReply> leave_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LeaveRequest> request) async {
    return leave(call, await request);
  }

  $async.Future<$0.GetParticipantsReply> getParticipants_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getParticipants(call, await request);
  }

  $async.Stream<$0.Notification> receiveNotification_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async* {
    yield* receiveNotification(call, await request);
  }

  $async.Future<$0.SetImportanceReply> setImportance_Pre($grpc.ServiceCall call,
      $async.Future<$0.SetImportanceRequest> request) async {
    return setImportance(call, await request);
  }

  $async.Future<$0.LockConferenceReply> lockConference_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.LockConferenceRequest> request) async {
    return lockConference(call, await request);
  }

  $async.Future<$0.EndConferenceReply> endConference_Pre($grpc.ServiceCall call,
      $async.Future<$0.EndConferenceRequest> request) async {
    return endConference(call, await request);
  }

  $async.Future<$0.EditParticipantInfoReply> editParticipantInfo_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.EditParticipantInfoRequest> request) async {
    return editParticipantInfo(call, await request);
  }

  $async.Future<$0.AddParticipantReply> addParticipant_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.AddParticipantRequest> request) async {
    return addParticipant(call, await request);
  }

  $async.Future<$0.RemoveParticipantReply> removeParticipant_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RemoveParticipantRequest> request) async {
    return removeParticipant(call, await request);
  }

  $async.Future<$0.SendMessageReply> sendMessage_Pre($grpc.ServiceCall call,
      $async.Future<$0.SendMessageRequest> request) async {
    return sendMessage(call, await request);
  }

  $async.Future<$0.JoinReply> join(
      $grpc.ServiceCall call, $0.JoinRequest request);
  $async.Future<$0.LeaveReply> leave(
      $grpc.ServiceCall call, $0.LeaveRequest request);
  $async.Future<$0.GetParticipantsReply> getParticipants(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Stream<$0.Notification> receiveNotification(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.SetImportanceReply> setImportance(
      $grpc.ServiceCall call, $0.SetImportanceRequest request);
  $async.Future<$0.LockConferenceReply> lockConference(
      $grpc.ServiceCall call, $0.LockConferenceRequest request);
  $async.Future<$0.EndConferenceReply> endConference(
      $grpc.ServiceCall call, $0.EndConferenceRequest request);
  $async.Future<$0.EditParticipantInfoReply> editParticipantInfo(
      $grpc.ServiceCall call, $0.EditParticipantInfoRequest request);
  $async.Future<$0.AddParticipantReply> addParticipant(
      $grpc.ServiceCall call, $0.AddParticipantRequest request);
  $async.Future<$0.RemoveParticipantReply> removeParticipant(
      $grpc.ServiceCall call, $0.RemoveParticipantRequest request);
  $async.Future<$0.SendMessageReply> sendMessage(
      $grpc.ServiceCall call, $0.SendMessageRequest request);
}
