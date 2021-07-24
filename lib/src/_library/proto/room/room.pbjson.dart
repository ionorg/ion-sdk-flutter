///
//  Generated code. Do not modify.
//  source: proto/room/room.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use roleDescriptor instead')
const Role$json = const {
  '1': 'Role',
  '2': const [
    const {'1': 'RoleHost', '2': 0},
    const {'1': 'RoleGuest', '2': 1},
  ],
};

/// Descriptor for `Role`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List roleDescriptor =
    $convert.base64Decode('CgRSb2xlEgwKCFJvbGVIb3N0EAASDQoJUm9sZUd1ZXN0EAE=');
@$core.Deprecated('Use protocolDescriptor instead')
const Protocol$json = const {
  '1': 'Protocol',
  '2': const [
    const {'1': 'ProtocolUnknown', '2': 0},
    const {'1': 'ProtocolWebRTC', '2': 1},
    const {'1': 'ProtocolSIP', '2': 2},
    const {'1': 'ProtocolRTMP', '2': 3},
  ],
};

/// Descriptor for `Protocol`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List protocolDescriptor = $convert.base64Decode(
    'CghQcm90b2NvbBITCg9Qcm90b2NvbFVua25vd24QABISCg5Qcm90b2NvbFdlYlJUQxABEg8KC1Byb3RvY29sU0lQEAISEAoMUHJvdG9jb2xSVE1QEAM=');
@$core.Deprecated('Use participantStatusDescriptor instead')
const ParticipantStatus$json = const {
  '1': 'ParticipantStatus',
  '2': const [
    const {'1': 'Create', '2': 0},
    const {'1': 'Update', '2': 1},
    const {'1': 'Delete', '2': 2},
  ],
};

/// Descriptor for `ParticipantStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List participantStatusDescriptor = $convert.base64Decode(
    'ChFQYXJ0aWNpcGFudFN0YXR1cxIKCgZDcmVhdGUQABIKCgZVcGRhdGUQARIKCgZEZWxldGUQAg==');
@$core.Deprecated('Use streamTypeDescriptor instead')
const StreamType$json = const {
  '1': 'StreamType',
  '2': const [
    const {'1': 'UserMedia', '2': 0},
    const {'1': 'Presentation', '2': 1},
    const {'1': 'Streaming', '2': 2},
  ],
};

/// Descriptor for `StreamType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List streamTypeDescriptor = $convert.base64Decode(
    'CgpTdHJlYW1UeXBlEg0KCVVzZXJNZWRpYRAAEhAKDFByZXNlbnRhdGlvbhABEg0KCVN0cmVhbWluZxAC');
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor =
    $convert.base64Decode('CgVFbXB0eQ==');
@$core.Deprecated('Use joinRequestDescriptor instead')
const JoinRequest$json = const {
  '1': 'JoinRequest',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'displayName', '3': 2, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'extraInfo', '3': 3, '4': 1, '5': 12, '10': 'extraInfo'},
    const {
      '1': 'role',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.room.Role',
      '10': 'role'
    },
    const {'1': 'avatar', '3': 5, '4': 1, '5': 9, '10': 'avatar'},
    const {'1': 'vendor', '3': 6, '4': 1, '5': 9, '10': 'vendor'},
    const {'1': 'token', '3': 7, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `JoinRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinRequestDescriptor = $convert.base64Decode(
    'CgtKb2luUmVxdWVzdBIQCgN1aWQYASABKAlSA3VpZBIgCgtkaXNwbGF5TmFtZRgCIAEoCVILZGlzcGxheU5hbWUSHAoJZXh0cmFJbmZvGAMgASgMUglleHRyYUluZm8SHgoEcm9sZRgEIAEoDjIKLnJvb20uUm9sZVIEcm9sZRIWCgZhdmF0YXIYBSABKAlSBmF2YXRhchIWCgZ2ZW5kb3IYBiABKAlSBnZlbmRvchIUCgV0b2tlbhgHIAEoCVIFdG9rZW4=');
@$core.Deprecated('Use joinReplyDescriptor instead')
const JoinReply$json = const {
  '1': 'JoinReply',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {
      '1': 'config',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.room.Configuration',
      '10': 'config'
    },
    const {
      '1': 'error',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.room.Error',
      '10': 'error'
    },
  ],
};

/// Descriptor for `JoinReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinReplyDescriptor = $convert.base64Decode(
    'CglKb2luUmVwbHkSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIrCgZjb25maWcYAiABKAsyEy5yb29tLkNvbmZpZ3VyYXRpb25SBmNvbmZpZxIhCgVlcnJvchgDIAEoCzILLnJvb20uRXJyb3JSBWVycm9y');
@$core.Deprecated('Use leaveRequestDescriptor instead')
const LeaveRequest$json = const {
  '1': 'LeaveRequest',
};

/// Descriptor for `LeaveRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaveRequestDescriptor =
    $convert.base64Decode('CgxMZWF2ZVJlcXVlc3Q=');
@$core.Deprecated('Use leaveReplyDescriptor instead')
const LeaveReply$json = const {
  '1': 'LeaveReply',
};

/// Descriptor for `LeaveReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaveReplyDescriptor =
    $convert.base64Decode('CgpMZWF2ZVJlcGx5');
@$core.Deprecated('Use participantDescriptor instead')
const Participant$json = const {
  '1': 'Participant',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'displayName', '3': 2, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'extraInfo', '3': 3, '4': 1, '5': 12, '10': 'extraInfo'},
    const {
      '1': 'role',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.room.Role',
      '10': 'role'
    },
    const {
      '1': 'protocol',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.room.Protocol',
      '10': 'protocol'
    },
    const {'1': 'avatar', '3': 6, '4': 1, '5': 9, '10': 'avatar'},
    const {'1': 'callDirection', '3': 7, '4': 1, '5': 9, '10': 'callDirection'},
    const {'1': 'vendor', '3': 8, '4': 1, '5': 9, '10': 'vendor'},
  ],
};

/// Descriptor for `Participant`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List participantDescriptor = $convert.base64Decode(
    'CgtQYXJ0aWNpcGFudBIQCgN1aWQYASABKAlSA3VpZBIgCgtkaXNwbGF5TmFtZRgCIAEoCVILZGlzcGxheU5hbWUSHAoJZXh0cmFJbmZvGAMgASgMUglleHRyYUluZm8SHgoEcm9sZRgEIAEoDjIKLnJvb20uUm9sZVIEcm9sZRIqCghwcm90b2NvbBgFIAEoDjIOLnJvb20uUHJvdG9jb2xSCHByb3RvY29sEhYKBmF2YXRhchgGIAEoCVIGYXZhdGFyEiQKDWNhbGxEaXJlY3Rpb24YByABKAlSDWNhbGxEaXJlY3Rpb24SFgoGdmVuZG9yGAggASgJUgZ2ZW5kb3I=');
@$core.Deprecated('Use participantEventDescriptor instead')
const ParticipantEvent$json = const {
  '1': 'ParticipantEvent',
  '2': const [
    const {
      '1': 'participant',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.room.Participant',
      '10': 'participant'
    },
    const {
      '1': 'status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.room.ParticipantStatus',
      '10': 'status'
    },
  ],
};

/// Descriptor for `ParticipantEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List participantEventDescriptor = $convert.base64Decode(
    'ChBQYXJ0aWNpcGFudEV2ZW50EjMKC3BhcnRpY2lwYW50GAEgASgLMhEucm9vbS5QYXJ0aWNpcGFudFILcGFydGljaXBhbnQSLwoGc3RhdHVzGAIgASgOMhcucm9vbS5QYXJ0aWNpcGFudFN0YXR1c1IGc3RhdHVz');
@$core.Deprecated('Use participantsReplyDescriptor instead')
const ParticipantsReply$json = const {
  '1': 'ParticipantsReply',
  '2': const [
    const {
      '1': 'participants',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.room.Participant',
      '10': 'participants'
    },
    const {
      '1': 'permission',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.room.Permission',
      '10': 'permission'
    },
  ],
};

/// Descriptor for `ParticipantsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List participantsReplyDescriptor = $convert.base64Decode(
    'ChFQYXJ0aWNpcGFudHNSZXBseRI1CgxwYXJ0aWNpcGFudHMYASABKAsyES5yb29tLlBhcnRpY2lwYW50UgxwYXJ0aWNpcGFudHMSMAoKcGVybWlzc2lvbhgCIAEoCzIQLnJvb20uUGVybWlzc2lvblIKcGVybWlzc2lvbg==');
@$core.Deprecated('Use getParticipantsReplyDescriptor instead')
const GetParticipantsReply$json = const {
  '1': 'GetParticipantsReply',
  '2': const [
    const {
      '1': 'participants',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.room.ParticipantsReply',
      '10': 'participants'
    },
  ],
};

/// Descriptor for `GetParticipantsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getParticipantsReplyDescriptor = $convert.base64Decode(
    'ChRHZXRQYXJ0aWNpcGFudHNSZXBseRI7CgxwYXJ0aWNpcGFudHMYASADKAsyFy5yb29tLlBhcnRpY2lwYW50c1JlcGx5UgxwYXJ0aWNpcGFudHM=');
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
@$core.Deprecated('Use configurationDescriptor instead')
const Configuration$json = const {
  '1': 'Configuration',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {
      '1': 'isAudioOnlyMode',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'isAudioOnlyMode'
    },
    const {
      '1': 'role',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.room.Role',
      '10': 'role'
    },
    const {
      '1': 'yourPermission',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.room.Permission',
      '10': 'yourPermission'
    },
  ],
};

/// Descriptor for `Configuration`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configurationDescriptor = $convert.base64Decode(
    'Cg1Db25maWd1cmF0aW9uEhIKBHV1aWQYASABKAlSBHV1aWQSKAoPaXNBdWRpb09ubHlNb2RlGAIgASgIUg9pc0F1ZGlvT25seU1vZGUSHgoEcm9sZRgDIAEoDjIKLnJvb20uUm9sZVIEcm9sZRI4Cg55b3VyUGVybWlzc2lvbhgEIAEoCzIQLnJvb20uUGVybWlzc2lvblIOeW91clBlcm1pc3Npb24=');
@$core.Deprecated('Use permissionDescriptor instead')
const Permission$json = const {
  '1': 'Permission',
  '2': const [
    const {
      '1': 'addParticipants',
      '3': 1,
      '4': 1,
      '5': 8,
      '10': 'addParticipants'
    },
    const {
      '1': 'removeParticipants',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'removeParticipants'
    },
    const {
      '1': 'blockOthersAudio',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'blockOthersAudio'
    },
    const {
      '1': 'blockOthersVideo',
      '3': 4,
      '4': 1,
      '5': 8,
      '10': 'blockOthersVideo'
    },
    const {'1': 'endConference', '3': 7, '4': 1, '5': 8, '10': 'endConference'},
    const {
      '1': 'lockConference',
      '3': 8,
      '4': 1,
      '5': 8,
      '10': 'lockConference'
    },
    const {'1': 'publish', '3': 9, '4': 1, '5': 8, '10': 'publish'},
    const {'1': 'subscribe', '3': 10, '4': 1, '5': 8, '10': 'subscribe'},
    const {
      '1': 'setImportance',
      '3': 11,
      '4': 1,
      '5': 8,
      '10': 'setImportance'
    },
  ],
};

/// Descriptor for `Permission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List permissionDescriptor = $convert.base64Decode(
    'CgpQZXJtaXNzaW9uEigKD2FkZFBhcnRpY2lwYW50cxgBIAEoCFIPYWRkUGFydGljaXBhbnRzEi4KEnJlbW92ZVBhcnRpY2lwYW50cxgCIAEoCFIScmVtb3ZlUGFydGljaXBhbnRzEioKEGJsb2NrT3RoZXJzQXVkaW8YAyABKAhSEGJsb2NrT3RoZXJzQXVkaW8SKgoQYmxvY2tPdGhlcnNWaWRlbxgEIAEoCFIQYmxvY2tPdGhlcnNWaWRlbxIkCg1lbmRDb25mZXJlbmNlGAcgASgIUg1lbmRDb25mZXJlbmNlEiYKDmxvY2tDb25mZXJlbmNlGAggASgIUg5sb2NrQ29uZmVyZW5jZRIYCgdwdWJsaXNoGAkgASgIUgdwdWJsaXNoEhwKCXN1YnNjcmliZRgKIAEoCFIJc3Vic2NyaWJlEiQKDXNldEltcG9ydGFuY2UYCyABKAhSDXNldEltcG9ydGFuY2U=');
@$core.Deprecated('Use messageDescriptor instead')
const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'origin', '3': 1, '4': 1, '5': 9, '10': 'origin'},
    const {'1': 'uid', '3': 3, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'type', '3': 4, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'payload', '3': 5, '4': 1, '5': 12, '10': 'payload'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEhYKBm9yaWdpbhgBIAEoCVIGb3JpZ2luEhAKA3VpZBgDIAEoCVIDdWlkEhIKBHR5cGUYBCABKAlSBHR5cGUSGAoHcGF5bG9hZBgFIAEoDFIHcGF5bG9hZA==');
@$core.Deprecated('Use sendMessageRequestDescriptor instead')
const SendMessageRequest$json = const {
  '1': 'SendMessageRequest',
  '2': const [
    const {
      '1': 'message',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.room.Message',
      '10': 'message'
    },
  ],
};

/// Descriptor for `SendMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMessageRequestDescriptor = $convert.base64Decode(
    'ChJTZW5kTWVzc2FnZVJlcXVlc3QSJwoHbWVzc2FnZRgBIAEoCzINLnJvb20uTWVzc2FnZVIHbWVzc2FnZQ==');
@$core.Deprecated('Use sendMessageReplyDescriptor instead')
const SendMessageReply$json = const {
  '1': 'SendMessageReply',
};

/// Descriptor for `SendMessageReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMessageReplyDescriptor =
    $convert.base64Decode('ChBTZW5kTWVzc2FnZVJlcGx5');
@$core.Deprecated('Use disconnectDescriptor instead')
const Disconnect$json = const {
  '1': 'Disconnect',
  '2': const [
    const {'1': 'reason', '3': 1, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `Disconnect`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disconnectDescriptor =
    $convert.base64Decode('CgpEaXNjb25uZWN0EhYKBnJlYXNvbhgBIAEoCVIGcmVhc29u');
@$core.Deprecated('Use notificationDescriptor instead')
const Notification$json = const {
  '1': 'Notification',
  '2': const [
    const {
      '1': 'participant',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.room.ParticipantEvent',
      '9': 0,
      '10': 'participant'
    },
    const {
      '1': 'message',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.room.Message',
      '9': 0,
      '10': 'message'
    },
    const {
      '1': 'disconnect',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.room.Disconnect',
      '9': 0,
      '10': 'disconnect'
    },
    const {
      '1': 'error',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.room.Error',
      '9': 0,
      '10': 'error'
    },
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};

/// Descriptor for `Notification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationDescriptor = $convert.base64Decode(
    'CgxOb3RpZmljYXRpb24SOgoLcGFydGljaXBhbnQYASABKAsyFi5yb29tLlBhcnRpY2lwYW50RXZlbnRIAFILcGFydGljaXBhbnQSKQoHbWVzc2FnZRgCIAEoCzINLnJvb20uTWVzc2FnZUgAUgdtZXNzYWdlEjIKCmRpc2Nvbm5lY3QYAyABKAsyEC5yb29tLkRpc2Nvbm5lY3RIAFIKZGlzY29ubmVjdBIjCgVlcnJvchgEIAEoCzILLnJvb20uRXJyb3JIAFIFZXJyb3JCCQoHcGF5bG9hZA==');
@$core.Deprecated('Use addParticipantRequestDescriptor instead')
const AddParticipantRequest$json = const {
  '1': 'AddParticipantRequest',
  '2': const [
    const {
      '1': 'role',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.room.Role',
      '10': 'role'
    },
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {
      '1': 'protocol',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.room.Protocol',
      '10': 'protocol'
    },
    const {
      '1': 'source_display_name',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'sourceDisplayName'
    },
  ],
};

/// Descriptor for `AddParticipantRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addParticipantRequestDescriptor = $convert.base64Decode(
    'ChVBZGRQYXJ0aWNpcGFudFJlcXVlc3QSHgoEcm9sZRgBIAEoDjIKLnJvb20uUm9sZVIEcm9sZRIgCgtkZXNjcmlwdGlvbhgCIAEoCVILZGVzY3JpcHRpb24SKgoIcHJvdG9jb2wYAyABKA4yDi5yb29tLlByb3RvY29sUghwcm90b2NvbBIuChNzb3VyY2VfZGlzcGxheV9uYW1lGAQgASgJUhFzb3VyY2VEaXNwbGF5TmFtZQ==');
@$core.Deprecated('Use addParticipantReplyDescriptor instead')
const AddParticipantReply$json = const {
  '1': 'AddParticipantReply',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {
      '1': 'error',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.room.Error',
      '10': 'error'
    },
    const {
      '1': 'description',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.room.Participant',
      '10': 'description'
    },
  ],
};

/// Descriptor for `AddParticipantReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addParticipantReplyDescriptor = $convert.base64Decode(
    'ChNBZGRQYXJ0aWNpcGFudFJlcGx5EhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSIQoFZXJyb3IYAiABKAsyCy5yb29tLkVycm9yUgVlcnJvchIzCgtkZXNjcmlwdGlvbhgDIAEoCzIRLnJvb20uUGFydGljaXBhbnRSC2Rlc2NyaXB0aW9u');
@$core.Deprecated('Use setImportanceRequestDescriptor instead')
const SetImportanceRequest$json = const {
  '1': 'SetImportanceRequest',
  '2': const [
    const {
      '1': 'participants',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.room.Participant',
      '10': 'participants'
    },
  ],
};

/// Descriptor for `SetImportanceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setImportanceRequestDescriptor = $convert.base64Decode(
    'ChRTZXRJbXBvcnRhbmNlUmVxdWVzdBI1CgxwYXJ0aWNpcGFudHMYASADKAsyES5yb29tLlBhcnRpY2lwYW50UgxwYXJ0aWNpcGFudHM=');
@$core.Deprecated('Use setImportanceReplyDescriptor instead')
const SetImportanceReply$json = const {
  '1': 'SetImportanceReply',
};

/// Descriptor for `SetImportanceReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setImportanceReplyDescriptor =
    $convert.base64Decode('ChJTZXRJbXBvcnRhbmNlUmVwbHk=');
@$core.Deprecated('Use lockConferenceRequestDescriptor instead')
const LockConferenceRequest$json = const {
  '1': 'LockConferenceRequest',
  '2': const [
    const {'1': 'lock', '3': 1, '4': 1, '5': 8, '10': 'lock'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LockConferenceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lockConferenceRequestDescriptor = $convert.base64Decode(
    'ChVMb2NrQ29uZmVyZW5jZVJlcXVlc3QSEgoEbG9jaxgBIAEoCFIEbG9jaxIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQ=');
@$core.Deprecated('Use lockConferenceReplyDescriptor instead')
const LockConferenceReply$json = const {
  '1': 'LockConferenceReply',
};

/// Descriptor for `LockConferenceReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lockConferenceReplyDescriptor =
    $convert.base64Decode('ChNMb2NrQ29uZmVyZW5jZVJlcGx5');
@$core.Deprecated('Use endConferenceRequestDescriptor instead')
const EndConferenceRequest$json = const {
  '1': 'EndConferenceRequest',
};

/// Descriptor for `EndConferenceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List endConferenceRequestDescriptor =
    $convert.base64Decode('ChRFbmRDb25mZXJlbmNlUmVxdWVzdA==');
@$core.Deprecated('Use endConferenceReplyDescriptor instead')
const EndConferenceReply$json = const {
  '1': 'EndConferenceReply',
};

/// Descriptor for `EndConferenceReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List endConferenceReplyDescriptor =
    $convert.base64Decode('ChJFbmRDb25mZXJlbmNlUmVwbHk=');
@$core.Deprecated('Use editParticipantInfoRequestDescriptor instead')
const EditParticipantInfoRequest$json = const {
  '1': 'EditParticipantInfoRequest',
};

/// Descriptor for `EditParticipantInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editParticipantInfoRequestDescriptor =
    $convert.base64Decode('ChpFZGl0UGFydGljaXBhbnRJbmZvUmVxdWVzdA==');
@$core.Deprecated('Use editParticipantInfoReplyDescriptor instead')
const EditParticipantInfoReply$json = const {
  '1': 'EditParticipantInfoReply',
};

/// Descriptor for `EditParticipantInfoReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editParticipantInfoReplyDescriptor =
    $convert.base64Decode('ChhFZGl0UGFydGljaXBhbnRJbmZvUmVwbHk=');
@$core.Deprecated('Use removeParticipantRequestDescriptor instead')
const RemoveParticipantRequest$json = const {
  '1': 'RemoveParticipantRequest',
};

/// Descriptor for `RemoveParticipantRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeParticipantRequestDescriptor =
    $convert.base64Decode('ChhSZW1vdmVQYXJ0aWNpcGFudFJlcXVlc3Q=');
@$core.Deprecated('Use removeParticipantReplyDescriptor instead')
const RemoveParticipantReply$json = const {
  '1': 'RemoveParticipantReply',
};

/// Descriptor for `RemoveParticipantReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeParticipantReplyDescriptor =
    $convert.base64Decode('ChZSZW1vdmVQYXJ0aWNpcGFudFJlcGx5');
