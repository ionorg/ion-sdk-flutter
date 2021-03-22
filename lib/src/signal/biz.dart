import 'dart:async';
import 'dart:convert';

import 'package:events2/events2.dart';
import 'package:grpc/grpc.dart';

import '../ion.dart';
import '_proto/library/biz.pbgrpc.dart' as grpc;
import '_proto/library/ion.pb.dart' as ion;
import 'grpc-web/_channel.dart'
    if (dart.library.html) 'grpc-web/_channel_html.dart';

class BizClient extends EventEmitter {
  BizClient(this._uri) {
    var uri = Uri.parse(_uri);
    var channel = createChannel(uri.host, uri.port);
    _client = grpc.BizClient(channel);
    _requestStream = StreamController<grpc.SignalRequest>();
  }

  final String _uri;
  grpc.BizClient _client;
  StreamController<grpc.SignalRequest> _requestStream;
  ResponseStream<grpc.SignalReply> _replyStream;
  final JsonEncoder _jsonEncoder = JsonEncoder();

  void connect() {
    _replyStream = _client.signal(_requestStream.stream);
    _replyStream.listen(_onSignalReply,
        onDone: () => emit('error', Error()), onError: (e) => emit('error', e));
  }

  void close() {
    _requestStream?.close();
    _replyStream?.cancel();
  }

  Future<bool> join({String sid, String uid, dynamic info}) async {
    Completer completer = Completer<bool>();
    var request = grpc.SignalRequest()
      ..join = grpc.Join(
          peer: ion.Peer(
              sid: sid,
              uid: uid,
              info: utf8.encode(_jsonEncoder.convert(info))));
    _requestStream.add(request);
    Function(bool, String) handler;
    handler = (success, reason) {
      completer.complete(success);
    };
    once('join-reply', handler);
    return completer.future;
  }

  Future<void> leave(String uid) async {
    Completer completer = Completer<bool>();
    var request = grpc.SignalRequest()..leave = grpc.Leave(uid: uid);
    _requestStream.add(request);
    Function() handler;
    handler = () {
      completer.complete();
    };
    once('leave-reply', handler);
  }

  void sendMessage(String from, String to, dynamic data) async {
    var request = grpc.SignalRequest()
      ..msg = ion.Message(from: from, to: to, data: data);
    _requestStream.add(request);
  }

  void _onSignalReply(grpc.SignalReply reply) {
    switch (reply.whichPayload()) {
      case grpc.SignalReply_Payload.joinReply:
        emit('join-reply', reply.joinReply.success, reply.joinReply.reason);
        break;
      case grpc.SignalReply_Payload.leaveReply:
        emit('leave-reply', reply.leaveReply.reason);
        break;
      case grpc.SignalReply_Payload.peerEvent:
        var event = reply.peerEvent;
        var peer = Peer()
          ..sid = event.peer.sid
          ..uid = event.peer.uid
          ..info = event.peer.info;

        var state = PeerState.NONE;
        switch (event.state) {
          case ion.PeerEvent_State.JOIN:
            state = PeerState.JOIN;
            break;
          case ion.PeerEvent_State.UPDATE:
            state = PeerState.UPDATE;
            break;
          case ion.PeerEvent_State.LEAVE:
            state = PeerState.LEAVE;
            break;
        }
        emit(
            'peer-event',
            PeerEvent()
              ..state = state
              ..peer = peer);
        break;
      case grpc.SignalReply_Payload.streamEvent:
        var event = reply.streamEvent;
        var state = StreamState.NONE;
        switch (event.state) {
          case ion.StreamEvent_State.ADD:
            state = StreamState.ADD;
            break;
          case ion.StreamEvent_State.REMOVE:
            state = StreamState.REMOVE;
            break;
        }
        emit(
            'stream-event',
            StreamEvent()
              ..state = state
              ..sid = event.sid
              ..uid = event.uid
              ..streams = event.streams
                  .map((e) => Stream()
                    ..id = e.id
                    ..tracks = e.tracks
                        .map((e) => Track()
                          ..id = e.id
                          ..kind = e.kind
                          ..label = e.label
                          ..simulcast = e.simulcast)
                        .toList())
                  .toList());
        break;
      case grpc.SignalReply_Payload.msg:
        emit(
            'message',
            Message()
              ..from = reply.msg.from
              ..to = reply.msg.to
              ..data = reply.msg.data);
        break;
      default:
        break;
    }
  }
}
