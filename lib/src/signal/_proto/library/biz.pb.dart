///
//  Generated code. Do not modify.
//  source: biz.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'ion.pb.dart' as $2;

class Join extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Join', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'biz'), createEmptyInstance: create)
    ..aOM<$2.Peer>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'peer', subBuilder: $2.Peer.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..hasRequiredFields = false
  ;

  Join._() : super();
  factory Join({
    $2.Peer? peer,
    $core.String? token,
  }) {
    final _result = create();
    if (peer != null) {
      _result.peer = peer;
    }
    if (token != null) {
      _result.token = token;
    }
    return _result;
  }
  factory Join.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Join.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Join clone() => Join()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Join copyWith(void Function(Join) updates) => super.copyWith((message) => updates(message as Join)) as Join; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Join create() => Join._();
  Join createEmptyInstance() => create();
  static $pb.PbList<Join> createRepeated() => $pb.PbList<Join>();
  @$core.pragma('dart2js:noInline')
  static Join getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Join>(create);
  static Join? _defaultInstance;

  @$pb.TagNumber(1)
  $2.Peer get peer => $_getN(0);
  @$pb.TagNumber(1)
  set peer($2.Peer v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeer() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeer() => clearField(1);
  @$pb.TagNumber(1)
  $2.Peer ensurePeer() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);
}

class JoinReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'JoinReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'biz'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reason')
    ..hasRequiredFields = false
  ;

  JoinReply._() : super();
  factory JoinReply({
    $core.bool? success,
    $core.String? reason,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (reason != null) {
      _result.reason = reason;
    }
    return _result;
  }
  factory JoinReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoinReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JoinReply clone() => JoinReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JoinReply copyWith(void Function(JoinReply) updates) => super.copyWith((message) => updates(message as JoinReply)) as JoinReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JoinReply create() => JoinReply._();
  JoinReply createEmptyInstance() => create();
  static $pb.PbList<JoinReply> createRepeated() => $pb.PbList<JoinReply>();
  @$core.pragma('dart2js:noInline')
  static JoinReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinReply>(create);
  static JoinReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get reason => $_getSZ(1);
  @$pb.TagNumber(2)
  set reason($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => clearField(2);
}

class Leave extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Leave', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'biz'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  Leave._() : super();
  factory Leave({
    $core.String? uid,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    return _result;
  }
  factory Leave.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Leave.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Leave clone() => Leave()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Leave copyWith(void Function(Leave) updates) => super.copyWith((message) => updates(message as Leave)) as Leave; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Leave create() => Leave._();
  Leave createEmptyInstance() => create();
  static $pb.PbList<Leave> createRepeated() => $pb.PbList<Leave>();
  @$core.pragma('dart2js:noInline')
  static Leave getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Leave>(create);
  static Leave? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);
}

class LeaveReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LeaveReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'biz'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reason')
    ..hasRequiredFields = false
  ;

  LeaveReply._() : super();
  factory LeaveReply({
    $core.String? reason,
  }) {
    final _result = create();
    if (reason != null) {
      _result.reason = reason;
    }
    return _result;
  }
  factory LeaveReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LeaveReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LeaveReply clone() => LeaveReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LeaveReply copyWith(void Function(LeaveReply) updates) => super.copyWith((message) => updates(message as LeaveReply)) as LeaveReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LeaveReply create() => LeaveReply._();
  LeaveReply createEmptyInstance() => create();
  static $pb.PbList<LeaveReply> createRepeated() => $pb.PbList<LeaveReply>();
  @$core.pragma('dart2js:noInline')
  static LeaveReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LeaveReply>(create);
  static LeaveReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reason => $_getSZ(0);
  @$pb.TagNumber(1)
  set reason($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReason() => $_has(0);
  @$pb.TagNumber(1)
  void clearReason() => clearField(1);
}

enum SignalRequest_Payload {
  join, 
  leave, 
  msg, 
  notSet
}

class SignalRequest extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, SignalRequest_Payload> _SignalRequest_PayloadByTag = {
    1 : SignalRequest_Payload.join,
    2 : SignalRequest_Payload.leave,
    4 : SignalRequest_Payload.msg,
    0 : SignalRequest_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignalRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'biz'), createEmptyInstance: create)
    ..oo(0, [1, 2, 4])
    ..aOM<Join>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'join', subBuilder: Join.create)
    ..aOM<Leave>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'leave', subBuilder: Leave.create)
    ..aOM<$2.Message>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msg', subBuilder: $2.Message.create)
    ..hasRequiredFields = false
  ;

  SignalRequest._() : super();
  factory SignalRequest({
    Join? join,
    Leave? leave,
    $2.Message? msg,
  }) {
    final _result = create();
    if (join != null) {
      _result.join = join;
    }
    if (leave != null) {
      _result.leave = leave;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory SignalRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignalRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignalRequest clone() => SignalRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignalRequest copyWith(void Function(SignalRequest) updates) => super.copyWith((message) => updates(message as SignalRequest)) as SignalRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignalRequest create() => SignalRequest._();
  SignalRequest createEmptyInstance() => create();
  static $pb.PbList<SignalRequest> createRepeated() => $pb.PbList<SignalRequest>();
  @$core.pragma('dart2js:noInline')
  static SignalRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignalRequest>(create);
  static SignalRequest? _defaultInstance;

  SignalRequest_Payload whichPayload() => _SignalRequest_PayloadByTag[$_whichOneof(0)]!;
  void clearPayload() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Join get join => $_getN(0);
  @$pb.TagNumber(1)
  set join(Join v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasJoin() => $_has(0);
  @$pb.TagNumber(1)
  void clearJoin() => clearField(1);
  @$pb.TagNumber(1)
  Join ensureJoin() => $_ensure(0);

  @$pb.TagNumber(2)
  Leave get leave => $_getN(1);
  @$pb.TagNumber(2)
  set leave(Leave v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLeave() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeave() => clearField(2);
  @$pb.TagNumber(2)
  Leave ensureLeave() => $_ensure(1);

  @$pb.TagNumber(4)
  $2.Message get msg => $_getN(2);
  @$pb.TagNumber(4)
  set msg($2.Message v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMsg() => $_has(2);
  @$pb.TagNumber(4)
  void clearMsg() => clearField(4);
  @$pb.TagNumber(4)
  $2.Message ensureMsg() => $_ensure(2);
}

enum SignalReply_Payload {
  joinReply, 
  leaveReply, 
  peerEvent, 
  streamEvent, 
  msg, 
  notSet
}

class SignalReply extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, SignalReply_Payload> _SignalReply_PayloadByTag = {
    1 : SignalReply_Payload.joinReply,
    2 : SignalReply_Payload.leaveReply,
    3 : SignalReply_Payload.peerEvent,
    4 : SignalReply_Payload.streamEvent,
    5 : SignalReply_Payload.msg,
    0 : SignalReply_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignalReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'biz'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<JoinReply>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'joinReply', protoName: 'joinReply', subBuilder: JoinReply.create)
    ..aOM<LeaveReply>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'leaveReply', protoName: 'leaveReply', subBuilder: LeaveReply.create)
    ..aOM<$2.PeerEvent>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'peerEvent', protoName: 'peerEvent', subBuilder: $2.PeerEvent.create)
    ..aOM<$2.StreamEvent>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'streamEvent', protoName: 'streamEvent', subBuilder: $2.StreamEvent.create)
    ..aOM<$2.Message>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'msg', subBuilder: $2.Message.create)
    ..hasRequiredFields = false
  ;

  SignalReply._() : super();
  factory SignalReply({
    JoinReply? joinReply,
    LeaveReply? leaveReply,
    $2.PeerEvent? peerEvent,
    $2.StreamEvent? streamEvent,
    $2.Message? msg,
  }) {
    final _result = create();
    if (joinReply != null) {
      _result.joinReply = joinReply;
    }
    if (leaveReply != null) {
      _result.leaveReply = leaveReply;
    }
    if (peerEvent != null) {
      _result.peerEvent = peerEvent;
    }
    if (streamEvent != null) {
      _result.streamEvent = streamEvent;
    }
    if (msg != null) {
      _result.msg = msg;
    }
    return _result;
  }
  factory SignalReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignalReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignalReply clone() => SignalReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignalReply copyWith(void Function(SignalReply) updates) => super.copyWith((message) => updates(message as SignalReply)) as SignalReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignalReply create() => SignalReply._();
  SignalReply createEmptyInstance() => create();
  static $pb.PbList<SignalReply> createRepeated() => $pb.PbList<SignalReply>();
  @$core.pragma('dart2js:noInline')
  static SignalReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignalReply>(create);
  static SignalReply? _defaultInstance;

  SignalReply_Payload whichPayload() => _SignalReply_PayloadByTag[$_whichOneof(0)]!;
  void clearPayload() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  JoinReply get joinReply => $_getN(0);
  @$pb.TagNumber(1)
  set joinReply(JoinReply v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasJoinReply() => $_has(0);
  @$pb.TagNumber(1)
  void clearJoinReply() => clearField(1);
  @$pb.TagNumber(1)
  JoinReply ensureJoinReply() => $_ensure(0);

  @$pb.TagNumber(2)
  LeaveReply get leaveReply => $_getN(1);
  @$pb.TagNumber(2)
  set leaveReply(LeaveReply v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLeaveReply() => $_has(1);
  @$pb.TagNumber(2)
  void clearLeaveReply() => clearField(2);
  @$pb.TagNumber(2)
  LeaveReply ensureLeaveReply() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.PeerEvent get peerEvent => $_getN(2);
  @$pb.TagNumber(3)
  set peerEvent($2.PeerEvent v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPeerEvent() => $_has(2);
  @$pb.TagNumber(3)
  void clearPeerEvent() => clearField(3);
  @$pb.TagNumber(3)
  $2.PeerEvent ensurePeerEvent() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.StreamEvent get streamEvent => $_getN(3);
  @$pb.TagNumber(4)
  set streamEvent($2.StreamEvent v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStreamEvent() => $_has(3);
  @$pb.TagNumber(4)
  void clearStreamEvent() => clearField(4);
  @$pb.TagNumber(4)
  $2.StreamEvent ensureStreamEvent() => $_ensure(3);

  @$pb.TagNumber(5)
  $2.Message get msg => $_getN(4);
  @$pb.TagNumber(5)
  set msg($2.Message v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasMsg() => $_has(4);
  @$pb.TagNumber(5)
  void clearMsg() => clearField(5);
  @$pb.TagNumber(5)
  $2.Message ensureMsg() => $_ensure(4);
}

