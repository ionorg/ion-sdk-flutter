///
//  Generated code. Do not modify.
//  source: proto/rtc/rtc.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use targetDescriptor instead')
const Target$json = const {
  '1': 'Target',
  '2': const [
    const {'1': 'PUBLISHER', '2': 0},
    const {'1': 'SUBSCRIBER', '2': 1},
  ],
};

/// Descriptor for `Target`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List targetDescriptor = $convert
    .base64Decode('CgZUYXJnZXQSDQoJUFVCTElTSEVSEAASDgoKU1VCU0NSSUJFUhAB');
@$core.Deprecated('Use joinRequestDescriptor instead')
const JoinRequest$json = const {
  '1': 'JoinRequest',
  '2': const [
    const {'1': 'sid', '3': 1, '4': 1, '5': 9, '10': 'sid'},
    const {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
    const {
      '1': 'config',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.rtc.JoinRequest.ConfigEntry',
      '10': 'config'
    },
    const {
      '1': 'description',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.rtc.SessionDescription',
      '10': 'description'
    },
  ],
  '3': const [JoinRequest_ConfigEntry$json],
};

@$core.Deprecated('Use joinRequestDescriptor instead')
const JoinRequest_ConfigEntry$json = const {
  '1': 'ConfigEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `JoinRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinRequestDescriptor = $convert.base64Decode(
    'CgtKb2luUmVxdWVzdBIQCgNzaWQYASABKAlSA3NpZBIQCgN1aWQYAiABKAlSA3VpZBI0CgZjb25maWcYAyADKAsyHC5ydGMuSm9pblJlcXVlc3QuQ29uZmlnRW50cnlSBmNvbmZpZxI5CgtkZXNjcmlwdGlvbhgEIAEoCzIXLnJ0Yy5TZXNzaW9uRGVzY3JpcHRpb25SC2Rlc2NyaXB0aW9uGjkKC0NvbmZpZ0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAE=');
@$core.Deprecated('Use joinReplyDescriptor instead')
const JoinReply$json = const {
  '1': 'JoinReply',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {
      '1': 'error',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.rtc.Error',
      '10': 'error'
    },
    const {
      '1': 'description',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.rtc.SessionDescription',
      '10': 'description'
    },
  ],
};

/// Descriptor for `JoinReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinReplyDescriptor = $convert.base64Decode(
    'CglKb2luUmVwbHkSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIgCgVlcnJvchgCIAEoCzIKLnJ0Yy5FcnJvclIFZXJyb3ISOQoLZGVzY3JpcHRpb24YAyABKAsyFy5ydGMuU2Vzc2lvbkRlc2NyaXB0aW9uUgtkZXNjcmlwdGlvbg==');
@$core.Deprecated('Use sessionDescriptionDescriptor instead')
const SessionDescription$json = const {
  '1': 'SessionDescription',
  '2': const [
    const {
      '1': 'target',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.rtc.Target',
      '10': 'target'
    },
    const {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'sdp', '3': 3, '4': 1, '5': 9, '10': 'sdp'},
  ],
};

/// Descriptor for `SessionDescription`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionDescriptionDescriptor = $convert.base64Decode(
    'ChJTZXNzaW9uRGVzY3JpcHRpb24SIwoGdGFyZ2V0GAEgASgOMgsucnRjLlRhcmdldFIGdGFyZ2V0EhIKBHR5cGUYAiABKAlSBHR5cGUSEAoDc2RwGAMgASgJUgNzZHA=');
@$core.Deprecated('Use trickleDescriptor instead')
const Trickle$json = const {
  '1': 'Trickle',
  '2': const [
    const {
      '1': 'target',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.rtc.Target',
      '10': 'target'
    },
    const {'1': 'init', '3': 2, '4': 1, '5': 9, '10': 'init'},
  ],
};

/// Descriptor for `Trickle`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trickleDescriptor = $convert.base64Decode(
    'CgdUcmlja2xlEiMKBnRhcmdldBgBIAEoDjILLnJ0Yy5UYXJnZXRSBnRhcmdldBISCgRpbml0GAIgASgJUgRpbml0');
@$core.Deprecated('Use errorDescriptor instead')
const Error$json = const {
  '1': 'Error',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    const {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `Error`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorDescriptor = $convert.base64Decode(
    'CgVFcnJvchISCgRjb2RlGAEgASgFUgRjb2RlEhYKBnJlYXNvbhgCIAEoCVIGcmVhc29u');
@$core.Deprecated('Use simulcastDescriptor instead')
const Simulcast$json = const {
  '1': 'Simulcast',
  '2': const [
    const {'1': 'rid', '3': 1, '4': 1, '5': 9, '10': 'rid'},
    const {'1': 'direction', '3': 2, '4': 1, '5': 9, '10': 'direction'},
    const {'1': 'parameters', '3': 3, '4': 1, '5': 9, '10': 'parameters'},
  ],
};

/// Descriptor for `Simulcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List simulcastDescriptor = $convert.base64Decode(
    'CglTaW11bGNhc3QSEAoDcmlkGAEgASgJUgNyaWQSHAoJZGlyZWN0aW9uGAIgASgJUglkaXJlY3Rpb24SHgoKcGFyYW1ldGVycxgDIAEoCVIKcGFyYW1ldGVycw==');
@$core.Deprecated('Use trackDescriptor instead')
const Track$json = const {
  '1': 'Track',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'stream_id', '3': 2, '4': 1, '5': 9, '10': 'streamId'},
    const {'1': 'kind', '3': 3, '4': 1, '5': 9, '10': 'kind'},
    const {'1': 'muted', '3': 4, '4': 1, '5': 8, '10': 'muted'},
    const {'1': 'rid', '3': 5, '4': 1, '5': 9, '10': 'rid'},
    const {
      '1': 'simulcast',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.rtc.Simulcast',
      '10': 'simulcast'
    },
  ],
};

/// Descriptor for `Track`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackDescriptor = $convert.base64Decode(
    'CgVUcmFjaxIOCgJpZBgBIAEoCVICaWQSGwoJc3RyZWFtX2lkGAIgASgJUghzdHJlYW1JZBISCgRraW5kGAMgASgJUgRraW5kEhQKBW11dGVkGAQgASgIUgVtdXRlZBIQCgNyaWQYBSABKAlSA3JpZBIsCglzaW11bGNhc3QYBiADKAsyDi5ydGMuU2ltdWxjYXN0UglzaW11bGNhc3Q=');
@$core.Deprecated('Use trackEventDescriptor instead')
const TrackEvent$json = const {
  '1': 'TrackEvent',
  '2': const [
    const {
      '1': 'state',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.rtc.TrackEvent.State',
      '10': 'state'
    },
    const {'1': 'uid', '3': 3, '4': 1, '5': 9, '10': 'uid'},
    const {
      '1': 'tracks',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.rtc.Track',
      '10': 'tracks'
    },
  ],
  '4': const [TrackEvent_State$json],
};

@$core.Deprecated('Use trackEventDescriptor instead')
const TrackEvent_State$json = const {
  '1': 'State',
  '2': const [
    const {'1': 'ADD', '2': 0},
    const {'1': 'REMOVE', '2': 1},
  ],
};

/// Descriptor for `TrackEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackEventDescriptor = $convert.base64Decode(
    'CgpUcmFja0V2ZW50EisKBXN0YXRlGAIgASgOMhUucnRjLlRyYWNrRXZlbnQuU3RhdGVSBXN0YXRlEhAKA3VpZBgDIAEoCVIDdWlkEiIKBnRyYWNrcxgEIAMoCzIKLnJ0Yy5UcmFja1IGdHJhY2tzIhwKBVN0YXRlEgcKA0FERBAAEgoKBlJFTU9WRRAB');
@$core.Deprecated('Use subscriptionDescriptor instead')
const Subscription$json = const {
  '1': 'Subscription',
  '2': const [
    const {'1': 'trackIds', '3': 1, '4': 3, '5': 9, '10': 'trackIds'},
    const {'1': 'subscribe', '3': 2, '4': 1, '5': 8, '10': 'subscribe'},
  ],
};

/// Descriptor for `Subscription`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscriptionDescriptor = $convert.base64Decode(
    'CgxTdWJzY3JpcHRpb24SGgoIdHJhY2tJZHMYASADKAlSCHRyYWNrSWRzEhwKCXN1YnNjcmliZRgCIAEoCFIJc3Vic2NyaWJl');
@$core.Deprecated('Use muteTrackDescriptor instead')
const MuteTrack$json = const {
  '1': 'MuteTrack',
  '2': const [
    const {'1': 'trackIds', '3': 1, '4': 3, '5': 9, '10': 'trackIds'},
    const {'1': 'muted', '3': 2, '4': 1, '5': 8, '10': 'muted'},
  ],
};

/// Descriptor for `MuteTrack`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List muteTrackDescriptor = $convert.base64Decode(
    'CglNdXRlVHJhY2sSGgoIdHJhY2tJZHMYASADKAlSCHRyYWNrSWRzEhQKBW11dGVkGAIgASgIUgVtdXRlZA==');
@$core.Deprecated('Use switchScalabilityLayerDescriptor instead')
const SwitchScalabilityLayer$json = const {
  '1': 'SwitchScalabilityLayer',
  '2': const [
    const {'1': 'trackId', '3': 1, '4': 1, '5': 9, '10': 'trackId'},
    const {'1': 'spatialLayer', '3': 2, '4': 1, '5': 13, '10': 'spatialLayer'},
    const {
      '1': 'temporalLayer',
      '3': 3,
      '4': 1,
      '5': 13,
      '10': 'temporalLayer'
    },
  ],
};

/// Descriptor for `SwitchScalabilityLayer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List switchScalabilityLayerDescriptor =
    $convert.base64Decode(
        'ChZTd2l0Y2hTY2FsYWJpbGl0eUxheWVyEhgKB3RyYWNrSWQYASABKAlSB3RyYWNrSWQSIgoMc3BhdGlhbExheWVyGAIgASgNUgxzcGF0aWFsTGF5ZXISJAoNdGVtcG9yYWxMYXllchgDIAEoDVINdGVtcG9yYWxMYXllcg==');
@$core.Deprecated('Use updateSettingsDescriptor instead')
const UpdateSettings$json = const {
  '1': 'UpdateSettings',
  '2': const [
    const {
      '1': 'subscription',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.rtc.Subscription',
      '9': 0,
      '10': 'subscription'
    },
    const {
      '1': 'switchLayer',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.rtc.SwitchScalabilityLayer',
      '9': 0,
      '10': 'switchLayer'
    },
    const {
      '1': 'muteTrack',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.rtc.MuteTrack',
      '9': 0,
      '10': 'muteTrack'
    },
  ],
  '8': const [
    const {'1': 'command'},
  ],
};

/// Descriptor for `UpdateSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSettingsDescriptor = $convert.base64Decode(
    'Cg5VcGRhdGVTZXR0aW5ncxI3CgxzdWJzY3JpcHRpb24YASABKAsyES5ydGMuU3Vic2NyaXB0aW9uSABSDHN1YnNjcmlwdGlvbhI/Cgtzd2l0Y2hMYXllchgCIAEoCzIbLnJ0Yy5Td2l0Y2hTY2FsYWJpbGl0eUxheWVySABSC3N3aXRjaExheWVyEi4KCW11dGVUcmFjaxgDIAEoCzIOLnJ0Yy5NdXRlVHJhY2tIAFIJbXV0ZVRyYWNrQgkKB2NvbW1hbmQ=');
@$core.Deprecated('Use signallingDescriptor instead')
const Signalling$json = const {
  '1': 'Signalling',
  '2': const [
    const {
      '1': 'join',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.rtc.JoinRequest',
      '9': 0,
      '10': 'join'
    },
    const {
      '1': 'reply',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.rtc.JoinReply',
      '9': 0,
      '10': 'reply'
    },
    const {
      '1': 'error',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.rtc.Error',
      '9': 0,
      '10': 'error'
    },
    const {
      '1': 'description',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.rtc.SessionDescription',
      '9': 0,
      '10': 'description'
    },
    const {
      '1': 'trickle',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.rtc.Trickle',
      '9': 0,
      '10': 'trickle'
    },
    const {
      '1': 'updateSettings',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.rtc.UpdateSettings',
      '9': 0,
      '10': 'updateSettings'
    },
    const {
      '1': 'trackEvent',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.rtc.TrackEvent',
      '9': 0,
      '10': 'trackEvent'
    },
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};

/// Descriptor for `Signalling`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signallingDescriptor = $convert.base64Decode(
    'CgpTaWduYWxsaW5nEiYKBGpvaW4YASABKAsyEC5ydGMuSm9pblJlcXVlc3RIAFIEam9pbhImCgVyZXBseRgCIAEoCzIOLnJ0Yy5Kb2luUmVwbHlIAFIFcmVwbHkSIgoFZXJyb3IYAyABKAsyCi5ydGMuRXJyb3JIAFIFZXJyb3ISOwoLZGVzY3JpcHRpb24YBCABKAsyFy5ydGMuU2Vzc2lvbkRlc2NyaXB0aW9uSABSC2Rlc2NyaXB0aW9uEigKB3RyaWNrbGUYBSABKAsyDC5ydGMuVHJpY2tsZUgAUgd0cmlja2xlEj0KDnVwZGF0ZVNldHRpbmdzGAYgASgLMhMucnRjLlVwZGF0ZVNldHRpbmdzSABSDnVwZGF0ZVNldHRpbmdzEjEKCnRyYWNrRXZlbnQYByABKAsyDy5ydGMuVHJhY2tFdmVudEgAUgp0cmFja0V2ZW50QgkKB3BheWxvYWQ=');
