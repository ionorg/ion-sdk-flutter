///
//  Generated code. Do not modify.
//  source: sfu.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Trickle_Target extends $pb.ProtobufEnum {
  static const Trickle_Target PUBLISHER = Trickle_Target._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'PUBLISHER');
  static const Trickle_Target SUBSCRIBER = Trickle_Target._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SUBSCRIBER');

  static const $core.List<Trickle_Target> values = <Trickle_Target>[
    PUBLISHER,
    SUBSCRIBER,
  ];

  static final $core.Map<$core.int, Trickle_Target> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Trickle_Target valueOf($core.int value) => _byValue[value];

  const Trickle_Target._($core.int v, $core.String n) : super(v, n);
}
