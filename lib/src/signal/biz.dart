import 'dart:async';
import 'dart:convert';

import 'package:events2/events2.dart';
import 'package:flutter_ion/src/signal/_proto/library/ion.pb.dart' as ion;
import 'package:grpc/grpc.dart';

import '_proto/library/biz.pbgrpc.dart' as grpc;
import 'grpc-web/_channel.dart'
    if (dart.library.html) 'grpc-web/_channel_html.dart';

enum PeerState {
  NONE,
  JOIN,
  UPDATE,
  LEAVE,
}

class Peer {
  String sid;
  String uid;
  dynamic info;
}

enum StreamState {
  NONE,
  ADD,
  REMOVE,
}

class Track {
  String id;
  String label;
  String kind;
  Map<String, String> simulcast;
}

class Stream {
  String id;
  List<Track> tracks;
}

class BizClient {
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
  final JsonDecoder _jsonDecoder = JsonDecoder();
  final JsonEncoder _jsonEncoder = JsonEncoder();
  final EventEmitter _emitter = EventEmitter();

  Function(Error err) onError;
  Function(bool success, String reason) onJoin;
  Function(String reason) onLeave;
  Function(PeerState state, Peer peer) onPeerEvent;
  Function(StreamState state, String sid, String uid, List<Stream> streams)
      onStreamEvent;
  Function(String from, String to, dynamic data) onMessage;

  void connect() {
    _replyStream = _client.signal(_requestStream.stream);
    _replyStream.listen(_onSignalReply,
        onDone: () => onError?.call(Error()), onError: (e) => onError?.call(e));
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
    _emitter.once('join-reply', handler);
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
    _emitter.once('leave-reply', handler);
  }

  void sendMessage(String from, String to, dynamic data) async {}

  void _onSignalReply(grpc.SignalReply reply) {
    switch (reply.whichPayload()) {
      case grpc.SignalReply_Payload.joinReply:
        _emitter.emit(
            'join-reply', reply.joinReply.success, reply.joinReply.reason);
        onJoin?.call(reply.joinReply.success, reply.joinReply.reason);
        break;
      case grpc.SignalReply_Payload.leaveReply:
        _emitter.emit('leave-reply', reply.leaveReply.reason);
        onLeave?.call(reply.leaveReply.reason);
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
        onPeerEvent?.call(state, peer);
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
        onStreamEvent?.call(
            state,
            event.sid,
            event.uid,
            event.streams
                .map((e) => Stream()
                  ..id = e.id
                  ..tracks = e.tracks.map((e) => Track()
                    ..id = e.id
                    ..kind = e.kind
                    ..label = e.label
                    ..simulcast = e.simulcast).toList())
                .toList());
        break;
      case grpc.SignalReply_Payload.msg:
        var from = reply.msg.from;
        var to = reply.msg.to;
        var data = reply.msg.data;
        onMessage?.call(from, to, data);
        break;
      default:
        break;
    }
  }
}
