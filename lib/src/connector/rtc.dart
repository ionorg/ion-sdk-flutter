import 'dart:async';
import 'dart:convert';

import 'package:events2/events2.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:uuid/uuid.dart';

import '../_library/proto/rtc/rtc.pbgrpc.dart' as pb;
import 'client.dart';
import 'ion.dart';
import 'signal.dart';
import 'stream.dart';

class Track {
  late String id;
  late String stream_id;
  late String kind;
  late bool muted;
  late String rid;
  late Map<String, String> simulcast;
}

enum TrackState {
  NONE,
  ADD,
  REMOVE,
}

class TrackEvent {
  late TrackState state;
  late String uid;
  late List<Track> tracks;
}

class IonSDKRTC extends IonService {
  @override
  String name = 'rtc';
  Map<String, dynamic> config = Client.defaultConfig;
  IonBaseConnector connector;
  _IonSFUGRPCSignal? _sig;
  late Client _client;

  Function(TrackEvent event)? ontrackevent;
  Function(MediaStreamTrack track, RemoteStream stream)? ontrack;
  Function(RTCDataChannel channel)? ondatachannel;
  Function(Map<String, dynamic> list)? onspeaker;

  IonSDKRTC(this.connector, {Map<String, dynamic>? cfg}) {
    if (cfg != null) {
      config.addAll(cfg);
    }
    connector.registerService(this);
  }

  @override
  Future<void> connect() async {
    _sig ??= _IonSFUGRPCSignal(connector, this);
    _sig?.ontrackevent = (event) => ontrackevent?.call(event);

    await _sig?.connect();

    _client = Client(_sig!, config);
    _client.transports = {
      RolePub:
          await Transport.create(role: RolePub, signal: _sig!, config: config),
      RoleSub:
          await Transport.create(role: RoleSub, signal: _sig!, config: config)
    };

    _client.signal.onready = () async {
      if (_client.initialized == false) {
        _client.initialized = true;
      }
    };

    _client.transports[RolePub]!.pc!.onRenegotiationNeeded =
        () => _client.onnegotiationneeded();
    _client.ontrack = (MediaStreamTrack track, RemoteStream stream) =>
        ontrack?.call(track, stream);
    _client.ondatachannel =
        (RTCDataChannel channel) => ondatachannel?.call(channel);
    _client.onspeaker = (list) => onspeaker?.call(list);
  }

  Future<void> join(String sid, String uid, Map<String, String> parameters) {
    return _client.join(sid, uid, parameters);
  }

  Future<List<StatsReport>>? getPubStats(MediaStreamTrack selector) {
    return _client.getPubStats(selector);
  }

  Future<List<StatsReport>>? getSubStats(MediaStreamTrack selector) {
    return _client.getSubStats(selector);
  }

  Future<void> publish(LocalStream stream) {
    return _client.publish(stream);
  }

  Future<void>? subscribe(List<String> trackIds, bool enabled) {
    return _sig?.subscribe(trackIds, enabled);
  }

  Future<RTCDataChannel> createDataChannel(String label) {
    return _client.createDataChannel(label);
  }

  @override
  void close() {
    _client.close();
    _sig = null;
  }
}

class _IonSFUGRPCSignal extends Signal {
  IonService service;
  IonBaseConnector connector;
  final JsonDecoder _jsonDecoder = JsonDecoder();
  final JsonEncoder _jsonEncoder = JsonEncoder();
  final Uuid _uuid = Uuid();
  final EventEmitter _emitter = EventEmitter();
  late pb.RTCClient _client;
  late StreamController<pb.Signalling> _requestStream;
  late grpc.ResponseStream<pb.Signalling> _replyStream;
  Function(TrackEvent event)? ontrackevent;

  _IonSFUGRPCSignal(this.connector, this.service) {
    _client = pb.RTCClient(connector.grpcClientChannel(),
        options: connector.callOptions());
    _requestStream = StreamController<pb.Signalling>();
  }

  void _onSignalReply(pb.Signalling reply) {
    switch (reply.whichPayload()) {
      case pb.Signalling_Payload.reply:
        _emitter.emit('join-reply', reply.reply.success, reply.reply.error);
        break;
      case pb.Signalling_Payload.description:
        var desc = RTCSessionDescription(reply.description.sdp, reply.description.type);
        if (desc.type == 'offer') {
          onnegotiate?.call(desc);
        } else {
          _emitter.emit('description', desc);
        }
        break;
      case pb.Signalling_Payload.trickle:
        var map = {
          'target': reply.trickle.target.value,
          'candidate': _jsonDecoder.convert(reply.trickle.init)
        };
        ontrickle?.call(Trickle.fromMap(map));
        break;
      case pb.Signalling_Payload.trackEvent:
        var state = TrackState.NONE;
        switch (reply.trackEvent.state) {
          case pb.TrackEvent_State.ADD:
            state = TrackState.ADD;
            break;
          case pb.TrackEvent_State.REMOVE:
            state = TrackState.REMOVE;
            break;
        }
        var event = TrackEvent()
        ..uid = reply.trackEvent.uid
        ..state = state;
        event.tracks = reply.trackEvent.tracks.map((e) => 
        Track()
        ..id = e.id
        ..stream_id = e.streamId
        ..kind = e.kind
        ..muted = e.muted
        ..rid = e.rid
        ).toList();
        ontrackevent?.call(event);
      break;
      case pb.Signalling_Payload.error:
      case pb.Signalling_Payload.notSet:
        break;
    }
  }

  @override
  Future<void> connect() async {
    _replyStream = _client.signal(_requestStream.stream);
    _replyStream.listen(_onSignalReply, onDone: () {
      onclose?.call(0, 'closed');
      _replyStream.trailers
          .then((trailers) => connector.onTrailers(service, trailers));
      connector.onClosed(service);
    }, onError: (e) {
      onclose?.call(500, '$e');
      _replyStream.trailers
          .then((trailers) => connector.onTrailers(service, trailers));
      connector.onError(service, e);
    });
    // ignore: unawaited_futures
    _replyStream.headers
        .then((headers) => connector.onHeaders(service, headers));
    onready?.call();
  }

  @override
  void close() {
    _requestStream.close();
    _replyStream.cancel();
  }

  @override
  Future<bool> join(
      String sid, String uid, Map<String, String> parameters) {
    Completer completer = Completer<bool>();
    var request = pb.Signalling()
      ..join = (pb.JoinRequest()
        ..parameters.addAll(parameters)
        ..sid = sid
        ..uid = uid);
    _requestStream.add(request);
    Function(bool, Object) handler;
    handler = (bool success, Object error) {
      if (success) {
        completer.complete(success);
      } else {
        completer.completeError(error);
      }
    };
    _emitter.once('join-reply', handler);
    return completer.future as Future<bool>;
  }

  @override
  Future<RTCSessionDescription> offer(RTCSessionDescription offer) {
    Completer completer = Completer<RTCSessionDescription>();
    var description = pb.SessionDescription(sdp: offer.sdp, type: offer.type);
    var sig = pb.Signalling(description: description);
    _requestStream.add(sig);
    Function(RTCSessionDescription) handler;
    handler = (desc) {
     completer.complete(desc);
    };
    _emitter.once('description', handler);
    return completer.future as Future<RTCSessionDescription>;
  }

  @override
  void answer(RTCSessionDescription answer) {
    var description = pb.SessionDescription(sdp: answer.sdp, type: answer.type);
    var sig = pb.Signalling(description: description);
    _requestStream.add(sig);
  }

  @override
  void trickle(Trickle trickle) {
    var sig = pb.Signalling()
      ..trickle = (pb.Trickle()
        ..target = pb.Target.valueOf(trickle.target)!
        ..init = _jsonEncoder.convert(trickle.candidate.toMap()));
    _requestStream.add(sig);
  }

  Future<void> subscribe(List<String> trackIds, bool enabled) async {
    
  }
}
