///
//  Generated code. Do not modify.
//  source: sfu.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use signalRequestDescriptor instead')
const SignalRequest$json = const {
  '1': 'SignalRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'join', '3': 2, '4': 1, '5': 11, '6': '.sfu.JoinRequest', '9': 0, '10': 'join'},
    const {'1': 'description', '3': 3, '4': 1, '5': 12, '9': 0, '10': 'description'},
    const {'1': 'trickle', '3': 4, '4': 1, '5': 11, '6': '.sfu.Trickle', '9': 0, '10': 'trickle'},
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};

/// Descriptor for `SignalRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signalRequestDescriptor = $convert.base64Decode('Cg1TaWduYWxSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZBImCgRqb2luGAIgASgLMhAuc2Z1LkpvaW5SZXF1ZXN0SABSBGpvaW4SIgoLZGVzY3JpcHRpb24YAyABKAxIAFILZGVzY3JpcHRpb24SKAoHdHJpY2tsZRgEIAEoCzIMLnNmdS5Ucmlja2xlSABSB3RyaWNrbGVCCQoHcGF5bG9hZA==');
@$core.Deprecated('Use signalReplyDescriptor instead')
const SignalReply$json = const {
  '1': 'SignalReply',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'join', '3': 2, '4': 1, '5': 11, '6': '.sfu.JoinReply', '9': 0, '10': 'join'},
    const {'1': 'description', '3': 3, '4': 1, '5': 12, '9': 0, '10': 'description'},
    const {'1': 'trickle', '3': 4, '4': 1, '5': 11, '6': '.sfu.Trickle', '9': 0, '10': 'trickle'},
    const {'1': 'iceConnectionState', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'iceConnectionState'},
    const {'1': 'error', '3': 6, '4': 1, '5': 9, '9': 0, '10': 'error'},
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};

/// Descriptor for `SignalReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signalReplyDescriptor = $convert.base64Decode('CgtTaWduYWxSZXBseRIOCgJpZBgBIAEoCVICaWQSJAoEam9pbhgCIAEoCzIOLnNmdS5Kb2luUmVwbHlIAFIEam9pbhIiCgtkZXNjcmlwdGlvbhgDIAEoDEgAUgtkZXNjcmlwdGlvbhIoCgd0cmlja2xlGAQgASgLMgwuc2Z1LlRyaWNrbGVIAFIHdHJpY2tsZRIwChJpY2VDb25uZWN0aW9uU3RhdGUYBSABKAlIAFISaWNlQ29ubmVjdGlvblN0YXRlEhYKBWVycm9yGAYgASgJSABSBWVycm9yQgkKB3BheWxvYWQ=');
@$core.Deprecated('Use joinRequestDescriptor instead')
const JoinRequest$json = const {
  '1': 'JoinRequest',
  '2': const [
    const {'1': 'sid', '3': 1, '4': 1, '5': 9, '10': 'sid'},
    const {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'description', '3': 3, '4': 1, '5': 12, '10': 'description'},
  ],
};

/// Descriptor for `JoinRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinRequestDescriptor = $convert.base64Decode('CgtKb2luUmVxdWVzdBIQCgNzaWQYASABKAlSA3NpZBIQCgN1aWQYAiABKAlSA3VpZBIgCgtkZXNjcmlwdGlvbhgDIAEoDFILZGVzY3JpcHRpb24=');
@$core.Deprecated('Use joinReplyDescriptor instead')
const JoinReply$json = const {
  '1': 'JoinReply',
  '2': const [
    const {'1': 'description', '3': 1, '4': 1, '5': 12, '10': 'description'},
  ],
};

/// Descriptor for `JoinReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinReplyDescriptor = $convert.base64Decode('CglKb2luUmVwbHkSIAoLZGVzY3JpcHRpb24YASABKAxSC2Rlc2NyaXB0aW9u');
@$core.Deprecated('Use trickleDescriptor instead')
const Trickle$json = const {
  '1': 'Trickle',
  '2': const [
    const {'1': 'target', '3': 1, '4': 1, '5': 14, '6': '.sfu.Trickle.Target', '10': 'target'},
    const {'1': 'init', '3': 2, '4': 1, '5': 9, '10': 'init'},
  ],
  '4': const [Trickle_Target$json],
};

@$core.Deprecated('Use trickleDescriptor instead')
const Trickle_Target$json = const {
  '1': 'Target',
  '2': const [
    const {'1': 'PUBLISHER', '2': 0},
    const {'1': 'SUBSCRIBER', '2': 1},
  ],
};

/// Descriptor for `Trickle`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trickleDescriptor = $convert.base64Decode('CgdUcmlja2xlEisKBnRhcmdldBgBIAEoDjITLnNmdS5Ucmlja2xlLlRhcmdldFIGdGFyZ2V0EhIKBGluaXQYAiABKAlSBGluaXQiJwoGVGFyZ2V0Eg0KCVBVQkxJU0hFUhAAEg4KClNVQlNDUklCRVIQAQ==');
