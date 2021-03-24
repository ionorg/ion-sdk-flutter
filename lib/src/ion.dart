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
  String sid;
  String uid;
  Map<String, dynamic> info;
}

class PeerEvent {
  PeerState state;
  Peer peer;
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

class StreamEvent {
  StreamState state;
  String sid;
  String uid;
  List<Stream> streams;
}

class Message {
  String from;
  String to;
  Map<String, dynamic> data;
}

class IonConnector {
  IonConnector({String url, Map<String, dynamic> config}) {
    _biz = BizClient(url);
    _signal = GRPCWebSignal(url);
    _sfu = null;

    //bind internal events.
    _biz.on('join-reply', (bool success, String reason) async {
      onJoin?.call(success, reason);
      if (success && _sfu == null) {
        _sfu = await Client.create(sid: _sid, uid: _uid, signal: _signal);
        _sfu.ontrack = (MediaStreamTrack track, RemoteStream stream) {
          onTrack?.call(track, stream);
        };
      }
    });
    _biz.on('leave-reply', (String reason) => onLeave?.call(reason));
    _biz.on('peer-event', (PeerEvent event) => onPeerEvent?.call(event));
    _biz.on('stream-event', (StreamEvent event) => onStreamEvent?.call(event));
    _biz.on('message', (Message msg) => onMessage?.call(msg));
    _biz.on('error', (Error err) => onError?.call(err));
    _biz.connect();
  }

  BizClient _biz;
  Signal _signal;
  Client _sfu;
  String _sid, _uid;
  Client get sfu => _sfu;

  Function(Error err) onError;
  Function(bool success, String reason) onJoin;
  Function(String reason) onLeave;
  Function(PeerEvent event) onPeerEvent;
  Function(StreamEvent event) onStreamEvent;
  Function(Message msg) onMessage;
  Function(MediaStreamTrack track, RemoteStream stream) onTrack;

  void join({String sid, String uid, Map<String, dynamic> info, String token = ''}) {
    _sid = sid;
    _uid = uid;
    _biz.join(sid: sid, uid: uid, info: info);
  }

  void leave(String uid) => _biz.leave(uid);

  void message(String from, String to, Map<String, dynamic> data) =>
      _biz.sendMessage(from, to, data);

  void close() {}
}
