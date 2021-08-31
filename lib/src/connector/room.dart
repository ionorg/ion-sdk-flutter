import 'dart:async';
import 'dart:convert';

import 'package:events2/events2.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:grpc/grpc.dart' as grpc;

import '../_library/apps/room/proto/room.pb.dart' as pb;
import '../_library/apps/room/proto/room.pbgrpc.dart' as room;
import '../stream.dart';
import 'ion.dart';

enum PeerState {
  NONE,
  JOIN,
  UPDATE,
  LEAVE,
}

class Peer {
  late String sid;
  late String uid;
  late Map<String, dynamic> info;
}

class PeerEvent {
  late PeerState state;
  late Peer peer;
}

class Message {
  late String from;
  late String to;
  late Map<String, dynamic> data;
}

class IonAppRoom extends IonService {
  @override
  String name = 'room';
  IonBaseConnector connector;
  _IonBizGRPCClient? _biz;
  Function(Error err)? onError;
  Function(bool success, String reason)? onJoin;
  Function(String reason)? onLeave;
  Function(PeerEvent event)? onPeerEvent;
  Function(Message msg)? onMessage;
  Function(MediaStreamTrack track, RemoteStream stream)? onTrack;

  IonAppRoom(this.connector) {
    connector.registerService(this);
  }

  @override
  Future<void> connect() async {
    if (_biz == null) {
      var biz = _IonBizGRPCClient(connector, this);
      biz.on('join-reply',
          (bool success, String reason) => onJoin?.call(success, reason));
      biz.on('leave-reply', (String reason) => onLeave?.call(reason));
      biz.on('peer-event', (PeerEvent event) => onPeerEvent?.call(event));
      biz.on('message', (Message msg) => onMessage?.call(msg));
      biz.on('error', (Error err) => onError?.call(err));
      biz.connect();
      _biz = biz;
    }
  }

  void join(
      {required String sid,
      required String uid,
      required Map<String, dynamic> info}) {
    _biz?.join(sid: sid, uid: uid, info: info);
  }

  void leave(String uid) => _biz?.leave(uid);

  void message(String from, String to, Map<String, dynamic> data) =>
      _biz?.sendMessage(from, to, data);

  @override
  void close() {
    _biz?.close();
  }
}

class _IonBizGRPCClient extends EventEmitter {
  IonService service;
  IonBaseConnector connector;
  _IonBizGRPCClient(this.connector, this.service) {
    _client = room.RoomSignalClient(connector.grpcClientChannel(),
        options: connector.callOptions());
    _requestStream = StreamController<pb.Request>();
  }

  late room.RoomSignalClient _client;
  late StreamController<pb.Request> _requestStream;
  late grpc.ResponseStream<pb.Reply> _replyStream;
  final JsonEncoder _jsonEncoder = JsonEncoder();
  final JsonDecoder _jsonDecoder = JsonDecoder();

  void connect() {
    _replyStream = _client.signal(_requestStream.stream);
    _replyStream.listen(_onSignalReply, onDone: () {
      _replyStream.trailers
          .then((trailers) => connector.onTrailers(service, trailers));
      connector.onClosed(service);
    }, onError: (e) {
      _replyStream.trailers
          .then((trailers) => connector.onTrailers(service, trailers));
      connector.onError(service, e);
    });
    _replyStream.headers
        .then((headers) => connector.onHeaders(service, headers));
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
    var request = pb.Request()
      ..join = pb.JoinRequest(
          peer: pb.Peer(
        sid: sid,
        uid: uid,
      ));
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
    var request = pb.Request()..leave = pb.LeaveRequest(uid: uid);
    _requestStream.add(request);
    Function() handler;
    handler = () {
      completer.complete();
    };
    once('leave-reply', handler);
  }

  void sendMessage(String from, String to, Map<String, dynamic> data) async {
    var request = pb.Request()
      ..sendMessage = pb.SendMessageRequest(
          message: pb.Message(
              from: from,
              to: to,
              payload: utf8.encode(_jsonEncoder.convert(data))));
    _requestStream.add(request);
  }

  void _onSignalReply(pb.Reply reply) {
    switch (reply.whichPayload()) {
      case pb.Reply_Payload.join:
        emit('join-reply', reply.join.success, reply.join);
        break;
      case pb.Reply_Payload.leave:
        emit('leave-reply', reply.leave);
        break;
      case pb.Reply_Payload.peer:
        var event = reply.peer;
        var info = <String, dynamic>{};
        var state = PeerState.NONE;
        switch (event.state) {
          case pb.PeerState.JOIN:
            state = PeerState.JOIN;
            info = _jsonDecoder
                .convert(String.fromCharCodes(event.peer.extraInfo));
            break;
          case pb.PeerState.UPDATE:
            state = PeerState.UPDATE;
            info = _jsonDecoder
                .convert(String.fromCharCodes(event.peer.extraInfo));
            break;
          case pb.PeerState.LEAVE:
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
      case pb.Reply_Payload.message:
        var data =
            _jsonDecoder.convert(String.fromCharCodes(reply.message.payload));
        emit(
            'message',
            Message()
              ..from = reply.message.from
              ..to = reply.message.to
              ..data = data);
        break;
      default:
        break;
    }
  }
}
