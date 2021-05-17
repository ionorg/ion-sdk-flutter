///
//  Generated code. Do not modify.
//  source: proto/ion/ion.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class SessionEvent_State extends $pb.ProtobufEnum {
  static const SessionEvent_State ADD = SessionEvent_State._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ADD');
  static const SessionEvent_State REMOVE = SessionEvent_State._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'REMOVE');

  static const $core.List<SessionEvent_State> values = <SessionEvent_State>[
    ADD,
    REMOVE,
  ];

  static final $core.Map<$core.int, SessionEvent_State> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SessionEvent_State? valueOf($core.int value) => _byValue[value];

  const SessionEvent_State._($core.int v, $core.String n) : super(v, n);
}

class StreamEvent_State extends $pb.ProtobufEnum {
  static const StreamEvent_State ADD = StreamEvent_State._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ADD');
  static const StreamEvent_State REMOVE = StreamEvent_State._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'REMOVE');

  static const $core.List<StreamEvent_State> values = <StreamEvent_State>[
    ADD,
    REMOVE,
  ];

  static final $core.Map<$core.int, StreamEvent_State> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static StreamEvent_State? valueOf($core.int value) => _byValue[value];

  const StreamEvent_State._($core.int v, $core.String n) : super(v, n);
}

class PeerEvent_State extends $pb.ProtobufEnum {
  static const PeerEvent_State JOIN = PeerEvent_State._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'JOIN');
  static const PeerEvent_State UPDATE = PeerEvent_State._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'UPDATE');
  static const PeerEvent_State LEAVE = PeerEvent_State._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'LEAVE');

  static const $core.List<PeerEvent_State> values = <PeerEvent_State>[
    JOIN,
    UPDATE,
    LEAVE,
  ];

  static final $core.Map<$core.int, PeerEvent_State> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static PeerEvent_State? valueOf($core.int value) => _byValue[value];

  const PeerEvent_State._($core.int v, $core.String n) : super(v, n);
}
