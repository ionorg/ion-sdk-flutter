///
//  Generated code. Do not modify.
//  source: apps/room/proto/room.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ErrorType extends $pb.ProtobufEnum {
  static const ErrorType None = ErrorType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'None');
  static const ErrorType UnkownError = ErrorType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'UnkownError');
  static const ErrorType PermissionDenied = ErrorType._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PermissionDenied');
  static const ErrorType ServiceUnavailable = ErrorType._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ServiceUnavailable');
  static const ErrorType RoomLocked = ErrorType._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'RoomLocked');
  static const ErrorType PasswordRequired = ErrorType._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PasswordRequired');
  static const ErrorType RoomAlreadyExist = ErrorType._(
      6,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'RoomAlreadyExist');
  static const ErrorType RoomNotExist = ErrorType._(
      7,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'RoomNotExist');
  static const ErrorType InvalidParams = ErrorType._(
      8,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'InvalidParams');
  static const ErrorType PeerAlreadyExist = ErrorType._(
      9,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PeerAlreadyExist');
  static const ErrorType PeerNotExist = ErrorType._(
      10,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PeerNotExist');

  static const $core.List<ErrorType> values = <ErrorType>[
    None,
    UnkownError,
    PermissionDenied,
    ServiceUnavailable,
    RoomLocked,
    PasswordRequired,
    RoomAlreadyExist,
    RoomNotExist,
    InvalidParams,
    PeerAlreadyExist,
    PeerNotExist,
  ];

  static final $core.Map<$core.int, ErrorType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ErrorType? valueOf($core.int value) => _byValue[value];

  const ErrorType._($core.int v, $core.String n) : super(v, n);
}

class Role extends $pb.ProtobufEnum {
  static const Role Host = Role._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Host');
  static const Role Guest = Role._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Guest');

  static const $core.List<Role> values = <Role>[
    Host,
    Guest,
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
  static const Protocol WebRTC = Protocol._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'WebRTC');
  static const Protocol SIP = Protocol._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SIP');
  static const Protocol RTMP = Protocol._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'RTMP');
  static const Protocol RTSP = Protocol._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'RTSP');

  static const $core.List<Protocol> values = <Protocol>[
    ProtocolUnknown,
    WebRTC,
    SIP,
    RTMP,
    RTSP,
  ];

  static final $core.Map<$core.int, Protocol> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Protocol? valueOf($core.int value) => _byValue[value];

  const Protocol._($core.int v, $core.String n) : super(v, n);
}

class PeerState extends $pb.ProtobufEnum {
  static const PeerState JOIN = PeerState._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'JOIN');
  static const PeerState UPDATE = PeerState._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'UPDATE');
  static const PeerState LEAVE = PeerState._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'LEAVE');

  static const $core.List<PeerState> values = <PeerState>[
    JOIN,
    UPDATE,
    LEAVE,
  ];

  static final $core.Map<$core.int, PeerState> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static PeerState? valueOf($core.int value) => _byValue[value];

  const PeerState._($core.int v, $core.String n) : super(v, n);
}

class Peer_Direction extends $pb.ProtobufEnum {
  static const Peer_Direction INCOMING = Peer_Direction._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'INCOMING');
  static const Peer_Direction OUTGOING = Peer_Direction._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'OUTGOING');
  static const Peer_Direction BILATERAL = Peer_Direction._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'BILATERAL');

  static const $core.List<Peer_Direction> values = <Peer_Direction>[
    INCOMING,
    OUTGOING,
    BILATERAL,
  ];

  static final $core.Map<$core.int, Peer_Direction> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Peer_Direction? valueOf($core.int value) => _byValue[value];

  const Peer_Direction._($core.int v, $core.String n) : super(v, n);
}
