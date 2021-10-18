///
//  Generated code. Do not modify.
//  source: apps/room/proto/room.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use errorTypeDescriptor instead')
const ErrorType$json = const {
  '1': 'ErrorType',
  '2': const [
    const {'1': 'None', '2': 0},
    const {'1': 'UnkownError', '2': 1},
    const {'1': 'PermissionDenied', '2': 2},
    const {'1': 'ServiceUnavailable', '2': 3},
    const {'1': 'RoomLocked', '2': 4},
    const {'1': 'PasswordRequired', '2': 5},
    const {'1': 'RoomAlreadyExist', '2': 6},
    const {'1': 'RoomNotExist', '2': 7},
    const {'1': 'InvalidParams', '2': 8},
    const {'1': 'PeerAlreadyExist', '2': 9},
    const {'1': 'PeerNotExist', '2': 10},
  ],
};

/// Descriptor for `ErrorType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List errorTypeDescriptor = $convert.base64Decode(
    'CglFcnJvclR5cGUSCAoETm9uZRAAEg8KC1Vua293bkVycm9yEAESFAoQUGVybWlzc2lvbkRlbmllZBACEhYKElNlcnZpY2VVbmF2YWlsYWJsZRADEg4KClJvb21Mb2NrZWQQBBIUChBQYXNzd29yZFJlcXVpcmVkEAUSFAoQUm9vbUFscmVhZHlFeGlzdBAGEhAKDFJvb21Ob3RFeGlzdBAHEhEKDUludmFsaWRQYXJhbXMQCBIUChBQZWVyQWxyZWFkeUV4aXN0EAkSEAoMUGVlck5vdEV4aXN0EAo=');
@$core.Deprecated('Use roleDescriptor instead')
const Role$json = const {
  '1': 'Role',
  '2': const [
    const {'1': 'Host', '2': 0},
    const {'1': 'Guest', '2': 1},
  ],
};

/// Descriptor for `Role`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List roleDescriptor =
    $convert.base64Decode('CgRSb2xlEggKBEhvc3QQABIJCgVHdWVzdBAB');
@$core.Deprecated('Use protocolDescriptor instead')
const Protocol$json = const {
  '1': 'Protocol',
  '2': const [
    const {'1': 'ProtocolUnknown', '2': 0},
    const {'1': 'WebRTC', '2': 1},
    const {'1': 'SIP', '2': 2},
    const {'1': 'RTMP', '2': 3},
    const {'1': 'RTSP', '2': 4},
  ],
};

/// Descriptor for `Protocol`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List protocolDescriptor = $convert.base64Decode(
    'CghQcm90b2NvbBITCg9Qcm90b2NvbFVua25vd24QABIKCgZXZWJSVEMQARIHCgNTSVAQAhIICgRSVE1QEAMSCAoEUlRTUBAE');
@$core.Deprecated('Use peerStateDescriptor instead')
const PeerState$json = const {
  '1': 'PeerState',
  '2': const [
    const {'1': 'JOIN', '2': 0},
    const {'1': 'UPDATE', '2': 1},
    const {'1': 'LEAVE', '2': 2},
  ],
};

/// Descriptor for `PeerState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List peerStateDescriptor = $convert.base64Decode(
    'CglQZWVyU3RhdGUSCAoESk9JThAAEgoKBlVQREFURRABEgkKBUxFQVZFEAI=');
@$core.Deprecated('Use errorDescriptor instead')
const Error$json = const {
  '1': 'Error',
  '2': const [
    const {
      '1': 'code',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.room.ErrorType',
      '10': 'code'
    },
    const {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `Error`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorDescriptor = $convert.base64Decode(
    'CgVFcnJvchIjCgRjb2RlGAEgASgOMg8ucm9vbS5FcnJvclR5cGVSBGNvZGUSFgoGcmVhc29uGAIgASgJUgZyZWFzb24=');
@$core.Deprecated('Use requestDescriptor instead')
const Request$json = const {
  '1': 'Request',
  '2': const [
    const {
      '1': 'join',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.room.JoinRequest',
      '9': 0,
      '10': 'join'
    },
    const {
      '1': 'leave',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.room.LeaveRequest',
      '9': 0,
      '10': 'leave'
    },
    const {
      '1': 'sendMessage',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.room.SendMessageRequest',
      '9': 0,
      '10': 'sendMessage'
    },
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};

/// Descriptor for `Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDescriptor = $convert.base64Decode(
    'CgdSZXF1ZXN0EicKBGpvaW4YASABKAsyES5yb29tLkpvaW5SZXF1ZXN0SABSBGpvaW4SKgoFbGVhdmUYAiABKAsyEi5yb29tLkxlYXZlUmVxdWVzdEgAUgVsZWF2ZRI8CgtzZW5kTWVzc2FnZRgDIAEoCzIYLnJvb20uU2VuZE1lc3NhZ2VSZXF1ZXN0SABSC3NlbmRNZXNzYWdlQgkKB3BheWxvYWQ=');
@$core.Deprecated('Use replyDescriptor instead')
const Reply$json = const {
  '1': 'Reply',
  '2': const [
    const {
      '1': 'join',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.room.JoinReply',
      '9': 0,
      '10': 'join'
    },
    const {
      '1': 'leave',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.room.LeaveReply',
      '9': 0,
      '10': 'leave'
    },
    const {
      '1': 'sendMessage',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.room.SendMessageReply',
      '9': 0,
      '10': 'sendMessage'
    },
    const {
      '1': 'Peer',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.room.PeerEvent',
      '9': 0,
      '10': 'peer'
    },
    const {
      '1': 'message',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.room.Message',
      '9': 0,
      '10': 'message'
    },
    const {
      '1': 'disconnect',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.room.Disconnect',
      '9': 0,
      '10': 'disconnect'
    },
    const {
      '1': 'room',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.room.Room',
      '9': 0,
      '10': 'room'
    },
  ],
  '8': const [
    const {'1': 'payload'},
  ],
};

/// Descriptor for `Reply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyDescriptor = $convert.base64Decode(
    'CgVSZXBseRIlCgRqb2luGAEgASgLMg8ucm9vbS5Kb2luUmVwbHlIAFIEam9pbhIoCgVsZWF2ZRgCIAEoCzIQLnJvb20uTGVhdmVSZXBseUgAUgVsZWF2ZRI6CgtzZW5kTWVzc2FnZRgDIAEoCzIWLnJvb20uU2VuZE1lc3NhZ2VSZXBseUgAUgtzZW5kTWVzc2FnZRIlCgRQZWVyGAQgASgLMg8ucm9vbS5QZWVyRXZlbnRIAFIEcGVlchIpCgdtZXNzYWdlGAUgASgLMg0ucm9vbS5NZXNzYWdlSABSB21lc3NhZ2USMgoKZGlzY29ubmVjdBgGIAEoCzIQLnJvb20uRGlzY29ubmVjdEgAUgpkaXNjb25uZWN0EiAKBHJvb20YByABKAsyCi5yb29tLlJvb21IAFIEcm9vbUIJCgdwYXlsb2Fk');
@$core.Deprecated('Use createRoomRequestDescriptor instead')
const CreateRoomRequest$json = const {
  '1': 'CreateRoomRequest',
  '2': const [
    const {
      '1': 'room',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.room.Room',
      '10': 'room'
    },
  ],
};

/// Descriptor for `CreateRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoomRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVSb29tUmVxdWVzdBIeCgRyb29tGAEgASgLMgoucm9vbS5Sb29tUgRyb29t');
@$core.Deprecated('Use createRoomReplyDescriptor instead')
const CreateRoomReply$json = const {
  '1': 'CreateRoomReply',
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
  ],
};

/// Descriptor for `CreateRoomReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoomReplyDescriptor = $convert.base64Decode(
    'Cg9DcmVhdGVSb29tUmVwbHkSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIhCgVlcnJvchgCIAEoCzILLnJvb20uRXJyb3JSBWVycm9y');
@$core.Deprecated('Use deleteRoomRequestDescriptor instead')
const DeleteRoomRequest$json = const {
  '1': 'DeleteRoomRequest',
  '2': const [
    const {'1': 'sid', '3': 1, '4': 1, '5': 9, '10': 'sid'},
  ],
};

/// Descriptor for `DeleteRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRoomRequestDescriptor = $convert
    .base64Decode('ChFEZWxldGVSb29tUmVxdWVzdBIQCgNzaWQYASABKAlSA3NpZA==');
@$core.Deprecated('Use deleteRoomReplyDescriptor instead')
const DeleteRoomReply$json = const {
  '1': 'DeleteRoomReply',
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
  ],
};

/// Descriptor for `DeleteRoomReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRoomReplyDescriptor = $convert.base64Decode(
    'Cg9EZWxldGVSb29tUmVwbHkSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIhCgVlcnJvchgCIAEoCzILLnJvb20uRXJyb3JSBWVycm9y');
@$core.Deprecated('Use joinRequestDescriptor instead')
const JoinRequest$json = const {
  '1': 'JoinRequest',
  '2': const [
    const {
      '1': 'peer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.room.Peer',
      '10': 'peer'
    },
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `JoinRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinRequestDescriptor = $convert.base64Decode(
    'CgtKb2luUmVxdWVzdBIeCgRwZWVyGAEgASgLMgoucm9vbS5QZWVyUgRwZWVyEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use roomDescriptor instead')
const Room$json = const {
  '1': 'Room',
  '2': const [
    const {'1': 'sid', '3': 1, '4': 1, '5': 9, '10': 'sid'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'lock', '3': 3, '4': 1, '5': 8, '10': 'lock'},
    const {'1': 'password', '3': 4, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'maxPeers', '3': 6, '4': 1, '5': 13, '10': 'maxPeers'},
  ],
};

/// Descriptor for `Room`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomDescriptor = $convert.base64Decode(
    'CgRSb29tEhAKA3NpZBgBIAEoCVIDc2lkEhIKBG5hbWUYAiABKAlSBG5hbWUSEgoEbG9jaxgDIAEoCFIEbG9jaxIaCghwYXNzd29yZBgEIAEoCVIIcGFzc3dvcmQSIAoLZGVzY3JpcHRpb24YBSABKAlSC2Rlc2NyaXB0aW9uEhoKCG1heFBlZXJzGAYgASgNUghtYXhQZWVycw==');
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
      '6': '.room.Error',
      '10': 'error'
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
      '1': 'room',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.room.Room',
      '10': 'room'
    },
  ],
};

/// Descriptor for `JoinReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinReplyDescriptor = $convert.base64Decode(
    'CglKb2luUmVwbHkSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIhCgVlcnJvchgCIAEoCzILLnJvb20uRXJyb3JSBWVycm9yEh4KBHJvbGUYAyABKA4yCi5yb29tLlJvbGVSBHJvbGUSHgoEcm9vbRgEIAEoCzIKLnJvb20uUm9vbVIEcm9vbQ==');
@$core.Deprecated('Use leaveRequestDescriptor instead')
const LeaveRequest$json = const {
  '1': 'LeaveRequest',
  '2': const [
    const {'1': 'sid', '3': 1, '4': 1, '5': 9, '10': 'sid'},
    const {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `LeaveRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaveRequestDescriptor = $convert.base64Decode(
    'CgxMZWF2ZVJlcXVlc3QSEAoDc2lkGAEgASgJUgNzaWQSEAoDdWlkGAIgASgJUgN1aWQ=');
@$core.Deprecated('Use leaveReplyDescriptor instead')
const LeaveReply$json = const {
  '1': 'LeaveReply',
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
  ],
};

/// Descriptor for `LeaveReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List leaveReplyDescriptor = $convert.base64Decode(
    'CgpMZWF2ZVJlcGx5EhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSIQoFZXJyb3IYAiABKAsyCy5yb29tLkVycm9yUgVlcnJvcg==');
@$core.Deprecated('Use peerDescriptor instead')
const Peer$json = const {
  '1': 'Peer',
  '2': const [
    const {'1': 'sid', '3': 1, '4': 1, '5': 9, '10': 'sid'},
    const {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'displayName', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'extraInfo', '3': 4, '4': 1, '5': 12, '10': 'extraInfo'},
    const {'1': 'destination', '3': 5, '4': 1, '5': 9, '10': 'destination'},
    const {
      '1': 'role',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.room.Role',
      '10': 'role'
    },
    const {
      '1': 'protocol',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.room.Protocol',
      '10': 'protocol'
    },
    const {'1': 'avatar', '3': 8, '4': 1, '5': 9, '10': 'avatar'},
    const {
      '1': 'direction',
      '3': 9,
      '4': 1,
      '5': 14,
      '6': '.room.Peer.Direction',
      '10': 'direction'
    },
    const {'1': 'vendor', '3': 10, '4': 1, '5': 9, '10': 'vendor'},
  ],
  '4': const [Peer_Direction$json],
};

@$core.Deprecated('Use peerDescriptor instead')
const Peer_Direction$json = const {
  '1': 'Direction',
  '2': const [
    const {'1': 'INCOMING', '2': 0},
    const {'1': 'OUTGOING', '2': 1},
    const {'1': 'BILATERAL', '2': 2},
  ],
};

/// Descriptor for `Peer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List peerDescriptor = $convert.base64Decode(
    'CgRQZWVyEhAKA3NpZBgBIAEoCVIDc2lkEhAKA3VpZBgCIAEoCVIDdWlkEiAKC2Rpc3BsYXlOYW1lGAMgASgJUgtkaXNwbGF5TmFtZRIcCglleHRyYUluZm8YBCABKAxSCWV4dHJhSW5mbxIgCgtkZXN0aW5hdGlvbhgFIAEoCVILZGVzdGluYXRpb24SHgoEcm9sZRgGIAEoDjIKLnJvb20uUm9sZVIEcm9sZRIqCghwcm90b2NvbBgHIAEoDjIOLnJvb20uUHJvdG9jb2xSCHByb3RvY29sEhYKBmF2YXRhchgIIAEoCVIGYXZhdGFyEjIKCWRpcmVjdGlvbhgJIAEoDjIULnJvb20uUGVlci5EaXJlY3Rpb25SCWRpcmVjdGlvbhIWCgZ2ZW5kb3IYCiABKAlSBnZlbmRvciI2CglEaXJlY3Rpb24SDAoISU5DT01JTkcQABIMCghPVVRHT0lORxABEg0KCUJJTEFURVJBTBAC');
@$core.Deprecated('Use addPeerRequestDescriptor instead')
const AddPeerRequest$json = const {
  '1': 'AddPeerRequest',
  '2': const [
    const {
      '1': 'peer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.room.Peer',
      '10': 'peer'
    },
  ],
};

/// Descriptor for `AddPeerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addPeerRequestDescriptor = $convert.base64Decode(
    'Cg5BZGRQZWVyUmVxdWVzdBIeCgRwZWVyGAEgASgLMgoucm9vbS5QZWVyUgRwZWVy');
@$core.Deprecated('Use addPeerReplyDescriptor instead')
const AddPeerReply$json = const {
  '1': 'AddPeerReply',
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
  ],
};

/// Descriptor for `AddPeerReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addPeerReplyDescriptor = $convert.base64Decode(
    'CgxBZGRQZWVyUmVwbHkSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIhCgVlcnJvchgCIAEoCzILLnJvb20uRXJyb3JSBWVycm9y');
@$core.Deprecated('Use getPeersRequestDescriptor instead')
const GetPeersRequest$json = const {
  '1': 'GetPeersRequest',
  '2': const [
    const {'1': 'sid', '3': 1, '4': 1, '5': 9, '10': 'sid'},
  ],
};

/// Descriptor for `GetPeersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPeersRequestDescriptor =
    $convert.base64Decode('Cg9HZXRQZWVyc1JlcXVlc3QSEAoDc2lkGAEgASgJUgNzaWQ=');
@$core.Deprecated('Use getPeersReplyDescriptor instead')
const GetPeersReply$json = const {
  '1': 'GetPeersReply',
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
      '1': 'Peers',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.room.Peer',
      '10': 'peers'
    },
  ],
};

/// Descriptor for `GetPeersReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPeersReplyDescriptor = $convert.base64Decode(
    'Cg1HZXRQZWVyc1JlcGx5EhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSIQoFZXJyb3IYAiABKAsyCy5yb29tLkVycm9yUgVlcnJvchIgCgVQZWVycxgDIAMoCzIKLnJvb20uUGVlclIFcGVlcnM=');
@$core.Deprecated('Use messageDescriptor instead')
const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'from', '3': 1, '4': 1, '5': 9, '10': 'from'},
    const {'1': 'to', '3': 2, '4': 1, '5': 9, '10': 'to'},
    const {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'payload', '3': 4, '4': 1, '5': 12, '10': 'payload'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEhIKBGZyb20YASABKAlSBGZyb20SDgoCdG8YAiABKAlSAnRvEhIKBHR5cGUYAyABKAlSBHR5cGUSGAoHcGF5bG9hZBgEIAEoDFIHcGF5bG9hZA==');
@$core.Deprecated('Use sendMessageRequestDescriptor instead')
const SendMessageRequest$json = const {
  '1': 'SendMessageRequest',
  '2': const [
    const {'1': 'sid', '3': 1, '4': 1, '5': 9, '10': 'sid'},
    const {
      '1': 'message',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.room.Message',
      '10': 'message'
    },
  ],
};

/// Descriptor for `SendMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMessageRequestDescriptor = $convert.base64Decode(
    'ChJTZW5kTWVzc2FnZVJlcXVlc3QSEAoDc2lkGAEgASgJUgNzaWQSJwoHbWVzc2FnZRgCIAEoCzINLnJvb20uTWVzc2FnZVIHbWVzc2FnZQ==');
@$core.Deprecated('Use sendMessageReplyDescriptor instead')
const SendMessageReply$json = const {
  '1': 'SendMessageReply',
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
  ],
};

/// Descriptor for `SendMessageReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMessageReplyDescriptor = $convert.base64Decode(
    'ChBTZW5kTWVzc2FnZVJlcGx5EhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSIQoFZXJyb3IYAiABKAsyCy5yb29tLkVycm9yUgVlcnJvcg==');
@$core.Deprecated('Use disconnectDescriptor instead')
const Disconnect$json = const {
  '1': 'Disconnect',
  '2': const [
    const {'1': 'sid', '3': 1, '4': 1, '5': 9, '10': 'sid'},
    const {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `Disconnect`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disconnectDescriptor = $convert.base64Decode(
    'CgpEaXNjb25uZWN0EhAKA3NpZBgBIAEoCVIDc2lkEhYKBnJlYXNvbhgCIAEoCVIGcmVhc29u');
@$core.Deprecated('Use peerEventDescriptor instead')
const PeerEvent$json = const {
  '1': 'PeerEvent',
  '2': const [
    const {
      '1': 'Peer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.room.Peer',
      '10': 'peer'
    },
    const {
      '1': 'state',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.room.PeerState',
      '10': 'state'
    },
  ],
};

/// Descriptor for `PeerEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List peerEventDescriptor = $convert.base64Decode(
    'CglQZWVyRXZlbnQSHgoEUGVlchgBIAEoCzIKLnJvb20uUGVlclIEcGVlchIlCgVzdGF0ZRgCIAEoDjIPLnJvb20uUGVlclN0YXRlUgVzdGF0ZQ==');
@$core.Deprecated('Use updateRoomRequestDescriptor instead')
const UpdateRoomRequest$json = const {
  '1': 'UpdateRoomRequest',
  '2': const [
    const {
      '1': 'room',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.room.Room',
      '10': 'room'
    },
  ],
};

/// Descriptor for `UpdateRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRoomRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVSb29tUmVxdWVzdBIeCgRyb29tGAEgASgLMgoucm9vbS5Sb29tUgRyb29t');
@$core.Deprecated('Use updateRoomReplyDescriptor instead')
const UpdateRoomReply$json = const {
  '1': 'UpdateRoomReply',
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
  ],
};

/// Descriptor for `UpdateRoomReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRoomReplyDescriptor = $convert.base64Decode(
    'Cg9VcGRhdGVSb29tUmVwbHkSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIhCgVlcnJvchgCIAEoCzILLnJvb20uRXJyb3JSBWVycm9y');
@$core.Deprecated('Use endRoomRequestDescriptor instead')
const EndRoomRequest$json = const {
  '1': 'EndRoomRequest',
  '2': const [
    const {'1': 'sid', '3': 1, '4': 1, '5': 9, '10': 'sid'},
    const {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
    const {'1': 'delete', '3': 3, '4': 1, '5': 8, '10': 'delete'},
  ],
};

/// Descriptor for `EndRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List endRoomRequestDescriptor = $convert.base64Decode(
    'Cg5FbmRSb29tUmVxdWVzdBIQCgNzaWQYASABKAlSA3NpZBIWCgZyZWFzb24YAiABKAlSBnJlYXNvbhIWCgZkZWxldGUYAyABKAhSBmRlbGV0ZQ==');
@$core.Deprecated('Use endRoomReplyDescriptor instead')
const EndRoomReply$json = const {
  '1': 'EndRoomReply',
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
  ],
};

/// Descriptor for `EndRoomReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List endRoomReplyDescriptor = $convert.base64Decode(
    'CgxFbmRSb29tUmVwbHkSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIhCgVlcnJvchgCIAEoCzILLnJvb20uRXJyb3JSBWVycm9y');
@$core.Deprecated('Use getRoomsRequestDescriptor instead')
const GetRoomsRequest$json = const {
  '1': 'GetRoomsRequest',
};

/// Descriptor for `GetRoomsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoomsRequestDescriptor =
    $convert.base64Decode('Cg9HZXRSb29tc1JlcXVlc3Q=');
@$core.Deprecated('Use getRoomsReplyDescriptor instead')
const GetRoomsReply$json = const {
  '1': 'GetRoomsReply',
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
      '1': 'rooms',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.room.Room',
      '10': 'rooms'
    },
  ],
};

/// Descriptor for `GetRoomsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoomsReplyDescriptor = $convert.base64Decode(
    'Cg1HZXRSb29tc1JlcGx5EhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSIQoFZXJyb3IYAiABKAsyCy5yb29tLkVycm9yUgVlcnJvchIgCgVyb29tcxgDIAMoCzIKLnJvb20uUm9vbVIFcm9vbXM=');
@$core.Deprecated('Use updatePeerRequestDescriptor instead')
const UpdatePeerRequest$json = const {
  '1': 'UpdatePeerRequest',
  '2': const [
    const {
      '1': 'peer',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.room.Peer',
      '10': 'peer'
    },
  ],
};

/// Descriptor for `UpdatePeerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePeerRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVQZWVyUmVxdWVzdBIeCgRwZWVyGAEgASgLMgoucm9vbS5QZWVyUgRwZWVy');
@$core.Deprecated('Use updatePeerReplyDescriptor instead')
const UpdatePeerReply$json = const {
  '1': 'UpdatePeerReply',
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
  ],
};

/// Descriptor for `UpdatePeerReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePeerReplyDescriptor = $convert.base64Decode(
    'Cg9VcGRhdGVQZWVyUmVwbHkSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIhCgVlcnJvchgCIAEoCzILLnJvb20uRXJyb3JSBWVycm9y');
@$core.Deprecated('Use removePeerRequestDescriptor instead')
const RemovePeerRequest$json = const {
  '1': 'RemovePeerRequest',
  '2': const [
    const {'1': 'sid', '3': 1, '4': 1, '5': 9, '10': 'sid'},
    const {'1': 'uid', '3': 2, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `RemovePeerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removePeerRequestDescriptor = $convert.base64Decode(
    'ChFSZW1vdmVQZWVyUmVxdWVzdBIQCgNzaWQYASABKAlSA3NpZBIQCgN1aWQYAiABKAlSA3VpZA==');
@$core.Deprecated('Use removePeerReplyDescriptor instead')
const RemovePeerReply$json = const {
  '1': 'RemovePeerReply',
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
  ],
};

/// Descriptor for `RemovePeerReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removePeerReplyDescriptor = $convert.base64Decode(
    'Cg9SZW1vdmVQZWVyUmVwbHkSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIhCgVlcnJvchgCIAEoCzILLnJvb20uRXJyb3JSBWVycm9y');
