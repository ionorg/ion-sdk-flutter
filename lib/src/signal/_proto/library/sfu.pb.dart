///
//  Generated code. Do not modify.
//  source: sfu.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'sfu.pbenum.dart';

export 'sfu.pbenum.dart';

enum SignalRequest_Payload { join, description, trickle, notSet }

class SignalRequest extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, SignalRequest_Payload>
      _SignalRequest_PayloadByTag = {
    2: SignalRequest_Payload.join,
    3: SignalRequest_Payload.description,
    4: SignalRequest_Payload.trickle,
    0: SignalRequest_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SignalRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'sfu'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOM<JoinRequest>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'join',
        subBuilder: JoinRequest.create)
    ..a<$core.List<$core.int>>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description',
        $pb.PbFieldType.OY)
    ..aOM<Trickle>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trickle', subBuilder: Trickle.create)
    ..hasRequiredFields = false;

  SignalRequest._() : super();
  factory SignalRequest() => create();
  factory SignalRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SignalRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SignalRequest clone() => SignalRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SignalRequest copyWith(void Function(SignalRequest) updates) =>
      super.copyWith((message) =>
          updates(message as SignalRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignalRequest create() => SignalRequest._();
  SignalRequest createEmptyInstance() => create();
  static $pb.PbList<SignalRequest> createRepeated() =>
      $pb.PbList<SignalRequest>();
  @$core.pragma('dart2js:noInline')
  static SignalRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignalRequest>(create);
  static SignalRequest _defaultInstance;

  SignalRequest_Payload whichPayload() =>
      _SignalRequest_PayloadByTag[$_whichOneof(0)];
  void clearPayload() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  JoinRequest get join => $_getN(1);
  @$pb.TagNumber(2)
  set join(JoinRequest v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasJoin() => $_has(1);
  @$pb.TagNumber(2)
  void clearJoin() => clearField(2);
  @$pb.TagNumber(2)
  JoinRequest ensureJoin() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get description => $_getN(2);
  @$pb.TagNumber(3)
  set description($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  Trickle get trickle => $_getN(3);
  @$pb.TagNumber(4)
  set trickle(Trickle v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTrickle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTrickle() => clearField(4);
  @$pb.TagNumber(4)
  Trickle ensureTrickle() => $_ensure(3);
}

enum SignalReply_Payload {
  join,
  description,
  trickle,
  iceConnectionState,
  error,
  notSet
}

class SignalReply extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, SignalReply_Payload>
      _SignalReply_PayloadByTag = {
    2: SignalReply_Payload.join,
    3: SignalReply_Payload.description,
    4: SignalReply_Payload.trickle,
    5: SignalReply_Payload.iceConnectionState,
    6: SignalReply_Payload.error,
    0: SignalReply_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SignalReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'sfu'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5, 6])
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOM<JoinReply>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'join',
        subBuilder: JoinReply.create)
    ..a<$core.List<$core.int>>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description',
        $pb.PbFieldType.OY)
    ..aOM<Trickle>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trickle', subBuilder: Trickle.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iceConnectionState', protoName: 'iceConnectionState')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..hasRequiredFields = false;

  SignalReply._() : super();
  factory SignalReply() => create();
  factory SignalReply.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SignalReply.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SignalReply clone() => SignalReply()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SignalReply copyWith(void Function(SignalReply) updates) =>
      super.copyWith((message) =>
          updates(message as SignalReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignalReply create() => SignalReply._();
  SignalReply createEmptyInstance() => create();
  static $pb.PbList<SignalReply> createRepeated() => $pb.PbList<SignalReply>();
  @$core.pragma('dart2js:noInline')
  static SignalReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SignalReply>(create);
  static SignalReply _defaultInstance;

  SignalReply_Payload whichPayload() =>
      _SignalReply_PayloadByTag[$_whichOneof(0)];
  void clearPayload() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  JoinReply get join => $_getN(1);
  @$pb.TagNumber(2)
  set join(JoinReply v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasJoin() => $_has(1);
  @$pb.TagNumber(2)
  void clearJoin() => clearField(2);
  @$pb.TagNumber(2)
  JoinReply ensureJoin() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get description => $_getN(2);
  @$pb.TagNumber(3)
  set description($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  Trickle get trickle => $_getN(3);
  @$pb.TagNumber(4)
  set trickle(Trickle v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasTrickle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTrickle() => clearField(4);
  @$pb.TagNumber(4)
  Trickle ensureTrickle() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get iceConnectionState => $_getSZ(4);
  @$pb.TagNumber(5)
  set iceConnectionState($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIceConnectionState() => $_has(4);
  @$pb.TagNumber(5)
  void clearIceConnectionState() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get error => $_getSZ(5);
  @$pb.TagNumber(6)
  set error($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasError() => $_has(5);
  @$pb.TagNumber(6)
  void clearError() => clearField(6);
}

class JoinRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JoinRequest',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'sfu'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sid')
    ..a<$core.List<$core.int>>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  JoinRequest._() : super();
  factory JoinRequest() => create();
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
      super.copyWith((message) =>
          updates(message as JoinRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JoinRequest create() => JoinRequest._();
  JoinRequest createEmptyInstance() => create();
  static $pb.PbList<JoinRequest> createRepeated() => $pb.PbList<JoinRequest>();
  @$core.pragma('dart2js:noInline')
  static JoinRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JoinRequest>(create);
  static JoinRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sid => $_getSZ(0);
  @$pb.TagNumber(1)
  set sid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSid() => $_has(0);
  @$pb.TagNumber(1)
  void clearSid() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get description => $_getN(1);
  @$pb.TagNumber(2)
  set description($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);
}

class JoinReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JoinReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'sfu'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description',
        $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  JoinReply._() : super();
  factory JoinReply() => create();
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
      super.copyWith((message) =>
          updates(message as JoinReply)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JoinReply create() => JoinReply._();
  JoinReply createEmptyInstance() => create();
  static $pb.PbList<JoinReply> createRepeated() => $pb.PbList<JoinReply>();
  @$core.pragma('dart2js:noInline')
  static JoinReply getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinReply>(create);
  static JoinReply _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get description => $_getN(0);
  @$pb.TagNumber(1)
  set description($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDescription() => $_has(0);
  @$pb.TagNumber(1)
  void clearDescription() => clearField(1);
}

class Trickle extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Trickle',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'sfu'),
      createEmptyInstance: create)
    ..e<Trickle_Target>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'target',
        $pb.PbFieldType.OE,
        defaultOrMaker: Trickle_Target.PUBLISHER,
        valueOf: Trickle_Target.valueOf,
        enumValues: Trickle_Target.values)
    ..aOS(2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'init')
    ..hasRequiredFields = false;

  Trickle._() : super();
  factory Trickle() => create();
  factory Trickle.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Trickle.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Trickle clone() => Trickle()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Trickle copyWith(void Function(Trickle) updates) =>
      super.copyWith((message) =>
          updates(message as Trickle)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Trickle create() => Trickle._();
  Trickle createEmptyInstance() => create();
  static $pb.PbList<Trickle> createRepeated() => $pb.PbList<Trickle>();
  @$core.pragma('dart2js:noInline')
  static Trickle getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Trickle>(create);
  static Trickle _defaultInstance;

  @$pb.TagNumber(1)
  Trickle_Target get target => $_getN(0);
  @$pb.TagNumber(1)
  set target(Trickle_Target v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTarget() => $_has(0);
  @$pb.TagNumber(1)
  void clearTarget() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get init => $_getSZ(1);
  @$pb.TagNumber(2)
  set init($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasInit() => $_has(1);
  @$pb.TagNumber(2)
  void clearInit() => clearField(2);
}
