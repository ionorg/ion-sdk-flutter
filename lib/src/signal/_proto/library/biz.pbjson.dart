///
//  Generated code. Do not modify.
//  source: biz.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use joinDescriptor instead')
const Join$json = const {
  '1': 'Join',
  '2': const [
    const {'1': 'peer', '3': 1, '4': 1, '5': 11, '6': '.ion.Peer', '10': 'peer'},
    const {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `Join`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinDescriptor = $convert.base64Decode('CgRKb2luEh0KBHBlZXIYASABKAsyCS5pb24uUGVlclIEcGVlchIUCgV0b2tlbhgCIAEoCVIFdG9rZW4=');
@$core.Deprecated('Use joinReplyDescriptor instead')
const JoinReply$json = const {
  '1': 'JoinReply',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `JoinReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinReplyDescriptor = $convert.base64Decode('CglKb2luUmVwbHkSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIWCgZyZWFzb24YAiABKAlSBnJlYXNvbg==');
@$core.Deprecated('Use leaveDescriptor instead')
const Leave$json = const {
  '1': 'Leave',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `Leave`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaveDescriptor = $convert.base64Decode('CgVMZWF2ZRIQCgN1aWQYASABKAlSA3VpZA==');
@$core.Deprecated('Use leaveReplyDescriptor instead')
const LeaveReply$json = const {
  '1': 'LeaveReply',
  '2': const [
    const {'1': 'reason', '3': 1, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `LeaveReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaveReplyDescriptor = $convert.base64Decode('CgpMZWF2ZVJlcGx5EhYKBnJlYXNvbhgBIAEoCVIGcmVhc29u');
@$core.Deprecated('Use signalRequestDescriptor instead')
const SignalRequest$json = const {
  '1': 'SignalRequest',
  '2': const [
    const {'1': 'join', '3': 1, '4': 1, '5': 11, '6': '.biz.Join', '9': 0, '10': 'join'},
    const {'1': 'leave', '3': 2, '4': 1, '5': 11, '6': '.biz.Leave', '9': 0, '10': 'leave'},
    const {'1': 'msg', '3': 4, '4': 1, '5': 11, '6': '.ion.Message', '9': 0, '10': 'msg'},
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};

/// Descriptor for `SignalRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signalRequestDescriptor = $convert.base64Decode('Cg1TaWduYWxSZXF1ZXN0Eh8KBGpvaW4YASABKAsyCS5iaXouSm9pbkgAUgRqb2luEiIKBWxlYXZlGAIgASgLMgouYml6LkxlYXZlSABSBWxlYXZlEiAKA21zZxgEIAEoCzIMLmlvbi5NZXNzYWdlSABSA21zZ0IJCgdwYXlsb2Fk');
@$core.Deprecated('Use signalReplyDescriptor instead')
const SignalReply$json = const {
  '1': 'SignalReply',
  '2': const [
    const {'1': 'joinReply', '3': 1, '4': 1, '5': 11, '6': '.biz.JoinReply', '9': 0, '10': 'joinReply'},
    const {'1': 'leaveReply', '3': 2, '4': 1, '5': 11, '6': '.biz.LeaveReply', '9': 0, '10': 'leaveReply'},
    const {'1': 'peerEvent', '3': 3, '4': 1, '5': 11, '6': '.ion.PeerEvent', '9': 0, '10': 'peerEvent'},
    const {'1': 'streamEvent', '3': 4, '4': 1, '5': 11, '6': '.ion.StreamEvent', '9': 0, '10': 'streamEvent'},
    const {'1': 'msg', '3': 5, '4': 1, '5': 11, '6': '.ion.Message', '9': 0, '10': 'msg'},
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};

/// Descriptor for `SignalReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signalReplyDescriptor = $convert.base64Decode('CgtTaWduYWxSZXBseRIuCglqb2luUmVwbHkYASABKAsyDi5iaXouSm9pblJlcGx5SABSCWpvaW5SZXBseRIxCgpsZWF2ZVJlcGx5GAIgASgLMg8uYml6LkxlYXZlUmVwbHlIAFIKbGVhdmVSZXBseRIuCglwZWVyRXZlbnQYAyABKAsyDi5pb24uUGVlckV2ZW50SABSCXBlZXJFdmVudBI0CgtzdHJlYW1FdmVudBgEIAEoCzIQLmlvbi5TdHJlYW1FdmVudEgAUgtzdHJlYW1FdmVudBIgCgNtc2cYBSABKAsyDC5pb24uTWVzc2FnZUgAUgNtc2dCCQoHcGF5bG9hZA==');
