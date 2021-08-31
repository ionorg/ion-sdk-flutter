///
//  Generated code. Do not modify.
//  source: proto/ion/ion.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor =
    $convert.base64Decode('CgVFbXB0eQ==');
@$core.Deprecated('Use rPCDescriptor instead')
const RPC$json = const {
  '1': 'RPC',
  '2': const [
    const {'1': 'protocol', '3': 1, '4': 1, '5': 9, '10': 'protocol'},
    const {'1': 'addr', '3': 2, '4': 1, '5': 9, '10': 'addr'},
    const {
      '1': 'params',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.ion.RPC.ParamsEntry',
      '10': 'params'
    },
  ],
  '3': const [RPC_ParamsEntry$json],
};

@$core.Deprecated('Use rPCDescriptor instead')
const RPC_ParamsEntry$json = const {
  '1': 'ParamsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `RPC`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rPCDescriptor = $convert.base64Decode(
    'CgNSUEMSGgoIcHJvdG9jb2wYASABKAlSCHByb3RvY29sEhIKBGFkZHIYAiABKAlSBGFkZHISLAoGcGFyYW1zGAMgAygLMhQuaW9uLlJQQy5QYXJhbXNFbnRyeVIGcGFyYW1zGjkKC1BhcmFtc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAE=');
@$core.Deprecated('Use nodeDescriptor instead')
const Node$json = const {
  '1': 'Node',
  '2': const [
    const {'1': 'dc', '3': 1, '4': 1, '5': 9, '10': 'dc'},
    const {'1': 'nid', '3': 2, '4': 1, '5': 9, '10': 'nid'},
    const {'1': 'service', '3': 3, '4': 1, '5': 9, '10': 'service'},
    const {'1': 'rpc', '3': 4, '4': 1, '5': 11, '6': '.ion.RPC', '10': 'rpc'},
  ],
};

/// Descriptor for `Node`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeDescriptor = $convert.base64Decode(
    'CgROb2RlEg4KAmRjGAEgASgJUgJkYxIQCgNuaWQYAiABKAlSA25pZBIYCgdzZXJ2aWNlGAMgASgJUgdzZXJ2aWNlEhoKA3JwYxgEIAEoCzIILmlvbi5SUENSA3JwYw==');
