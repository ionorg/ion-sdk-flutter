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
    var channel = createChannel(uri.host, uri.port, uri.scheme == 'https');
    _client = grpc.BizClient(channel);
    _requestStream = StreamController<grpc.SignalRequest>();
  }

  final String _uri;
  late grpc.BizClient _client;
  late StreamController<grpc.SignalRequest> _requestStream;
  late ResponseStream<grpc.SignalReply> _replyStream;
  final JsonEncoder _jsonEncoder = JsonEncoder();
  final JsonDecoder _jsonDecoder = JsonDecoder();

  void connect() {
    _replyStream = _client.signal(_requestStream.stream);
    _replyStream.listen(_onSignalReply,
        onDone: () => emit('error', Error()),
        onError: (e) {
          print('grpc err ${e.toString()}');
          emit('error', Error());
        });
  }

  void close() {
    _requestStream.close();
    _replyStream.cancel();
  }

  Future<bool> join(
      {required String sid,
      required String uid,
      required Map<String, dynamic> info,
      String? token}) async {
    Completer completer = Completer<bool>();
    var request = grpc.SignalRequest()
      ..join = grpc.Join(
          token: token,
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
    return completer.future as Future<bool>;
  }

  Future<void> leave(String uid) async {
    Completer completer = Completer<void>();
    var request = grpc.SignalRequest()..leave = grpc.Leave(uid: uid);
    _requestStream.add(request);
    Function() handler;
    handler = () {
      completer.complete();
    };
    once('leave-reply', handler);
  }

  void sendMessage(String from, String to, Map<String, dynamic> data) async {
    var request = grpc.SignalRequest()
      ..msg = ion.Message(
          from: from, to: to, data: utf8.encode(_jsonEncoder.convert(data)));
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
        var info = <String, dynamic>{};
        var state = PeerState.NONE;
        switch (event.state) {
          case ion.PeerEvent_State.JOIN:
            state = PeerState.JOIN;
            info = _jsonDecoder.convert(String.fromCharCodes(event.peer.info));
            break;
          case ion.PeerEvent_State.UPDATE:
            state = PeerState.UPDATE;
            info = _jsonDecoder.convert(String.fromCharCodes(event.peer.info));
            break;
          case ion.PeerEvent_State.LEAVE:
            state = PeerState.LEAVE;
            break;
        }
        var peer = Peer()
          ..sid = event.peer.sid
          ..uid = event.peer.uid
          ..info = info;
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
        var data = _jsonDecoder.convert(String.fromCharCodes(reply.msg.data));
        emit(
            'message',
            Message()
              ..from = reply.msg.from
              ..to = reply.msg.to
              ..data = data);
        break;
      default:
        break;
    }
  }
}
