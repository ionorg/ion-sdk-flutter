import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'client.dart';
import 'signal/biz.dart';
import 'signal/signal.dart';
import 'signal/signal_grpc_impl.dart';
import 'stream.dart';

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

enum StreamState {
  NONE,
  ADD,
  REMOVE,
}

class Track {
  late String id;
  late String label;
  late String kind;
  late Map<String, String> simulcast;
}

class Stream {
  late String id;
  late List<Track> tracks;
}

class StreamEvent {
  late StreamState state;
  late String sid;
  late String uid;
  late List<Stream> streams;
}

class Message {
  late String from;
  late String to;
  late Map<String, dynamic> data;
}

class IonConnector {
  IonConnector({required String url, Map<String, dynamic>? config}) {
    _biz = BizClient(url);
    _signal = GRPCWebSignal(url);
    //bind internal events.
    _biz.on('join-reply', (bool success, String reason) async {
      if (success && _sfu == null) {
        _sfu = await Client.create(sid: _sid, uid: _uid, signal: _signal);
        _sfu?.ontrack = (MediaStreamTrack track, RemoteStream stream) {
          onTrack?.call(track, stream);
        };
        onJoin?.call(success, reason);
      }
    });
    _biz.on('leave-reply', (String reason) => onLeave?.call(reason));
    _biz.on('peer-event', (PeerEvent event) => onPeerEvent?.call(event));
    _biz.on('stream-event', (StreamEvent event) => onStreamEvent?.call(event));
    _biz.on('message', (Message msg) => onMessage?.call(msg));
    _biz.on('error', (Error err) => onError?.call(err));
    _biz.connect();
  }

  late BizClient _biz;
  late Signal _signal;
  late String _sid, _uid;
  Client? _sfu;
  Client? get sfu => _sfu;

  Function(Error err)? onError;
  Function(bool success, String reason)? onJoin;
  Function(String reason)? onLeave;
  Function(PeerEvent event)? onPeerEvent;
  Function(StreamEvent event)? onStreamEvent;
  Function(Message msg)? onMessage;
  Function(MediaStreamTrack track, RemoteStream stream)? onTrack;

  void join(
      {required String sid,
      required String uid,
      required Map<String, dynamic> info,
      String token = ''}) {
    _sid = sid;
    _uid = uid;
    _biz.join(sid: sid, uid: uid, info: info);
  }

  void leave(String uid) => _biz.leave(uid);

  void message(String from, String to, Map<String, dynamic> data) =>
      _biz.sendMessage(from, to, data);

  void close() {}
}
