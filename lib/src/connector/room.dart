import 'dart:async';

import 'package:events2/events2.dart';
import 'package:grpc/grpc.dart' as grpc;

import '../_library/apps/room/proto/room.pb.dart' as pb;
import '../_library/apps/room/proto/room.pbgrpc.dart' as room;
import 'ion.dart';

enum PeerState {
  NONE,
  JOIN,
  UPDATE,
  LEAVE,
}

enum Role { HOST, GUEST }

enum Protocol {
  PROTOCOL_UNKNOWN,
  WEBRTC,
  SIP,
  RTMP,
  RTSP,
}

enum ErrorType {
  NONE,
  UNKOWNERROR,
  PERMISSIONDENIED,
  SERVICEUNAVAILABLE,
  ROOMLOCKED,
  PASSWORDREQUIRED,
  ROOMALREADYEXIST,
  ROOMNOTEXIST,
  INVALIDPARAMS,
  PEERALREADYEXIST,
  PEERNOTEXIST,
}

class RoomError {
  late ErrorType code;
  late String reason;
}

class JoinResult {
  late bool success;
  late RoomError? error;
  late Role role;
  late RoomInfo room;
}

enum Direction {
  INCOMING,
  OUTGOING,
  BILATERAL,
}

class Peer {
  late String sid;
  late String uid;
  late String displayname;
  late List<int> extrainfo;
  late String destination;
  late Role role;
  late Protocol protocol;
  late String avatar;
  late Direction direction;
  late String vendor;
}

class PeerEvent {
  late PeerState state;
  late Peer peer;
}

class Message {
  late String from;
  late String to;
  late String type;
  late List<int> payload;
}

class RoomInfo {
  late String sid;
  late String name;
  late bool lock;
  late String password;
  late String description;
  late int maxpeers;
}

class Disconnect {
  late String sid;
  late String reason;
}

class Room extends Service {
  @override
  String name = 'room';
  Connector connector;
  _RoomGRPCClient? _sig;
  Function(Error err)? onError;
  Function(JoinResult result)? onJoin;
  Function(String reason)? onLeave;
  Function(PeerEvent event)? onPeerEvent;
  Function(Message msg)? onMessage;
  Function(RoomInfo info)? onRoomInfo;
  Function(Disconnect discon)? onDisconnect;

  Room(this.connector) {
    connector.registerService(this);
  }

  @override
  Future<void> connect() async {
    if (_sig == null) {
      var sig = _RoomGRPCClient(connector, this);
      sig.on('join-reply', (JoinResult result) => onJoin?.call(result));
      sig.on('leave-reply', (String reason) => onLeave?.call(reason));
      sig.on('peer-event', (PeerEvent event) => onPeerEvent?.call(event));
      sig.on('message', (Message msg) => onMessage?.call(msg));
      sig.on('room-info', (RoomInfo info) => onRoomInfo?.call(info));
      sig.on('disconnect', (Disconnect disc) => onDisconnect?.call(disc));
      sig.on('error', (Error err) => onError?.call(err));
      sig.connect();
      _sig = sig;
    }
  }

  Future<JoinResult>? join({required Peer peer, String? password}) {
    _sig?.join(peer: peer, password: password);
  }

  void leave(String uid) => _sig?.leave(uid);

  void message(String sid, Message message) => _sig?.sendMessage(sid, message);

  void updatePeer(Peer peer) => _sig?.updatePeer(peer);

  @override
  void close() {
    _sig?.close();
  }
}

class _RoomGRPCClient extends EventEmitter {
  Service service;
  Connector connector;
  _RoomGRPCClient(this.connector, this.service) {
    _client = room.RoomSignalClient(connector.grpcClientChannel(),
        options: connector.callOptions());
    _requestStream = StreamController<pb.Request>();
    _serviceClient = room.RoomServiceClient(connector.grpcClientChannel(),
        options: connector.callOptions());
  }

  late room.RoomSignalClient _client;
  late room.RoomServiceClient _serviceClient;
  late StreamController<pb.Request> _requestStream;
  late grpc.ResponseStream<pb.Reply> _replyStream;

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

  Future<JoinResult>? join({required Peer peer, String? password}) async {
    Completer completer = Completer<JoinResult>();
    var request = pb.Request()
      ..join = pb.JoinRequest(
        peer: pb.Peer()
          ..uid = peer.uid
          ..sid = peer.sid
          ..displayName = peer.displayname
          ..extraInfo = peer.extrainfo
          ..role = pb.Role.values[peer.role.index]
          ..protocol = pb.Protocol.values[peer.protocol.index]
          ..avatar = peer.avatar
          ..vendor = peer.vendor
          ..direction = pb.Peer_Direction.values[peer.direction.index],
        password: password,
      );
    _requestStream.add(request);
    Function(JoinResult) handler;
    handler = (result) {
      completer.complete(result);
    };
    once('join-reply', handler);
    return completer.future as Future<JoinResult>;
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

  void sendMessage(String sid, Message msg) async {
    var request = pb.Request()
      ..sendMessage = pb.SendMessageRequest(
          sid: sid,
          message: pb.Message(
            from: msg.from,
            to: msg.to,
            type: msg.type,
            payload: msg.payload,
          ));
    _requestStream.add(request);
  }

  void updatePeer(Peer peer) async {
    await _serviceClient.updatePeer(pb.UpdatePeerRequest(
      peer: pb.Peer()
        ..uid = peer.uid
        ..sid = peer.sid
        ..displayName = peer.displayname
        ..extraInfo = peer.extrainfo
        ..role = pb.Role.values[peer.role.index]
        ..protocol = pb.Protocol.values[peer.protocol.index]
        ..avatar = peer.avatar
        ..vendor = peer.vendor
        ..direction = pb.Peer_Direction.values[peer.direction.index],
    ));
  }

  void _onSignalReply(pb.Reply reply) {
    switch (reply.whichPayload()) {
      case pb.Reply_Payload.join:
        RoomError? err;
        err = RoomError()
          ..code = ErrorType.values[reply.join.error.code.value]
          ..reason = reply.join.error.reason;
        var room = RoomInfo()
          ..sid = reply.join.room.sid
          ..name = reply.join.room.name
          ..lock = reply.join.room.lock
          ..password = reply.join.room.password
          ..description = reply.join.room.description
          ..maxpeers = reply.join.room.maxPeers;
        emit(
            'join-reply',
            JoinResult()
              ..success = reply.join.success
              ..role = Role.values[reply.join.role.value]
              ..error = err
              ..room = room);
        break;
      case pb.Reply_Payload.leave:
        emit('leave-reply', reply.leave);
        break;
      case pb.Reply_Payload.peer:
        var event = reply.peer;
        var state = PeerState.NONE;
        switch (event.state) {
          case pb.PeerState.JOIN:
            state = PeerState.JOIN;
            break;
          case pb.PeerState.UPDATE:
            state = PeerState.UPDATE;
            break;
          case pb.PeerState.LEAVE:
            state = PeerState.LEAVE;
            break;
        }
        var peer = Peer()
          ..sid = event.peer.sid
          ..uid = event.peer.uid
          ..displayname = event.peer.displayName
          ..extrainfo = event.peer.extraInfo
          ..role = Role.values[event.peer.role.value]
          ..protocol = Protocol.values[event.peer.protocol.value]
          ..avatar = event.peer.avatar
          ..vendor = event.peer.vendor
          ..destination = event.peer.destination
          ..direction = Direction.values[event.peer.direction.value];
        emit(
            'peer-event',
            PeerEvent()
              ..state = state
              ..peer = peer);
        break;
      case pb.Reply_Payload.message:
        emit(
            'message',
            Message()
              ..from = reply.message.from
              ..to = reply.message.to
              ..type = reply.message.type
              ..payload = reply.message.payload);
        break;
      case pb.Reply_Payload.room:
        var room = RoomInfo()
          ..sid = reply.room.sid
          ..name = reply.room.name
          ..lock = reply.room.lock
          ..password = reply.room.password
          ..description = reply.room.description
          ..maxpeers = reply.room.maxPeers;
        emit('room-info', room);
        break;
      case pb.Reply_Payload.disconnect:
        emit(
            'disconnect',
            Disconnect()
              ..sid = reply.disconnect.sid
              ..reason = reply.disconnect.reason);
        break;
      default:
        break;
    }
  }
}
