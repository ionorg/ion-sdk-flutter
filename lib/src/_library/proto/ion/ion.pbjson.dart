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
@$core.Deprecated('Use trackDescriptor instead')
const Track$json = const {
  '1': 'Track',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'label', '3': 2, '4': 1, '5': 9, '10': 'label'},
    const {'1': 'kind', '3': 3, '4': 1, '5': 9, '10': 'kind'},
    const {
      '1': 'simulcast',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.ion.Track.SimulcastEntry',
      '10': 'simulcast'
    },
  ],
  '3': const [Track_SimulcastEntry$json],
};

@$core.Deprecated('Use trackDescriptor instead')
const Track_SimulcastEntry$json = const {
  '1': 'SimulcastEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `Track`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackDescriptor = $convert.base64Decode(
    'CgVUcmFjaxIOCgJpZBgBIAEoCVICaWQSFAoFbGFiZWwYAiABKAlSBWxhYmVsEhIKBGtpbmQYAyABKAlSBGtpbmQSNwoJc2ltdWxjYXN0GAQgAygLMhkuaW9uLlRyYWNrLlNpbXVsY2FzdEVudHJ5UglzaW11bGNhc3QaPAoOU2ltdWxjYXN0RW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');
@$core.Deprecated('Use streamDescriptor instead')
const Stream$json = const {
  '1': 'Stream',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {
      '1': 'tracks',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.ion.Track',
      '10': 'tracks'
    },
  ],
};

/// Descriptor for `Stream`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamDescriptor = $convert.base64Decode(
    'CgZTdHJlYW0SDgoCaWQYASABKAlSAmlkEiIKBnRyYWNrcxgCIAMoCzIKLmlvbi5UcmFja1IGdHJhY2tz');
@$core.Deprecated('Use peerDescriptor instead')
const Peer$json = const {
  '1': 'Peer',
  '2': const [
    const {'1': 'sid', '3': 1, '4': 1, '5': 9, '10': 'sid'},
    const {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'info', '3': 3, '4': 1, '5': 12, '10': 'info'},
  ],
};

/// Descriptor for `Peer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List peerDescriptor = $convert.base64Decode(
    'CgRQZWVyEhAKA3NpZBgBIAEoCVIDc2lkEhAKA3VpZBgCIAEoCVIDdWlkEhIKBGluZm8YAyABKAxSBGluZm8=');
@$core.Deprecated('Use sessionEventDescriptor instead')
const SessionEvent$json = const {
  '1': 'SessionEvent',
  '2': const [
    const {
      '1': 'state',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.ion.SessionEvent.State',
      '10': 'state'
    },
    const {'1': 'nid', '3': 3, '4': 1, '5': 9, '10': 'nid'},
    const {'1': 'sid', '3': 4, '4': 1, '5': 9, '10': 'sid'},
  ],
  '4': const [SessionEvent_State$json],
};

@$core.Deprecated('Use sessionEventDescriptor instead')
const SessionEvent_State$json = const {
  '1': 'State',
  '2': const [
    const {'1': 'ADD', '2': 0},
    const {'1': 'REMOVE', '2': 1},
  ],
};

/// Descriptor for `SessionEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionEventDescriptor = $convert.base64Decode(
    'CgxTZXNzaW9uRXZlbnQSLQoFc3RhdGUYAiABKA4yFy5pb24uU2Vzc2lvbkV2ZW50LlN0YXRlUgVzdGF0ZRIQCgNuaWQYAyABKAlSA25pZBIQCgNzaWQYBCABKAlSA3NpZCIcCgVTdGF0ZRIHCgNBREQQABIKCgZSRU1PVkUQAQ==');
@$core.Deprecated('Use streamEventDescriptor instead')
const StreamEvent$json = const {
  '1': 'StreamEvent',
  '2': const [
    const {
      '1': 'state',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.ion.StreamEvent.State',
      '10': 'state'
    },
    const {'1': 'nid', '3': 3, '4': 1, '5': 9, '10': 'nid'},
    const {'1': 'sid', '3': 4, '4': 1, '5': 9, '10': 'sid'},
    const {'1': 'uid', '3': 5, '4': 1, '5': 9, '10': 'uid'},
    const {
      '1': 'streams',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.ion.Stream',
      '10': 'streams'
    },
  ],
  '4': const [StreamEvent_State$json],
};

@$core.Deprecated('Use streamEventDescriptor instead')
const StreamEvent_State$json = const {
  '1': 'State',
  '2': const [
    const {'1': 'ADD', '2': 0},
    const {'1': 'REMOVE', '2': 1},
  ],
};

/// Descriptor for `StreamEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamEventDescriptor = $convert.base64Decode(
    'CgtTdHJlYW1FdmVudBIsCgVzdGF0ZRgCIAEoDjIWLmlvbi5TdHJlYW1FdmVudC5TdGF0ZVIFc3RhdGUSEAoDbmlkGAMgASgJUgNuaWQSEAoDc2lkGAQgASgJUgNzaWQSEAoDdWlkGAUgASgJUgN1aWQSJQoHc3RyZWFtcxgGIAMoCzILLmlvbi5TdHJlYW1SB3N0cmVhbXMiHAoFU3RhdGUSBwoDQUREEAASCgoGUkVNT1ZFEAE=');
@$core.Deprecated('Use peerEventDescriptor instead')
const PeerEvent$json = const {
  '1': 'PeerEvent',
  '2': const [
    const {
      '1': 'state',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.ion.PeerEvent.State',
      '10': 'state'
    },
    const {
      '1': 'peer',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.ion.Peer',
      '10': 'peer'
    },
  ],
  '4': const [PeerEvent_State$json],
};

@$core.Deprecated('Use peerEventDescriptor instead')
const PeerEvent_State$json = const {
  '1': 'State',
  '2': const [
    const {'1': 'JOIN', '2': 0},
    const {'1': 'UPDATE', '2': 1},
    const {'1': 'LEAVE', '2': 2},
  ],
};

/// Descriptor for `PeerEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List peerEventDescriptor = $convert.base64Decode(
    'CglQZWVyRXZlbnQSKgoFc3RhdGUYAyABKA4yFC5pb24uUGVlckV2ZW50LlN0YXRlUgVzdGF0ZRIdCgRwZWVyGAQgASgLMgkuaW9uLlBlZXJSBHBlZXIiKAoFU3RhdGUSCAoESk9JThAAEgoKBlVQREFURRABEgkKBUxFQVZFEAI=');
@$core.Deprecated('Use messageDescriptor instead')
const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'from', '3': 1, '4': 1, '5': 9, '10': 'from'},
    const {'1': 'to', '3': 2, '4': 1, '5': 9, '10': 'to'},
    const {'1': 'data', '3': 3, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEhIKBGZyb20YASABKAlSBGZyb20SDgoCdG8YAiABKAlSAnRvEhIKBGRhdGEYAyABKAxSBGRhdGE=');
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
