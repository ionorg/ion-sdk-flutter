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
@$core.Deprecated('Use mediaTypeDescriptor instead')
const MediaType$json = const {
  '1': 'MediaType',
  '2': const [
    const {'1': 'MediaUnknown', '2': 0},
    const {'1': 'UserMedia', '2': 1},
    const {'1': 'ScreenCapture', '2': 2},
    const {'1': 'Cavans', '2': 3},
    const {'1': 'Streaming', '2': 4},
    const {'1': 'VoIP', '2': 5},
  ],
};

/// Descriptor for `MediaType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List mediaTypeDescriptor = $convert.base64Decode(
    'CglNZWRpYVR5cGUSEAoMTWVkaWFVbmtub3duEAASDQoJVXNlck1lZGlhEAESEQoNU2NyZWVuQ2FwdHVyZRACEgoKBkNhdmFucxADEg0KCVN0cmVhbWluZxAEEggKBFZvSVAQBQ==');
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
@$core.Deprecated('Use trackInfoDescriptor instead')
const TrackInfo$json = const {
  '1': 'TrackInfo',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'kind', '3': 2, '4': 1, '5': 9, '10': 'kind'},
    const {'1': 'muted', '3': 3, '4': 1, '5': 8, '10': 'muted'},
    const {
      '1': 'type',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.rtc.MediaType',
      '10': 'type'
    },
    const {'1': 'streamId', '3': 5, '4': 1, '5': 9, '10': 'streamId'},
    const {'1': 'label', '3': 6, '4': 1, '5': 9, '10': 'label'},
    const {'1': 'layer', '3': 7, '4': 1, '5': 9, '10': 'layer'},
    const {'1': 'width', '3': 8, '4': 1, '5': 13, '10': 'width'},
    const {'1': 'height', '3': 9, '4': 1, '5': 13, '10': 'height'},
    const {'1': 'frameRate', '3': 10, '4': 1, '5': 13, '10': 'frameRate'},
  ],
};

/// Descriptor for `TrackInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackInfoDescriptor = $convert.base64Decode(
    'CglUcmFja0luZm8SDgoCaWQYASABKAlSAmlkEhIKBGtpbmQYAiABKAlSBGtpbmQSFAoFbXV0ZWQYAyABKAhSBW11dGVkEiIKBHR5cGUYBCABKA4yDi5ydGMuTWVkaWFUeXBlUgR0eXBlEhoKCHN0cmVhbUlkGAUgASgJUghzdHJlYW1JZBIUCgVsYWJlbBgGIAEoCVIFbGFiZWwSFAoFbGF5ZXIYByABKAlSBWxheWVyEhQKBXdpZHRoGAggASgNUgV3aWR0aBIWCgZoZWlnaHQYCSABKA1SBmhlaWdodBIcCglmcmFtZVJhdGUYCiABKA1SCWZyYW1lUmF0ZQ==');
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
    const {
      '1': 'trackInfos',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.rtc.TrackInfo',
      '10': 'trackInfos'
    },
  ],
};

/// Descriptor for `SessionDescription`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionDescriptionDescriptor = $convert.base64Decode(
    'ChJTZXNzaW9uRGVzY3JpcHRpb24SIwoGdGFyZ2V0GAEgASgOMgsucnRjLlRhcmdldFIGdGFyZ2V0EhIKBHR5cGUYAiABKAlSBHR5cGUSEAoDc2RwGAMgASgJUgNzZHASLgoKdHJhY2tJbmZvcxgEIAMoCzIOLnJ0Yy5UcmFja0luZm9SCnRyYWNrSW5mb3M=');
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
@$core.Deprecated('Use trackEventDescriptor instead')
const TrackEvent$json = const {
  '1': 'TrackEvent',
  '2': const [
    const {
      '1': 'state',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.rtc.TrackEvent.State',
      '10': 'state'
    },
    const {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
    const {
      '1': 'tracks',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.rtc.TrackInfo',
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
    const {'1': 'UPDATE', '2': 1},
    const {'1': 'REMOVE', '2': 2},
  ],
};

/// Descriptor for `TrackEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trackEventDescriptor = $convert.base64Decode(
    'CgpUcmFja0V2ZW50EisKBXN0YXRlGAEgASgOMhUucnRjLlRyYWNrRXZlbnQuU3RhdGVSBXN0YXRlEhAKA3VpZBgCIAEoCVIDdWlkEiYKBnRyYWNrcxgDIAMoCzIOLnJ0Yy5UcmFja0luZm9SBnRyYWNrcyIoCgVTdGF0ZRIHCgNBREQQABIKCgZVUERBVEUQARIKCgZSRU1PVkUQAg==');
@$core.Deprecated('Use subscriptionDescriptor instead')
const Subscription$json = const {
  '1': 'Subscription',
  '2': const [
    const {'1': 'trackId', '3': 2, '4': 1, '5': 9, '10': 'trackId'},
    const {'1': 'mute', '3': 3, '4': 1, '5': 8, '10': 'mute'},
    const {'1': 'subscribe', '3': 4, '4': 1, '5': 8, '10': 'subscribe'},
    const {'1': 'layer', '3': 5, '4': 1, '5': 9, '10': 'layer'},
  ],
};

/// Descriptor for `Subscription`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscriptionDescriptor = $convert.base64Decode(
    'CgxTdWJzY3JpcHRpb24SGAoHdHJhY2tJZBgCIAEoCVIHdHJhY2tJZBISCgRtdXRlGAMgASgIUgRtdXRlEhwKCXN1YnNjcmliZRgEIAEoCFIJc3Vic2NyaWJlEhQKBWxheWVyGAUgASgJUgVsYXllcg==');
@$core.Deprecated('Use subscriptionRequestDescriptor instead')
const SubscriptionRequest$json = const {
  '1': 'SubscriptionRequest',
  '2': const [
    const {
      '1': 'subscriptions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.rtc.Subscription',
      '10': 'subscriptions'
    },
  ],
};

/// Descriptor for `SubscriptionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscriptionRequestDescriptor = $convert.base64Decode(
    'ChNTdWJzY3JpcHRpb25SZXF1ZXN0EjcKDXN1YnNjcmlwdGlvbnMYASADKAsyES5ydGMuU3Vic2NyaXB0aW9uUg1zdWJzY3JpcHRpb25z');
@$core.Deprecated('Use subscriptionReplyDescriptor instead')
const SubscriptionReply$json = const {
  '1': 'SubscriptionReply',
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
  ],
};

/// Descriptor for `SubscriptionReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscriptionReplyDescriptor = $convert.base64Decode(
    'ChFTdWJzY3JpcHRpb25SZXBseRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEiAKBWVycm9yGAIgASgLMgoucnRjLkVycm9yUgVlcnJvcg==');
@$core.Deprecated('Use updateTrackReplyDescriptor instead')
const UpdateTrackReply$json = const {
  '1': 'UpdateTrackReply',
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
  ],
};

/// Descriptor for `UpdateTrackReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTrackReplyDescriptor = $convert.base64Decode(
    'ChBVcGRhdGVUcmFja1JlcGx5EhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSIAoFZXJyb3IYAiABKAsyCi5ydGMuRXJyb3JSBWVycm9y');
@$core.Deprecated('Use activeSpeakerDescriptor instead')
const ActiveSpeaker$json = const {
  '1': 'ActiveSpeaker',
  '2': const [
    const {
      '1': 'speakers',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.rtc.AudioLevelSpeaker',
      '10': 'speakers'
    },
  ],
};

/// Descriptor for `ActiveSpeaker`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activeSpeakerDescriptor = $convert.base64Decode(
    'Cg1BY3RpdmVTcGVha2VyEjIKCHNwZWFrZXJzGAEgAygLMhYucnRjLkF1ZGlvTGV2ZWxTcGVha2VyUghzcGVha2Vycw==');
@$core.Deprecated('Use audioLevelSpeakerDescriptor instead')
const AudioLevelSpeaker$json = const {
  '1': 'AudioLevelSpeaker',
  '2': const [
    const {'1': 'sid', '3': 1, '4': 1, '5': 9, '10': 'sid'},
    const {'1': 'level', '3': 2, '4': 1, '5': 2, '10': 'level'},
    const {'1': 'active', '3': 3, '4': 1, '5': 8, '10': 'active'},
  ],
};

/// Descriptor for `AudioLevelSpeaker`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List audioLevelSpeakerDescriptor = $convert.base64Decode(
    'ChFBdWRpb0xldmVsU3BlYWtlchIQCgNzaWQYASABKAlSA3NpZBIUCgVsZXZlbBgCIAEoAlIFbGV2ZWwSFgoGYWN0aXZlGAMgASgIUgZhY3RpdmU=');
@$core.Deprecated('Use requestDescriptor instead')
const Request$json = const {
  '1': 'Request',
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
      '1': 'description',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.rtc.SessionDescription',
      '9': 0,
      '10': 'description'
    },
    const {
      '1': 'trickle',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.rtc.Trickle',
      '9': 0,
      '10': 'trickle'
    },
    const {
      '1': 'subscription',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.rtc.SubscriptionRequest',
      '9': 0,
      '10': 'subscription'
    },
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};

/// Descriptor for `Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDescriptor = $convert.base64Decode(
    'CgdSZXF1ZXN0EiYKBGpvaW4YASABKAsyEC5ydGMuSm9pblJlcXVlc3RIAFIEam9pbhI7CgtkZXNjcmlwdGlvbhgCIAEoCzIXLnJ0Yy5TZXNzaW9uRGVzY3JpcHRpb25IAFILZGVzY3JpcHRpb24SKAoHdHJpY2tsZRgDIAEoCzIMLnJ0Yy5Ucmlja2xlSABSB3RyaWNrbGUSPgoMc3Vic2NyaXB0aW9uGAQgASgLMhgucnRjLlN1YnNjcmlwdGlvblJlcXVlc3RIAFIMc3Vic2NyaXB0aW9uQgkKB3BheWxvYWQ=');
@$core.Deprecated('Use replyDescriptor instead')
const Reply$json = const {
  '1': 'Reply',
  '2': const [
    const {
      '1': 'join',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.rtc.JoinReply',
      '9': 0,
      '10': 'join'
    },
    const {
      '1': 'description',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.rtc.SessionDescription',
      '9': 0,
      '10': 'description'
    },
    const {
      '1': 'trickle',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.rtc.Trickle',
      '9': 0,
      '10': 'trickle'
    },
    const {
      '1': 'trackEvent',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.rtc.TrackEvent',
      '9': 0,
      '10': 'trackEvent'
    },
    const {
      '1': 'subscription',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.rtc.SubscriptionReply',
      '9': 0,
      '10': 'subscription'
    },
    const {
      '1': 'error',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.rtc.Error',
      '9': 0,
      '10': 'error'
    },
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};

/// Descriptor for `Reply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyDescriptor = $convert.base64Decode(
    'CgVSZXBseRIkCgRqb2luGAEgASgLMg4ucnRjLkpvaW5SZXBseUgAUgRqb2luEjsKC2Rlc2NyaXB0aW9uGAIgASgLMhcucnRjLlNlc3Npb25EZXNjcmlwdGlvbkgAUgtkZXNjcmlwdGlvbhIoCgd0cmlja2xlGAMgASgLMgwucnRjLlRyaWNrbGVIAFIHdHJpY2tsZRIxCgp0cmFja0V2ZW50GAQgASgLMg8ucnRjLlRyYWNrRXZlbnRIAFIKdHJhY2tFdmVudBI8CgxzdWJzY3JpcHRpb24YBSABKAsyFi5ydGMuU3Vic2NyaXB0aW9uUmVwbHlIAFIMc3Vic2NyaXB0aW9uEiIKBWVycm9yGAcgASgLMgoucnRjLkVycm9ySABSBWVycm9yQgkKB3BheWxvYWQ=');
