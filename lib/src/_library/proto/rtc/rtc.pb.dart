///
//  Generated code. Do not modify.
//  source: proto/rtc/rtc.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'rtc.pbenum.dart';

export 'rtc.pbenum.dart';

class JoinRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JoinRequest',
      package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'rtc'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'sid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'uid')
    ..m<$core.String, $core.String>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'config',
        entryClassName: 'JoinRequest.ConfigEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('rtc'))
    ..aOM<SessionDescription>(
        4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description',
        subBuilder: SessionDescription.create)
    ..hasRequiredFields = false;

  JoinRequest._() : super();
  factory JoinRequest({
    $core.String? sid,
    $core.String? uid,
    $core.Map<$core.String, $core.String>? config,
    SessionDescription? description,
  }) {
    final _result = create();
    if (sid != null) {
      _result.sid = sid;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (config != null) {
      _result.config.addAll(config);
    }
    if (description != null) {
      _result.description = description;
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
  $core.String get uid => $_getSZ(1);
  @$pb.TagNumber(2)
  set uid($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.Map<$core.String, $core.String> get config => $_getMap(2);

  @$pb.TagNumber(4)
  SessionDescription get description => $_getN(3);
  @$pb.TagNumber(4)
  set description(SessionDescription v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);
  @$pb.TagNumber(4)
  SessionDescription ensureDescription() => $_ensure(3);
}

class JoinReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'JoinReply',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'rtc'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'success')
    ..aOM<Error>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error',
        subBuilder: Error.create)
    ..aOM<SessionDescription>(3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description',
        subBuilder: SessionDescription.create)
    ..hasRequiredFields = false;

  JoinReply._() : super();
  factory JoinReply({
    $core.bool? success,
    Error? error,
    SessionDescription? description,
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
  SessionDescription get description => $_getN(2);
  @$pb.TagNumber(3)
  set description(SessionDescription v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);
  @$pb.TagNumber(3)
  SessionDescription ensureDescription() => $_ensure(2);
}

class SessionDescription extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SessionDescription',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'rtc'),
      createEmptyInstance: create)
    ..e<Target>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'target',
        $pb.PbFieldType.OE,
        defaultOrMaker: Target.PUBLISHER,
        valueOf: Target.valueOf,
        enumValues: Target.values)
    ..aOS(2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sdp')
    ..hasRequiredFields = false;

  SessionDescription._() : super();
  factory SessionDescription({
    Target? target,
    $core.String? type,
    $core.String? sdp,
  }) {
    final _result = create();
    if (target != null) {
      _result.target = target;
    }
    if (type != null) {
      _result.type = type;
    }
    if (sdp != null) {
      _result.sdp = sdp;
    }
    return _result;
  }
  factory SessionDescription.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SessionDescription.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SessionDescription clone() => SessionDescription()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SessionDescription copyWith(void Function(SessionDescription) updates) =>
      super.copyWith((message) => updates(message as SessionDescription))
          as SessionDescription; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SessionDescription create() => SessionDescription._();
  SessionDescription createEmptyInstance() => create();
  static $pb.PbList<SessionDescription> createRepeated() =>
      $pb.PbList<SessionDescription>();
  @$core.pragma('dart2js:noInline')
  static SessionDescription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SessionDescription>(create);
  static SessionDescription? _defaultInstance;

  @$pb.TagNumber(1)
  Target get target => $_getN(0);
  @$pb.TagNumber(1)
  set target(Target v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTarget() => $_has(0);
  @$pb.TagNumber(1)
  void clearTarget() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sdp => $_getSZ(2);
  @$pb.TagNumber(3)
  set sdp($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSdp() => $_has(2);
  @$pb.TagNumber(3)
  void clearSdp() => clearField(3);
}

class Trickle extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Trickle',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'rtc'),
      createEmptyInstance: create)
    ..e<Target>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'target',
        $pb.PbFieldType.OE,
        defaultOrMaker: Target.PUBLISHER,
        valueOf: Target.valueOf,
        enumValues: Target.values)
    ..aOS(2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'init')
    ..hasRequiredFields = false;

  Trickle._() : super();
  factory Trickle({
    Target? target,
    $core.String? init,
  }) {
    final _result = create();
    if (target != null) {
      _result.target = target;
    }
    if (init != null) {
      _result.init = init;
    }
    return _result;
  }
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
      super.copyWith((message) => updates(message as Trickle))
          as Trickle; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Trickle create() => Trickle._();
  Trickle createEmptyInstance() => create();
  static $pb.PbList<Trickle> createRepeated() => $pb.PbList<Trickle>();
  @$core.pragma('dart2js:noInline')
  static Trickle getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Trickle>(create);
  static Trickle? _defaultInstance;

  @$pb.TagNumber(1)
  Target get target => $_getN(0);
  @$pb.TagNumber(1)
  set target(Target v) {
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

class Error extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Error',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'rtc'),
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

class Simulcast extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Simulcast',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'rtc'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'direction')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'parameters')
    ..hasRequiredFields = false;

  Simulcast._() : super();
  factory Simulcast({
    $core.String? rid,
    $core.String? direction,
    $core.String? parameters,
  }) {
    final _result = create();
    if (rid != null) {
      _result.rid = rid;
    }
    if (direction != null) {
      _result.direction = direction;
    }
    if (parameters != null) {
      _result.parameters = parameters;
    }
    return _result;
  }
  factory Simulcast.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Simulcast.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Simulcast clone() => Simulcast()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Simulcast copyWith(void Function(Simulcast) updates) =>
      super.copyWith((message) => updates(message as Simulcast))
          as Simulcast; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Simulcast create() => Simulcast._();
  Simulcast createEmptyInstance() => create();
  static $pb.PbList<Simulcast> createRepeated() => $pb.PbList<Simulcast>();
  @$core.pragma('dart2js:noInline')
  static Simulcast getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Simulcast>(create);
  static Simulcast? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get rid => $_getSZ(0);
  @$pb.TagNumber(1)
  set rid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRid() => $_has(0);
  @$pb.TagNumber(1)
  void clearRid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get direction => $_getSZ(1);
  @$pb.TagNumber(2)
  set direction($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDirection() => $_has(1);
  @$pb.TagNumber(2)
  void clearDirection() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get parameters => $_getSZ(2);
  @$pb.TagNumber(3)
  set parameters($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasParameters() => $_has(2);
  @$pb.TagNumber(3)
  void clearParameters() => clearField(3);
}

class Track extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Track',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'rtc'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'streamId')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'kind')
    ..aOB(4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'muted')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rid')
    ..pc<Simulcast>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'simulcast', $pb.PbFieldType.PM, subBuilder: Simulcast.create)
    ..hasRequiredFields = false;

  Track._() : super();
  factory Track({
    $core.String? id,
    $core.String? streamId,
    $core.String? kind,
    $core.bool? muted,
    $core.String? rid,
    $core.Iterable<Simulcast>? simulcast,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (streamId != null) {
      _result.streamId = streamId;
    }
    if (kind != null) {
      _result.kind = kind;
    }
    if (muted != null) {
      _result.muted = muted;
    }
    if (rid != null) {
      _result.rid = rid;
    }
    if (simulcast != null) {
      _result.simulcast.addAll(simulcast);
    }
    return _result;
  }
  factory Track.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Track.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Track clone() => Track()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Track copyWith(void Function(Track) updates) =>
      super.copyWith((message) => updates(message as Track))
          as Track; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Track create() => Track._();
  Track createEmptyInstance() => create();
  static $pb.PbList<Track> createRepeated() => $pb.PbList<Track>();
  @$core.pragma('dart2js:noInline')
  static Track getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Track>(create);
  static Track? _defaultInstance;

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
  $core.String get streamId => $_getSZ(1);
  @$pb.TagNumber(2)
  set streamId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStreamId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStreamId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get kind => $_getSZ(2);
  @$pb.TagNumber(3)
  set kind($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasKind() => $_has(2);
  @$pb.TagNumber(3)
  void clearKind() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get muted => $_getBF(3);
  @$pb.TagNumber(4)
  set muted($core.bool v) {
    $_setBool(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMuted() => $_has(3);
  @$pb.TagNumber(4)
  void clearMuted() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get rid => $_getSZ(4);
  @$pb.TagNumber(5)
  set rid($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRid() => $_has(4);
  @$pb.TagNumber(5)
  void clearRid() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<Simulcast> get simulcast => $_getList(5);
}

class TrackEvent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TrackEvent',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'rtc'),
      createEmptyInstance: create)
    ..e<TrackEvent_State>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'state',
        $pb.PbFieldType.OE,
        defaultOrMaker: TrackEvent_State.ADD,
        valueOf: TrackEvent_State.valueOf,
        enumValues: TrackEvent_State.values)
    ..aOS(3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..pc<Track>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tracks', $pb.PbFieldType.PM, subBuilder: Track.create)
    ..hasRequiredFields = false;

  TrackEvent._() : super();
  factory TrackEvent({
    TrackEvent_State? state,
    $core.String? uid,
    $core.Iterable<Track>? tracks,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (uid != null) {
      _result.uid = uid;
    }
    if (tracks != null) {
      _result.tracks.addAll(tracks);
    }
    return _result;
  }
  factory TrackEvent.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TrackEvent.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TrackEvent clone() => TrackEvent()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TrackEvent copyWith(void Function(TrackEvent) updates) =>
      super.copyWith((message) => updates(message as TrackEvent))
          as TrackEvent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TrackEvent create() => TrackEvent._();
  TrackEvent createEmptyInstance() => create();
  static $pb.PbList<TrackEvent> createRepeated() => $pb.PbList<TrackEvent>();
  @$core.pragma('dart2js:noInline')
  static TrackEvent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TrackEvent>(create);
  static TrackEvent? _defaultInstance;

  @$pb.TagNumber(2)
  TrackEvent_State get state => $_getN(0);
  @$pb.TagNumber(2)
  set state(TrackEvent_State v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);

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
  $core.List<Track> get tracks => $_getList(2);
}

class Subscription extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Subscription',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'rtc'),
      createEmptyInstance: create)
    ..pPS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'trackIds',
        protoName: 'trackIds')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'subscribe')
    ..hasRequiredFields = false;

  Subscription._() : super();
  factory Subscription({
    $core.Iterable<$core.String>? trackIds,
    $core.bool? subscribe,
  }) {
    final _result = create();
    if (trackIds != null) {
      _result.trackIds.addAll(trackIds);
    }
    if (subscribe != null) {
      _result.subscribe = subscribe;
    }
    return _result;
  }
  factory Subscription.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Subscription.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Subscription clone() => Subscription()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Subscription copyWith(void Function(Subscription) updates) =>
      super.copyWith((message) => updates(message as Subscription))
          as Subscription; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Subscription create() => Subscription._();
  Subscription createEmptyInstance() => create();
  static $pb.PbList<Subscription> createRepeated() =>
      $pb.PbList<Subscription>();
  @$core.pragma('dart2js:noInline')
  static Subscription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Subscription>(create);
  static Subscription? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get trackIds => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get subscribe => $_getBF(1);
  @$pb.TagNumber(2)
  set subscribe($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSubscribe() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubscribe() => clearField(2);
}

class MuteTrack extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'MuteTrack',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'rtc'),
      createEmptyInstance: create)
    ..pPS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'trackIds',
        protoName: 'trackIds')
    ..aOB(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'muted')
    ..hasRequiredFields = false;

  MuteTrack._() : super();
  factory MuteTrack({
    $core.Iterable<$core.String>? trackIds,
    $core.bool? muted,
  }) {
    final _result = create();
    if (trackIds != null) {
      _result.trackIds.addAll(trackIds);
    }
    if (muted != null) {
      _result.muted = muted;
    }
    return _result;
  }
  factory MuteTrack.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MuteTrack.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MuteTrack clone() => MuteTrack()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MuteTrack copyWith(void Function(MuteTrack) updates) =>
      super.copyWith((message) => updates(message as MuteTrack))
          as MuteTrack; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MuteTrack create() => MuteTrack._();
  MuteTrack createEmptyInstance() => create();
  static $pb.PbList<MuteTrack> createRepeated() => $pb.PbList<MuteTrack>();
  @$core.pragma('dart2js:noInline')
  static MuteTrack getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MuteTrack>(create);
  static MuteTrack? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get trackIds => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get muted => $_getBF(1);
  @$pb.TagNumber(2)
  set muted($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMuted() => $_has(1);
  @$pb.TagNumber(2)
  void clearMuted() => clearField(2);
}

class SwitchScalabilityLayer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'SwitchScalabilityLayer',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'rtc'),
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trackId',
        protoName: 'trackId')
    ..a<$core.int>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'spatialLayer', $pb.PbFieldType.OU3,
        protoName: 'spatialLayer')
    ..a<$core.int>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'temporalLayer', $pb.PbFieldType.OU3,
        protoName: 'temporalLayer')
    ..hasRequiredFields = false;

  SwitchScalabilityLayer._() : super();
  factory SwitchScalabilityLayer({
    $core.String? trackId,
    $core.int? spatialLayer,
    $core.int? temporalLayer,
  }) {
    final _result = create();
    if (trackId != null) {
      _result.trackId = trackId;
    }
    if (spatialLayer != null) {
      _result.spatialLayer = spatialLayer;
    }
    if (temporalLayer != null) {
      _result.temporalLayer = temporalLayer;
    }
    return _result;
  }
  factory SwitchScalabilityLayer.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SwitchScalabilityLayer.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SwitchScalabilityLayer clone() =>
      SwitchScalabilityLayer()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SwitchScalabilityLayer copyWith(
          void Function(SwitchScalabilityLayer) updates) =>
      super.copyWith((message) => updates(message as SwitchScalabilityLayer))
          as SwitchScalabilityLayer; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SwitchScalabilityLayer create() => SwitchScalabilityLayer._();
  SwitchScalabilityLayer createEmptyInstance() => create();
  static $pb.PbList<SwitchScalabilityLayer> createRepeated() =>
      $pb.PbList<SwitchScalabilityLayer>();
  @$core.pragma('dart2js:noInline')
  static SwitchScalabilityLayer getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SwitchScalabilityLayer>(create);
  static SwitchScalabilityLayer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get trackId => $_getSZ(0);
  @$pb.TagNumber(1)
  set trackId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTrackId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrackId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get spatialLayer => $_getIZ(1);
  @$pb.TagNumber(2)
  set spatialLayer($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSpatialLayer() => $_has(1);
  @$pb.TagNumber(2)
  void clearSpatialLayer() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get temporalLayer => $_getIZ(2);
  @$pb.TagNumber(3)
  set temporalLayer($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTemporalLayer() => $_has(2);
  @$pb.TagNumber(3)
  void clearTemporalLayer() => clearField(3);
}

enum UpdateSettings_Command { subcription, switchLayer, muteTrack, notSet }

class UpdateSettings extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, UpdateSettings_Command>
      _UpdateSettings_CommandByTag = {
    1: UpdateSettings_Command.subcription,
    2: UpdateSettings_Command.switchLayer,
    3: UpdateSettings_Command.muteTrack,
    0: UpdateSettings_Command.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UpdateSettings',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'rtc'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<Subscription>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'subcription',
        subBuilder: Subscription.create)
    ..aOM<SwitchScalabilityLayer>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switchLayer',
        protoName: 'switchLayer', subBuilder: SwitchScalabilityLayer.create)
    ..aOM<MuteTrack>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'muteTrack',
        protoName: 'muteTrack', subBuilder: MuteTrack.create)
    ..hasRequiredFields = false;

  UpdateSettings._() : super();
  factory UpdateSettings({
    Subscription? subcription,
    SwitchScalabilityLayer? switchLayer,
    MuteTrack? muteTrack,
  }) {
    final _result = create();
    if (subcription != null) {
      _result.subcription = subcription;
    }
    if (switchLayer != null) {
      _result.switchLayer = switchLayer;
    }
    if (muteTrack != null) {
      _result.muteTrack = muteTrack;
    }
    return _result;
  }
  factory UpdateSettings.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpdateSettings.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpdateSettings clone() => UpdateSettings()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpdateSettings copyWith(void Function(UpdateSettings) updates) =>
      super.copyWith((message) => updates(message as UpdateSettings))
          as UpdateSettings; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateSettings create() => UpdateSettings._();
  UpdateSettings createEmptyInstance() => create();
  static $pb.PbList<UpdateSettings> createRepeated() =>
      $pb.PbList<UpdateSettings>();
  @$core.pragma('dart2js:noInline')
  static UpdateSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateSettings>(create);
  static UpdateSettings? _defaultInstance;

  UpdateSettings_Command whichCommand() =>
      _UpdateSettings_CommandByTag[$_whichOneof(0)]!;
  void clearCommand() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Subscription get subcription => $_getN(0);
  @$pb.TagNumber(1)
  set subcription(Subscription v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSubcription() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubcription() => clearField(1);
  @$pb.TagNumber(1)
  Subscription ensureSubcription() => $_ensure(0);

  @$pb.TagNumber(2)
  SwitchScalabilityLayer get switchLayer => $_getN(1);
  @$pb.TagNumber(2)
  set switchLayer(SwitchScalabilityLayer v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSwitchLayer() => $_has(1);
  @$pb.TagNumber(2)
  void clearSwitchLayer() => clearField(2);
  @$pb.TagNumber(2)
  SwitchScalabilityLayer ensureSwitchLayer() => $_ensure(1);

  @$pb.TagNumber(3)
  MuteTrack get muteTrack => $_getN(2);
  @$pb.TagNumber(3)
  set muteTrack(MuteTrack v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasMuteTrack() => $_has(2);
  @$pb.TagNumber(3)
  void clearMuteTrack() => clearField(3);
  @$pb.TagNumber(3)
  MuteTrack ensureMuteTrack() => $_ensure(2);
}

enum Signalling_Payload {
  join,
  reply,
  error,
  description,
  trickle,
  updateSettings,
  trackEvent,
  notSet
}

class Signalling extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Signalling_Payload>
      _Signalling_PayloadByTag = {
    1: Signalling_Payload.join,
    2: Signalling_Payload.reply,
    3: Signalling_Payload.error,
    4: Signalling_Payload.description,
    5: Signalling_Payload.trickle,
    6: Signalling_Payload.updateSettings,
    7: Signalling_Payload.trackEvent,
    0: Signalling_Payload.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Signalling',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'rtc'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7])
    ..aOM<JoinRequest>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'join',
        subBuilder: JoinRequest.create)
    ..aOM<JoinReply>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reply',
        subBuilder: JoinReply.create)
    ..aOM<Error>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error',
        subBuilder: Error.create)
    ..aOM<SessionDescription>(
        4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description',
        subBuilder: SessionDescription.create)
    ..aOM<Trickle>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trickle', subBuilder: Trickle.create)
    ..aOM<UpdateSettings>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateSettings', protoName: 'updateSettings', subBuilder: UpdateSettings.create)
    ..aOM<TrackEvent>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'trackEvent', protoName: 'trackEvent', subBuilder: TrackEvent.create)
    ..hasRequiredFields = false;

  Signalling._() : super();
  factory Signalling({
    JoinRequest? join,
    JoinReply? reply,
    Error? error,
    SessionDescription? description,
    Trickle? trickle,
    UpdateSettings? updateSettings,
    TrackEvent? trackEvent,
  }) {
    final _result = create();
    if (join != null) {
      _result.join = join;
    }
    if (reply != null) {
      _result.reply = reply;
    }
    if (error != null) {
      _result.error = error;
    }
    if (description != null) {
      _result.description = description;
    }
    if (trickle != null) {
      _result.trickle = trickle;
    }
    if (updateSettings != null) {
      _result.updateSettings = updateSettings;
    }
    if (trackEvent != null) {
      _result.trackEvent = trackEvent;
    }
    return _result;
  }
  factory Signalling.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Signalling.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Signalling clone() => Signalling()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Signalling copyWith(void Function(Signalling) updates) =>
      super.copyWith((message) => updates(message as Signalling))
          as Signalling; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Signalling create() => Signalling._();
  Signalling createEmptyInstance() => create();
  static $pb.PbList<Signalling> createRepeated() => $pb.PbList<Signalling>();
  @$core.pragma('dart2js:noInline')
  static Signalling getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Signalling>(create);
  static Signalling? _defaultInstance;

  Signalling_Payload whichPayload() =>
      _Signalling_PayloadByTag[$_whichOneof(0)]!;
  void clearPayload() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  JoinRequest get join => $_getN(0);
  @$pb.TagNumber(1)
  set join(JoinRequest v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasJoin() => $_has(0);
  @$pb.TagNumber(1)
  void clearJoin() => clearField(1);
  @$pb.TagNumber(1)
  JoinRequest ensureJoin() => $_ensure(0);

  @$pb.TagNumber(2)
  JoinReply get reply => $_getN(1);
  @$pb.TagNumber(2)
  set reply(JoinReply v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasReply() => $_has(1);
  @$pb.TagNumber(2)
  void clearReply() => clearField(2);
  @$pb.TagNumber(2)
  JoinReply ensureReply() => $_ensure(1);

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

  @$pb.TagNumber(4)
  SessionDescription get description => $_getN(3);
  @$pb.TagNumber(4)
  set description(SessionDescription v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);
  @$pb.TagNumber(4)
  SessionDescription ensureDescription() => $_ensure(3);

  @$pb.TagNumber(5)
  Trickle get trickle => $_getN(4);
  @$pb.TagNumber(5)
  set trickle(Trickle v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTrickle() => $_has(4);
  @$pb.TagNumber(5)
  void clearTrickle() => clearField(5);
  @$pb.TagNumber(5)
  Trickle ensureTrickle() => $_ensure(4);

  @$pb.TagNumber(6)
  UpdateSettings get updateSettings => $_getN(5);
  @$pb.TagNumber(6)
  set updateSettings(UpdateSettings v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUpdateSettings() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdateSettings() => clearField(6);
  @$pb.TagNumber(6)
  UpdateSettings ensureUpdateSettings() => $_ensure(5);

  @$pb.TagNumber(7)
  TrackEvent get trackEvent => $_getN(6);
  @$pb.TagNumber(7)
  set trackEvent(TrackEvent v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasTrackEvent() => $_has(6);
  @$pb.TagNumber(7)
  void clearTrackEvent() => clearField(7);
  @$pb.TagNumber(7)
  TrackEvent ensureTrackEvent() => $_ensure(6);
}
