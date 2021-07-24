///
//  Generated code. Do not modify.
//  source: proto/room/room.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Role extends $pb.ProtobufEnum {
  static const Role RoleHost = Role._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'RoleHost');
  static const Role RoleGuest = Role._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'RoleGuest');

  static const $core.List<Role> values = <Role>[
    RoleHost,
    RoleGuest,
  ];

  static final $core.Map<$core.int, Role> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Role? valueOf($core.int value) => _byValue[value];

  const Role._($core.int v, $core.String n) : super(v, n);
}

class Protocol extends $pb.ProtobufEnum {
  static const Protocol ProtocolUnknown = Protocol._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ProtocolUnknown');
  static const Protocol ProtocolWebRTC = Protocol._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ProtocolWebRTC');
  static const Protocol ProtocolSIP = Protocol._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ProtocolSIP');
  static const Protocol ProtocolRTMP = Protocol._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ProtocolRTMP');

  static const $core.List<Protocol> values = <Protocol>[
    ProtocolUnknown,
    ProtocolWebRTC,
    ProtocolSIP,
    ProtocolRTMP,
  ];

  static final $core.Map<$core.int, Protocol> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Protocol? valueOf($core.int value) => _byValue[value];

  const Protocol._($core.int v, $core.String n) : super(v, n);
}

class ParticipantStatus extends $pb.ProtobufEnum {
  static const ParticipantStatus Create = ParticipantStatus._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Create');
  static const ParticipantStatus Update = ParticipantStatus._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Update');
  static const ParticipantStatus Delete = ParticipantStatus._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Delete');

  static const $core.List<ParticipantStatus> values = <ParticipantStatus>[
    Create,
    Update,
    Delete,
  ];

  static final $core.Map<$core.int, ParticipantStatus> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ParticipantStatus? valueOf($core.int value) => _byValue[value];

  const ParticipantStatus._($core.int v, $core.String n) : super(v, n);
}

class StreamType extends $pb.ProtobufEnum {
  static const StreamType UserMedia = StreamType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'UserMedia');
  static const StreamType Presentation = StreamType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Presentation');
  static const StreamType Streaming = StreamType._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Streaming');

  static const $core.List<StreamType> values = <StreamType>[
    UserMedia,
    Presentation,
    Streaming,
  ];

  static final $core.Map<$core.int, StreamType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static StreamType? valueOf($core.int value) => _byValue[value];

  const StreamType._($core.int v, $core.String n) : super(v, n);
}
