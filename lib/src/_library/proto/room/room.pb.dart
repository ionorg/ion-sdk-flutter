///
//  Generated code. Do not modify.
//  source: proto/room/room.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'room.pbenum.dart';

export 'room.pbenum.dart';

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Empty',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) =>
      super.copyWith((message) => updates(message as Empty))
          as Empty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class JoinRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JoinRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'displayName',
        protoName: 'displayName')
    ..a<$core.List<$core.int>>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extraInfo', $pb.PbFieldType.OY,
        protoName: 'extraInfo')
    ..e<Role>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role', $pb.PbFieldType.OE,
        defaultOrMaker: Role.RoleHost,
        valueOf: Role.valueOf,
        enumValues: Role.values)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatar')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vendor')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..hasRequiredFields = false;

  JoinRequest._() : super();
  factory JoinRequest({
    $core.String? uid,
    $core.String? displayName,
    $core.List<$core.int>? extraInfo,
    Role? role,
    $core.String? avatar,
    $core.String? vendor,
    $core.String? token,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (displayName != null) {
      _result.displayName = displayName;
    }
    if (extraInfo != null) {
      _result.extraInfo = extraInfo;
    }
    if (role != null) {
      _result.role = role;
    }
    if (avatar != null) {
      _result.avatar = avatar;
    }
    if (vendor != null) {
      _result.vendor = vendor;
    }
    if (token != null) {
      _result.token = token;
    }
    return _result;
  }
  factory JoinRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JoinRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JoinRequest clone() => JoinRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JoinRequest copyWith(void Function(JoinRequest) updates) =>
      super.copyWith((message) => updates(message as JoinRequest))
          as JoinRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JoinRequest create() => JoinRequest._();
  JoinRequest createEmptyInstance() => create();
  static $pb.PbList<JoinRequest> createRepeated() => $pb.PbList<JoinRequest>();
  @$core.pragma('dart2js:noInline')
  static JoinRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JoinRequest>(create);
  static JoinRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get displayName => $_getSZ(1);
  @$pb.TagNumber(2)
  set displayName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDisplayName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplayName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get extraInfo => $_getN(2);
  @$pb.TagNumber(3)
  set extraInfo($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasExtraInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearExtraInfo() => clearField(3);

  @$pb.TagNumber(4)
  Role get role => $_getN(3);
  @$pb.TagNumber(4)
  set role(Role v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearRole() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get avatar => $_getSZ(4);
  @$pb.TagNumber(5)
  set avatar($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasAvatar() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvatar() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get vendor => $_getSZ(5);
  @$pb.TagNumber(6)
  set vendor($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasVendor() => $_has(5);
  @$pb.TagNumber(6)
  void clearVendor() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get token => $_getSZ(6);
  @$pb.TagNumber(7)
  set token($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasToken() => $_has(6);
  @$pb.TagNumber(7)
  void clearToken() => clearField(7);
}

class JoinReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JoinReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOM<Configuration>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'config',
        subBuilder: Configuration.create)
    ..aOM<Error>(3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error',
        subBuilder: Error.create)
    ..hasRequiredFields = false;

  JoinReply._() : super();
  factory JoinReply({
    $core.bool? success,
    Configuration? config,
    Error? error,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (config != null) {
      _result.config = config;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory JoinReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory JoinReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  JoinReply clone() => JoinReply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  JoinReply copyWith(void Function(JoinReply) updates) =>
      super.copyWith((message) => updates(message as JoinReply))
          as JoinReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JoinReply create() => JoinReply._();
  JoinReply createEmptyInstance() => create();
  static $pb.PbList<JoinReply> createRepeated() => $pb.PbList<JoinReply>();
  @$core.pragma('dart2js:noInline')
  static JoinReply getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinReply>(create);
  static JoinReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  Configuration get config => $_getN(1);
  @$pb.TagNumber(2)
  set config(Configuration v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasConfig() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfig() => clearField(2);
  @$pb.TagNumber(2)
  Configuration ensureConfig() => $_ensure(1);

  @$pb.TagNumber(3)
  Error get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(Error v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
  @$pb.TagNumber(3)
  Error ensureError() => $_ensure(2);
}

class LeaveRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LeaveRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  LeaveRequest._() : super();
  factory LeaveRequest() => create();
  factory LeaveRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LeaveRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LeaveRequest clone() => LeaveRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LeaveRequest copyWith(void Function(LeaveRequest) updates) =>
      super.copyWith((message) => updates(message as LeaveRequest))
          as LeaveRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LeaveRequest create() => LeaveRequest._();
  LeaveRequest createEmptyInstance() => create();
  static $pb.PbList<LeaveRequest> createRepeated() =>
      $pb.PbList<LeaveRequest>();
  @$core.pragma('dart2js:noInline')
  static LeaveRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LeaveRequest>(create);
  static LeaveRequest? _defaultInstance;
}

class LeaveReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LeaveReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  LeaveReply._() : super();
  factory LeaveReply() => create();
  factory LeaveReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LeaveReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LeaveReply clone() => LeaveReply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LeaveReply copyWith(void Function(LeaveReply) updates) =>
      super.copyWith((message) => updates(message as LeaveReply))
          as LeaveReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LeaveReply create() => LeaveReply._();
  LeaveReply createEmptyInstance() => create();
  static $pb.PbList<LeaveReply> createRepeated() => $pb.PbList<LeaveReply>();
  @$core.pragma('dart2js:noInline')
  static LeaveReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LeaveReply>(create);
  static LeaveReply? _defaultInstance;
}

class Participant extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Participant',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'displayName',
        protoName: 'displayName')
    ..a<$core.List<$core.int>>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extraInfo', $pb.PbFieldType.OY,
        protoName: 'extraInfo')
    ..e<Role>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role', $pb.PbFieldType.OE,
        defaultOrMaker: Role.RoleHost,
        valueOf: Role.valueOf,
        enumValues: Role.values)
    ..e<Protocol>(
        5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'protocol', $pb.PbFieldType.OE,
        defaultOrMaker: Protocol.ProtocolUnknown,
        valueOf: Protocol.valueOf,
        enumValues: Protocol.values)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatar')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'callDirection', protoName: 'callDirection')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vendor')
    ..hasRequiredFields = false;

  Participant._() : super();
  factory Participant({
    $core.String? uid,
    $core.String? displayName,
    $core.List<$core.int>? extraInfo,
    Role? role,
    Protocol? protocol,
    $core.String? avatar,
    $core.String? callDirection,
    $core.String? vendor,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (displayName != null) {
      _result.displayName = displayName;
    }
    if (extraInfo != null) {
      _result.extraInfo = extraInfo;
    }
    if (role != null) {
      _result.role = role;
    }
    if (protocol != null) {
      _result.protocol = protocol;
    }
    if (avatar != null) {
      _result.avatar = avatar;
    }
    if (callDirection != null) {
      _result.callDirection = callDirection;
    }
    if (vendor != null) {
      _result.vendor = vendor;
    }
    return _result;
  }
  factory Participant.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Participant.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Participant clone() => Participant()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Participant copyWith(void Function(Participant) updates) =>
      super.copyWith((message) => updates(message as Participant))
          as Participant; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Participant create() => Participant._();
  Participant createEmptyInstance() => create();
  static $pb.PbList<Participant> createRepeated() => $pb.PbList<Participant>();
  @$core.pragma('dart2js:noInline')
  static Participant getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Participant>(create);
  static Participant? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get displayName => $_getSZ(1);
  @$pb.TagNumber(2)
  set displayName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDisplayName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplayName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get extraInfo => $_getN(2);
  @$pb.TagNumber(3)
  set extraInfo($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasExtraInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearExtraInfo() => clearField(3);

  @$pb.TagNumber(4)
  Role get role => $_getN(3);
  @$pb.TagNumber(4)
  set role(Role v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRole() => $_has(3);
  @$pb.TagNumber(4)
  void clearRole() => clearField(4);

  @$pb.TagNumber(5)
  Protocol get protocol => $_getN(4);
  @$pb.TagNumber(5)
  set protocol(Protocol v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasProtocol() => $_has(4);
  @$pb.TagNumber(5)
  void clearProtocol() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get avatar => $_getSZ(5);
  @$pb.TagNumber(6)
  set avatar($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAvatar() => $_has(5);
  @$pb.TagNumber(6)
  void clearAvatar() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get callDirection => $_getSZ(6);
  @$pb.TagNumber(7)
  set callDirection($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCallDirection() => $_has(6);
  @$pb.TagNumber(7)
  void clearCallDirection() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get vendor => $_getSZ(7);
  @$pb.TagNumber(8)
  set vendor($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasVendor() => $_has(7);
  @$pb.TagNumber(8)
  void clearVendor() => clearField(8);
}

class ParticipantEvent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParticipantEvent',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..aOM<Participant>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'participant',
        subBuilder: Participant.create)
    ..e<ParticipantStatus>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'status',
        $pb.PbFieldType.OE,
        defaultOrMaker: ParticipantStatus.Create,
        valueOf: ParticipantStatus.valueOf,
        enumValues: ParticipantStatus.values)
    ..hasRequiredFields = false;

  ParticipantEvent._() : super();
  factory ParticipantEvent({
    Participant? participant,
    ParticipantStatus? status,
  }) {
    final _result = create();
    if (participant != null) {
      _result.participant = participant;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory ParticipantEvent.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParticipantEvent.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParticipantEvent clone() => ParticipantEvent()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParticipantEvent copyWith(void Function(ParticipantEvent) updates) =>
      super.copyWith((message) => updates(message as ParticipantEvent))
          as ParticipantEvent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParticipantEvent create() => ParticipantEvent._();
  ParticipantEvent createEmptyInstance() => create();
  static $pb.PbList<ParticipantEvent> createRepeated() =>
      $pb.PbList<ParticipantEvent>();
  @$core.pragma('dart2js:noInline')
  static ParticipantEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParticipantEvent>(create);
  static ParticipantEvent? _defaultInstance;

  @$pb.TagNumber(1)
  Participant get participant => $_getN(0);
  @$pb.TagNumber(1)
  set participant(Participant v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasParticipant() => $_has(0);
  @$pb.TagNumber(1)
  void clearParticipant() => clearField(1);
  @$pb.TagNumber(1)
  Participant ensureParticipant() => $_ensure(0);

  @$pb.TagNumber(2)
  ParticipantStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(ParticipantStatus v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}

class ParticipantsReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ParticipantsReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..aOM<Participant>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'participants',
        subBuilder: Participant.create)
    ..aOM<Permission>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permission',
        subBuilder: Permission.create)
    ..hasRequiredFields = false;

  ParticipantsReply._() : super();
  factory ParticipantsReply({
    Participant? participants,
    Permission? permission,
  }) {
    final _result = create();
    if (participants != null) {
      _result.participants = participants;
    }
    if (permission != null) {
      _result.permission = permission;
    }
    return _result;
  }
  factory ParticipantsReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParticipantsReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParticipantsReply clone() => ParticipantsReply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParticipantsReply copyWith(void Function(ParticipantsReply) updates) =>
      super.copyWith((message) => updates(message as ParticipantsReply))
          as ParticipantsReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParticipantsReply create() => ParticipantsReply._();
  ParticipantsReply createEmptyInstance() => create();
  static $pb.PbList<ParticipantsReply> createRepeated() =>
      $pb.PbList<ParticipantsReply>();
  @$core.pragma('dart2js:noInline')
  static ParticipantsReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParticipantsReply>(create);
  static ParticipantsReply? _defaultInstance;

  @$pb.TagNumber(1)
  Participant get participants => $_getN(0);
  @$pb.TagNumber(1)
  set participants(Participant v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasParticipants() => $_has(0);
  @$pb.TagNumber(1)
  void clearParticipants() => clearField(1);
  @$pb.TagNumber(1)
  Participant ensureParticipants() => $_ensure(0);

  @$pb.TagNumber(2)
  Permission get permission => $_getN(1);
  @$pb.TagNumber(2)
  set permission(Permission v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPermission() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermission() => clearField(2);
  @$pb.TagNumber(2)
  Permission ensurePermission() => $_ensure(1);
}

class GetParticipantsReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GetParticipantsReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..pc<ParticipantsReply>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'participants',
        $pb.PbFieldType.PM,
        subBuilder: ParticipantsReply.create)
    ..hasRequiredFields = false;

  GetParticipantsReply._() : super();
  factory GetParticipantsReply({
    $core.Iterable<ParticipantsReply>? participants,
  }) {
    final _result = create();
    if (participants != null) {
      _result.participants.addAll(participants);
    }
    return _result;
  }
  factory GetParticipantsReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetParticipantsReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetParticipantsReply clone() =>
      GetParticipantsReply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetParticipantsReply copyWith(void Function(GetParticipantsReply) updates) =>
      super.copyWith((message) => updates(message as GetParticipantsReply))
          as GetParticipantsReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetParticipantsReply create() => GetParticipantsReply._();
  GetParticipantsReply createEmptyInstance() => create();
  static $pb.PbList<GetParticipantsReply> createRepeated() =>
      $pb.PbList<GetParticipantsReply>();
  @$core.pragma('dart2js:noInline')
  static GetParticipantsReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetParticipantsReply>(create);
  static GetParticipantsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ParticipantsReply> get participants => $_getList(0);
}

class Error extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Error',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'code',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reason')
    ..hasRequiredFields = false;

  Error._() : super();
  factory Error({
    $core.int? code,
    $core.String? reason,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (reason != null) {
      _result.reason = reason;
    }
    return _result;
  }
  factory Error.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Error.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Error clone() => Error()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Error copyWith(void Function(Error) updates) =>
      super.copyWith((message) => updates(message as Error))
          as Error; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Error create() => Error._();
  Error createEmptyInstance() => create();
  static $pb.PbList<Error> createRepeated() => $pb.PbList<Error>();
  @$core.pragma('dart2js:noInline')
  static Error getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Error>(create);
  static Error? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get reason => $_getSZ(1);
  @$pb.TagNumber(2)
  set reason($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => clearField(2);
}

class Configuration extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Configuration',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uuid')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isAudioOnlyMode',
        protoName: 'isAudioOnlyMode')
    ..e<Role>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role', $pb.PbFieldType.OE,
        defaultOrMaker: Role.RoleHost,
        valueOf: Role.valueOf,
        enumValues: Role.values)
    ..aOM<Permission>(
        4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'yourPermission',
        protoName: 'yourPermission', subBuilder: Permission.create)
    ..hasRequiredFields = false;

  Configuration._() : super();
  factory Configuration({
    $core.String? uuid,
    $core.bool? isAudioOnlyMode,
    Role? role,
    Permission? yourPermission,
  }) {
    final _result = create();
    if (uuid != null) {
      _result.uuid = uuid;
    }
    if (isAudioOnlyMode != null) {
      _result.isAudioOnlyMode = isAudioOnlyMode;
    }
    if (role != null) {
      _result.role = role;
    }
    if (yourPermission != null) {
      _result.yourPermission = yourPermission;
    }
    return _result;
  }
  factory Configuration.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Configuration.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Configuration clone() => Configuration()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Configuration copyWith(void Function(Configuration) updates) =>
      super.copyWith((message) => updates(message as Configuration))
          as Configuration; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Configuration create() => Configuration._();
  Configuration createEmptyInstance() => create();
  static $pb.PbList<Configuration> createRepeated() =>
      $pb.PbList<Configuration>();
  @$core.pragma('dart2js:noInline')
  static Configuration getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Configuration>(create);
  static Configuration? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isAudioOnlyMode => $_getBF(1);
  @$pb.TagNumber(2)
  set isAudioOnlyMode($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasIsAudioOnlyMode() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAudioOnlyMode() => clearField(2);

  @$pb.TagNumber(3)
  Role get role => $_getN(2);
  @$pb.TagNumber(3)
  set role(Role v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearRole() => clearField(3);

  @$pb.TagNumber(4)
  Permission get yourPermission => $_getN(3);
  @$pb.TagNumber(4)
  set yourPermission(Permission v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasYourPermission() => $_has(3);
  @$pb.TagNumber(4)
  void clearYourPermission() => clearField(4);
  @$pb.TagNumber(4)
  Permission ensureYourPermission() => $_ensure(3);
}

class Permission extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Permission',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'addParticipants',
        protoName: 'addParticipants')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'removeParticipants',
        protoName: 'removeParticipants')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blockOthersAudio',
        protoName: 'blockOthersAudio')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blockOthersVideo',
        protoName: 'blockOthersVideo')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endConference', protoName: 'endConference')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lockConference', protoName: 'lockConference')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publish')
    ..aOB(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subscribe')
    ..aOB(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'setImportance', protoName: 'setImportance')
    ..hasRequiredFields = false;

  Permission._() : super();
  factory Permission({
    $core.bool? addParticipants,
    $core.bool? removeParticipants,
    $core.bool? blockOthersAudio,
    $core.bool? blockOthersVideo,
    $core.bool? endConference,
    $core.bool? lockConference,
    $core.bool? publish,
    $core.bool? subscribe,
    $core.bool? setImportance,
  }) {
    final _result = create();
    if (addParticipants != null) {
      _result.addParticipants = addParticipants;
    }
    if (removeParticipants != null) {
      _result.removeParticipants = removeParticipants;
    }
    if (blockOthersAudio != null) {
      _result.blockOthersAudio = blockOthersAudio;
    }
    if (blockOthersVideo != null) {
      _result.blockOthersVideo = blockOthersVideo;
    }
    if (endConference != null) {
      _result.endConference = endConference;
    }
    if (lockConference != null) {
      _result.lockConference = lockConference;
    }
    if (publish != null) {
      _result.publish = publish;
    }
    if (subscribe != null) {
      _result.subscribe = subscribe;
    }
    if (setImportance != null) {
      _result.setImportance = setImportance;
    }
    return _result;
  }
  factory Permission.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Permission.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Permission clone() => Permission()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Permission copyWith(void Function(Permission) updates) =>
      super.copyWith((message) => updates(message as Permission))
          as Permission; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Permission create() => Permission._();
  Permission createEmptyInstance() => create();
  static $pb.PbList<Permission> createRepeated() => $pb.PbList<Permission>();
  @$core.pragma('dart2js:noInline')
  static Permission getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Permission>(create);
  static Permission? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get addParticipants => $_getBF(0);
  @$pb.TagNumber(1)
  set addParticipants($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAddParticipants() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddParticipants() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get removeParticipants => $_getBF(1);
  @$pb.TagNumber(2)
  set removeParticipants($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRemoveParticipants() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemoveParticipants() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get blockOthersAudio => $_getBF(2);
  @$pb.TagNumber(3)
  set blockOthersAudio($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBlockOthersAudio() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlockOthersAudio() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get blockOthersVideo => $_getBF(3);
  @$pb.TagNumber(4)
  set blockOthersVideo($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasBlockOthersVideo() => $_has(3);
  @$pb.TagNumber(4)
  void clearBlockOthersVideo() => clearField(4);

  @$pb.TagNumber(7)
  $core.bool get endConference => $_getBF(4);
  @$pb.TagNumber(7)
  set endConference($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasEndConference() => $_has(4);
  @$pb.TagNumber(7)
  void clearEndConference() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get lockConference => $_getBF(5);
  @$pb.TagNumber(8)
  set lockConference($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasLockConference() => $_has(5);
  @$pb.TagNumber(8)
  void clearLockConference() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get publish => $_getBF(6);
  @$pb.TagNumber(9)
  set publish($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasPublish() => $_has(6);
  @$pb.TagNumber(9)
  void clearPublish() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get subscribe => $_getBF(7);
  @$pb.TagNumber(10)
  set subscribe($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasSubscribe() => $_has(7);
  @$pb.TagNumber(10)
  void clearSubscribe() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get setImportance => $_getBF(8);
  @$pb.TagNumber(11)
  set setImportance($core.bool v) {
    $_setBool(8, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasSetImportance() => $_has(8);
  @$pb.TagNumber(11)
  void clearSetImportance() => clearField(11);
}

class Message extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Message',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'origin')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..a<$core.List<$core.int>>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'payload',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  Message._() : super();
  factory Message({
    $core.String? origin,
    $core.String? uid,
    $core.String? type,
    $core.List<$core.int>? payload,
  }) {
    final _result = create();
    if (origin != null) {
      _result.origin = origin;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (type != null) {
      _result.type = type;
    }
    if (payload != null) {
      _result.payload = payload;
    }
    return _result;
  }
  factory Message.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Message.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Message clone() => Message()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Message copyWith(void Function(Message) updates) =>
      super.copyWith((message) => updates(message as Message))
          as Message; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get origin => $_getSZ(0);
  @$pb.TagNumber(1)
  set origin($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasOrigin() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrigin() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get uid => $_getSZ(1);
  @$pb.TagNumber(3)
  set uid($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(3)
  void clearUid() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(4)
  set type($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get payload => $_getN(3);
  @$pb.TagNumber(5)
  set payload($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPayload() => $_has(3);
  @$pb.TagNumber(5)
  void clearPayload() => clearField(5);
}

class SendMessageRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SendMessageRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..aOM<Message>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'message',
        subBuilder: Message.create)
    ..hasRequiredFields = false;

  SendMessageRequest._() : super();
  factory SendMessageRequest({
    Message? message,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory SendMessageRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SendMessageRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SendMessageRequest clone() => SendMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SendMessageRequest copyWith(void Function(SendMessageRequest) updates) =>
      super.copyWith((message) => updates(message as SendMessageRequest))
          as SendMessageRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendMessageRequest create() => SendMessageRequest._();
  SendMessageRequest createEmptyInstance() => create();
  static $pb.PbList<SendMessageRequest> createRepeated() =>
      $pb.PbList<SendMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static SendMessageRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendMessageRequest>(create);
  static SendMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Message get message => $_getN(0);
  @$pb.TagNumber(1)
  set message(Message v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
  @$pb.TagNumber(1)
  Message ensureMessage() => $_ensure(0);
}

class SendMessageReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SendMessageReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  SendMessageReply._() : super();
  factory SendMessageReply() => create();
  factory SendMessageReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SendMessageReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SendMessageReply clone() => SendMessageReply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SendMessageReply copyWith(void Function(SendMessageReply) updates) =>
      super.copyWith((message) => updates(message as SendMessageReply))
          as SendMessageReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendMessageReply create() => SendMessageReply._();
  SendMessageReply createEmptyInstance() => create();
  static $pb.PbList<SendMessageReply> createRepeated() =>
      $pb.PbList<SendMessageReply>();
  @$core.pragma('dart2js:noInline')
  static SendMessageReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendMessageReply>(create);
  static SendMessageReply? _defaultInstance;
}

class Disconnect extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Disconnect',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'reason')
    ..hasRequiredFields = false;

  Disconnect._() : super();
  factory Disconnect({
    $core.String? reason,
  }) {
    final _result = create();
    if (reason != null) {
      _result.reason = reason;
    }
    return _result;
  }
  factory Disconnect.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Disconnect.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Disconnect clone() => Disconnect()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Disconnect copyWith(void Function(Disconnect) updates) =>
      super.copyWith((message) => updates(message as Disconnect))
          as Disconnect; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Disconnect create() => Disconnect._();
  Disconnect createEmptyInstance() => create();
  static $pb.PbList<Disconnect> createRepeated() => $pb.PbList<Disconnect>();
  @$core.pragma('dart2js:noInline')
  static Disconnect getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Disconnect>(create);
  static Disconnect? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reason => $_getSZ(0);
  @$pb.TagNumber(1)
  set reason($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasReason() => $_has(0);
  @$pb.TagNumber(1)
  void clearReason() => clearField(1);
}

enum Notification_Payload { participant, message, disconnect, error, notSet }

class Notification extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Notification_Payload>
      _Notification_PayloadByTag = {
    1: Notification_Payload.participant,
    2: Notification_Payload.message,
    3: Notification_Payload.disconnect,
    4: Notification_Payload.error,
    0: Notification_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Notification',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4])
    ..aOM<ParticipantEvent>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'participant',
        subBuilder: ParticipantEvent.create)
    ..aOM<Message>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message',
        subBuilder: Message.create)
    ..aOM<Disconnect>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'disconnect',
        subBuilder: Disconnect.create)
    ..aOM<Error>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', subBuilder: Error.create)
    ..hasRequiredFields = false;

  Notification._() : super();
  factory Notification({
    ParticipantEvent? participant,
    Message? message,
    Disconnect? disconnect,
    Error? error,
  }) {
    final _result = create();
    if (participant != null) {
      _result.participant = participant;
    }
    if (message != null) {
      _result.message = message;
    }
    if (disconnect != null) {
      _result.disconnect = disconnect;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory Notification.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Notification.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Notification clone() => Notification()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Notification copyWith(void Function(Notification) updates) =>
      super.copyWith((message) => updates(message as Notification))
          as Notification; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Notification create() => Notification._();
  Notification createEmptyInstance() => create();
  static $pb.PbList<Notification> createRepeated() =>
      $pb.PbList<Notification>();
  @$core.pragma('dart2js:noInline')
  static Notification getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Notification>(create);
  static Notification? _defaultInstance;

  Notification_Payload whichPayload() =>
      _Notification_PayloadByTag[$_whichOneof(0)]!;
  void clearPayload() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ParticipantEvent get participant => $_getN(0);
  @$pb.TagNumber(1)
  set participant(ParticipantEvent v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasParticipant() => $_has(0);
  @$pb.TagNumber(1)
  void clearParticipant() => clearField(1);
  @$pb.TagNumber(1)
  ParticipantEvent ensureParticipant() => $_ensure(0);

  @$pb.TagNumber(2)
  Message get message => $_getN(1);
  @$pb.TagNumber(2)
  set message(Message v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
  @$pb.TagNumber(2)
  Message ensureMessage() => $_ensure(1);

  @$pb.TagNumber(3)
  Disconnect get disconnect => $_getN(2);
  @$pb.TagNumber(3)
  set disconnect(Disconnect v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDisconnect() => $_has(2);
  @$pb.TagNumber(3)
  void clearDisconnect() => clearField(3);
  @$pb.TagNumber(3)
  Disconnect ensureDisconnect() => $_ensure(2);

  @$pb.TagNumber(4)
  Error get error => $_getN(3);
  @$pb.TagNumber(4)
  set error(Error v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(4)
  void clearError() => clearField(4);
  @$pb.TagNumber(4)
  Error ensureError() => $_ensure(3);
}

class AddParticipantRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AddParticipantRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..e<Role>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'role', $pb.PbFieldType.OE,
        defaultOrMaker: Role.RoleHost,
        valueOf: Role.valueOf,
        enumValues: Role.values)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..e<Protocol>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'protocol', $pb.PbFieldType.OE,
        defaultOrMaker: Protocol.ProtocolUnknown,
        valueOf: Protocol.valueOf,
        enumValues: Protocol.values)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sourceDisplayName')
    ..hasRequiredFields = false;

  AddParticipantRequest._() : super();
  factory AddParticipantRequest({
    Role? role,
    $core.String? description,
    Protocol? protocol,
    $core.String? sourceDisplayName,
  }) {
    final _result = create();
    if (role != null) {
      _result.role = role;
    }
    if (description != null) {
      _result.description = description;
    }
    if (protocol != null) {
      _result.protocol = protocol;
    }
    if (sourceDisplayName != null) {
      _result.sourceDisplayName = sourceDisplayName;
    }
    return _result;
  }
  factory AddParticipantRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AddParticipantRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AddParticipantRequest clone() =>
      AddParticipantRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AddParticipantRequest copyWith(
          void Function(AddParticipantRequest) updates) =>
      super.copyWith((message) => updates(message as AddParticipantRequest))
          as AddParticipantRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddParticipantRequest create() => AddParticipantRequest._();
  AddParticipantRequest createEmptyInstance() => create();
  static $pb.PbList<AddParticipantRequest> createRepeated() =>
      $pb.PbList<AddParticipantRequest>();
  @$core.pragma('dart2js:noInline')
  static AddParticipantRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddParticipantRequest>(create);
  static AddParticipantRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Role get role => $_getN(0);
  @$pb.TagNumber(1)
  set role(Role v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRole() => $_has(0);
  @$pb.TagNumber(1)
  void clearRole() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  Protocol get protocol => $_getN(2);
  @$pb.TagNumber(3)
  set protocol(Protocol v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasProtocol() => $_has(2);
  @$pb.TagNumber(3)
  void clearProtocol() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sourceDisplayName => $_getSZ(3);
  @$pb.TagNumber(4)
  set sourceDisplayName($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasSourceDisplayName() => $_has(3);
  @$pb.TagNumber(4)
  void clearSourceDisplayName() => clearField(4);
}

class AddParticipantReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AddParticipantReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOM<Error>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error',
        subBuilder: Error.create)
    ..aOM<Participant>(3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description',
        subBuilder: Participant.create)
    ..hasRequiredFields = false;

  AddParticipantReply._() : super();
  factory AddParticipantReply({
    $core.bool? success,
    Error? error,
    Participant? description,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (error != null) {
      _result.error = error;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory AddParticipantReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AddParticipantReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AddParticipantReply clone() => AddParticipantReply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AddParticipantReply copyWith(void Function(AddParticipantReply) updates) =>
      super.copyWith((message) => updates(message as AddParticipantReply))
          as AddParticipantReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddParticipantReply create() => AddParticipantReply._();
  AddParticipantReply createEmptyInstance() => create();
  static $pb.PbList<AddParticipantReply> createRepeated() =>
      $pb.PbList<AddParticipantReply>();
  @$core.pragma('dart2js:noInline')
  static AddParticipantReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddParticipantReply>(create);
  static AddParticipantReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  Error get error => $_getN(1);
  @$pb.TagNumber(2)
  set error(Error v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);
  @$pb.TagNumber(2)
  Error ensureError() => $_ensure(1);

  @$pb.TagNumber(3)
  Participant get description => $_getN(2);
  @$pb.TagNumber(3)
  set description(Participant v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);
  @$pb.TagNumber(3)
  Participant ensureDescription() => $_ensure(2);
}

class SetImportanceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SetImportanceRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..pc<Participant>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'participants',
        $pb.PbFieldType.PM,
        subBuilder: Participant.create)
    ..hasRequiredFields = false;

  SetImportanceRequest._() : super();
  factory SetImportanceRequest({
    $core.Iterable<Participant>? participants,
  }) {
    final _result = create();
    if (participants != null) {
      _result.participants.addAll(participants);
    }
    return _result;
  }
  factory SetImportanceRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SetImportanceRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SetImportanceRequest clone() =>
      SetImportanceRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SetImportanceRequest copyWith(void Function(SetImportanceRequest) updates) =>
      super.copyWith((message) => updates(message as SetImportanceRequest))
          as SetImportanceRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetImportanceRequest create() => SetImportanceRequest._();
  SetImportanceRequest createEmptyInstance() => create();
  static $pb.PbList<SetImportanceRequest> createRepeated() =>
      $pb.PbList<SetImportanceRequest>();
  @$core.pragma('dart2js:noInline')
  static SetImportanceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetImportanceRequest>(create);
  static SetImportanceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Participant> get participants => $_getList(0);
}

class SetImportanceReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SetImportanceReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  SetImportanceReply._() : super();
  factory SetImportanceReply() => create();
  factory SetImportanceReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SetImportanceReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SetImportanceReply clone() => SetImportanceReply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SetImportanceReply copyWith(void Function(SetImportanceReply) updates) =>
      super.copyWith((message) => updates(message as SetImportanceReply))
          as SetImportanceReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetImportanceReply create() => SetImportanceReply._();
  SetImportanceReply createEmptyInstance() => create();
  static $pb.PbList<SetImportanceReply> createRepeated() =>
      $pb.PbList<SetImportanceReply>();
  @$core.pragma('dart2js:noInline')
  static SetImportanceReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetImportanceReply>(create);
  static SetImportanceReply? _defaultInstance;
}

class LockConferenceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LockConferenceRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'lock')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'password')
    ..hasRequiredFields = false;

  LockConferenceRequest._() : super();
  factory LockConferenceRequest({
    $core.bool? lock,
    $core.String? password,
  }) {
    final _result = create();
    if (lock != null) {
      _result.lock = lock;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory LockConferenceRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LockConferenceRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LockConferenceRequest clone() =>
      LockConferenceRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LockConferenceRequest copyWith(
          void Function(LockConferenceRequest) updates) =>
      super.copyWith((message) => updates(message as LockConferenceRequest))
          as LockConferenceRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LockConferenceRequest create() => LockConferenceRequest._();
  LockConferenceRequest createEmptyInstance() => create();
  static $pb.PbList<LockConferenceRequest> createRepeated() =>
      $pb.PbList<LockConferenceRequest>();
  @$core.pragma('dart2js:noInline')
  static LockConferenceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LockConferenceRequest>(create);
  static LockConferenceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get lock => $_getBF(0);
  @$pb.TagNumber(1)
  set lock($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLock() => $_has(0);
  @$pb.TagNumber(1)
  void clearLock() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class LockConferenceReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'LockConferenceReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  LockConferenceReply._() : super();
  factory LockConferenceReply() => create();
  factory LockConferenceReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LockConferenceReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LockConferenceReply clone() => LockConferenceReply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LockConferenceReply copyWith(void Function(LockConferenceReply) updates) =>
      super.copyWith((message) => updates(message as LockConferenceReply))
          as LockConferenceReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LockConferenceReply create() => LockConferenceReply._();
  LockConferenceReply createEmptyInstance() => create();
  static $pb.PbList<LockConferenceReply> createRepeated() =>
      $pb.PbList<LockConferenceReply>();
  @$core.pragma('dart2js:noInline')
  static LockConferenceReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LockConferenceReply>(create);
  static LockConferenceReply? _defaultInstance;
}

class EndConferenceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EndConferenceRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  EndConferenceRequest._() : super();
  factory EndConferenceRequest() => create();
  factory EndConferenceRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EndConferenceRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EndConferenceRequest clone() =>
      EndConferenceRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EndConferenceRequest copyWith(void Function(EndConferenceRequest) updates) =>
      super.copyWith((message) => updates(message as EndConferenceRequest))
          as EndConferenceRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EndConferenceRequest create() => EndConferenceRequest._();
  EndConferenceRequest createEmptyInstance() => create();
  static $pb.PbList<EndConferenceRequest> createRepeated() =>
      $pb.PbList<EndConferenceRequest>();
  @$core.pragma('dart2js:noInline')
  static EndConferenceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EndConferenceRequest>(create);
  static EndConferenceRequest? _defaultInstance;
}

class EndConferenceReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EndConferenceReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  EndConferenceReply._() : super();
  factory EndConferenceReply() => create();
  factory EndConferenceReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EndConferenceReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EndConferenceReply clone() => EndConferenceReply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EndConferenceReply copyWith(void Function(EndConferenceReply) updates) =>
      super.copyWith((message) => updates(message as EndConferenceReply))
          as EndConferenceReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EndConferenceReply create() => EndConferenceReply._();
  EndConferenceReply createEmptyInstance() => create();
  static $pb.PbList<EndConferenceReply> createRepeated() =>
      $pb.PbList<EndConferenceReply>();
  @$core.pragma('dart2js:noInline')
  static EndConferenceReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EndConferenceReply>(create);
  static EndConferenceReply? _defaultInstance;
}

class EditParticipantInfoRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EditParticipantInfoRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  EditParticipantInfoRequest._() : super();
  factory EditParticipantInfoRequest() => create();
  factory EditParticipantInfoRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EditParticipantInfoRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EditParticipantInfoRequest clone() =>
      EditParticipantInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EditParticipantInfoRequest copyWith(
          void Function(EditParticipantInfoRequest) updates) =>
      super.copyWith(
              (message) => updates(message as EditParticipantInfoRequest))
          as EditParticipantInfoRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EditParticipantInfoRequest create() => EditParticipantInfoRequest._();
  EditParticipantInfoRequest createEmptyInstance() => create();
  static $pb.PbList<EditParticipantInfoRequest> createRepeated() =>
      $pb.PbList<EditParticipantInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static EditParticipantInfoRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EditParticipantInfoRequest>(create);
  static EditParticipantInfoRequest? _defaultInstance;
}

class EditParticipantInfoReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EditParticipantInfoReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  EditParticipantInfoReply._() : super();
  factory EditParticipantInfoReply() => create();
  factory EditParticipantInfoReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EditParticipantInfoReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EditParticipantInfoReply clone() =>
      EditParticipantInfoReply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EditParticipantInfoReply copyWith(
          void Function(EditParticipantInfoReply) updates) =>
      super.copyWith((message) => updates(message as EditParticipantInfoReply))
          as EditParticipantInfoReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EditParticipantInfoReply create() => EditParticipantInfoReply._();
  EditParticipantInfoReply createEmptyInstance() => create();
  static $pb.PbList<EditParticipantInfoReply> createRepeated() =>
      $pb.PbList<EditParticipantInfoReply>();
  @$core.pragma('dart2js:noInline')
  static EditParticipantInfoReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EditParticipantInfoReply>(create);
  static EditParticipantInfoReply? _defaultInstance;
}

class RemoveParticipantRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RemoveParticipantRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  RemoveParticipantRequest._() : super();
  factory RemoveParticipantRequest() => create();
  factory RemoveParticipantRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RemoveParticipantRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RemoveParticipantRequest clone() =>
      RemoveParticipantRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RemoveParticipantRequest copyWith(
          void Function(RemoveParticipantRequest) updates) =>
      super.copyWith((message) => updates(message as RemoveParticipantRequest))
          as RemoveParticipantRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoveParticipantRequest create() => RemoveParticipantRequest._();
  RemoveParticipantRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveParticipantRequest> createRepeated() =>
      $pb.PbList<RemoveParticipantRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveParticipantRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveParticipantRequest>(create);
  static RemoveParticipantRequest? _defaultInstance;
}

class RemoveParticipantReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'RemoveParticipantReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'room'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  RemoveParticipantReply._() : super();
  factory RemoveParticipantReply() => create();
  factory RemoveParticipantReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RemoveParticipantReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RemoveParticipantReply clone() =>
      RemoveParticipantReply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RemoveParticipantReply copyWith(
          void Function(RemoveParticipantReply) updates) =>
      super.copyWith((message) => updates(message as RemoveParticipantReply))
          as RemoveParticipantReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoveParticipantReply create() => RemoveParticipantReply._();
  RemoveParticipantReply createEmptyInstance() => create();
  static $pb.PbList<RemoveParticipantReply> createRepeated() =>
      $pb.PbList<RemoveParticipantReply>();
  @$core.pragma('dart2js:noInline')
  static RemoveParticipantReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveParticipantReply>(create);
  static RemoveParticipantReply? _defaultInstance;
}
