///
//  Generated code. Do not modify.
//  source: sfu.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

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

const JoinRequest$json = const {
  '1': 'JoinRequest',
  '2': const [
    const {'1': 'sid', '3': 1, '4': 1, '5': 9, '10': 'sid'},
    const {'1': 'description', '3': 2, '4': 1, '5': 12, '10': 'description'},
  ],
};

const JoinReply$json = const {
  '1': 'JoinReply',
  '2': const [
    const {'1': 'description', '3': 1, '4': 1, '5': 12, '10': 'description'},
  ],
};

const Trickle$json = const {
  '1': 'Trickle',
  '2': const [
    const {'1': 'target', '3': 1, '4': 1, '5': 14, '6': '.sfu.Trickle.Target', '10': 'target'},
    const {'1': 'init', '3': 2, '4': 1, '5': 9, '10': 'init'},
  ],
  '4': const [Trickle_Target$json],
};

const Trickle_Target$json = const {
  '1': 'Target',
  '2': const [
    const {'1': 'PUBLISHER', '2': 0},
    const {'1': 'SUBSCRIBER', '2': 1},
  ],
};

