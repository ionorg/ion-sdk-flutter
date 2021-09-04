import 'dart:async';
import 'dart:convert';

import 'package:events2/events2.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:grpc/grpc.dart' as grpc;

import '../_library/proto/rtc/rtc.pbgrpc.dart' as pb;
import '../client.dart';
import '../signal/signal.dart';
import '../stream.dart';
import 'ion.dart';

class RtcError {
  final int code;
  final String reason;
  RtcError(this.code, this.reason);
}

class Result {
  final bool success;
  RtcError? error;
  Result(this.success, this.error);
}

enum MediaType {
  MEDIAUNKNOWN,
  USERMEDIA,
  SCREENCAPTURE,
  CAVANS,
  STREAMING,
  VOIP,
}

class TrackInfo {
  late String id;
  late String stream_id;
  late String kind;
  late bool muted;
  late String label;
  late MediaType type;
  late String layer;
  late int width;
  late int height;
  late int frame_rate;
}

enum TrackState {
  ADD,
  UPDATE,
  REMOVE,
}

class TrackEvent {
  late TrackState state;
  late String uid;
  late List<TrackInfo> tracks;
}

class JoinConfig {
  late bool no_publish;
  late bool no_subscribe;
  late bool no_auto_subscribe;
  JoinConfig(
      {this.no_publish = false,
      this.no_subscribe = false,
      this.no_auto_subscribe = false});
}

class Subscription {
  String trackId;
  bool mute;
  bool subscribe;
  String layer;
  Subscription(
      {required this.trackId,
      required this.mute,
      required this.subscribe,
      required this.layer});
}

class RTC extends Service {
  @override
  String name = 'rtc';
  Map<String, dynamic> config = Client.defaultConfig;
  Connector connector;
  _IonSFUGRPCSignal? _sig;
  late Client _client;

  Function(TrackEvent event)? ontrackevent;
  Function(MediaStreamTrack track, RemoteStream stream)? ontrack;
  Function(RTCDataChannel channel)? ondatachannel;
  Function(Map<String, dynamic> list)? onspeaker;

  RTC(this.connector, {Map<String, dynamic>? cfg}) {
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
    _client.ontrack = (MediaStreamTrack track, RemoteStream stream) =>
        ontrack?.call(track, stream);
    _client.ondatachannel =
        (RTCDataChannel channel) => ondatachannel?.call(channel);
    _client.onspeaker = (list) => onspeaker?.call(list);
  }

  Future<void> join(String sid, String uid, JoinConfig config) {
    _sig?.config = config;
    return _client.join(sid, uid);
  }

  Future<List<StatsReport>>? getPubStats(MediaStreamTrack selector) {
    return _client.getPubStats(selector);
  }

  Future<List<StatsReport>>? getSubStats(MediaStreamTrack selector) {
    return _client.getSubStats(selector);
  }

  Future<void> publish(LocalStream stream) {
    _sig?._buildTrackInfos(stream.stream);
    return _client.publish(stream);
  }

  Future<Result>? subscribe(List<Subscription> infos) {
    return _sig?.subscribe(infos);
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
  Service service;
  Connector connector;
  final JsonDecoder _jsonDecoder = JsonDecoder();
  final JsonEncoder _jsonEncoder = JsonEncoder();
  final EventEmitter _emitter = EventEmitter();
  late pb.RTCClient _client;
  late StreamController<pb.Request> _requestStream;
  late grpc.ResponseStream<pb.Reply> _replyStream;
  JoinConfig? config;
  List<pb.TrackInfo> _tracksInfos = [];
  Function(TrackEvent event)? ontrackevent;

  _IonSFUGRPCSignal(this.connector, this.service) {
    _client = pb.RTCClient(connector.grpcClientChannel(),
        options: connector.callOptions());
    _requestStream = StreamController<pb.Request>();
  }

  void _onSignalReply(pb.Reply reply) {
    switch (reply.whichPayload()) {
      case pb.Reply_Payload.join:
        _emitter.emit('join-reply', reply.join);
        break;
      case pb.Reply_Payload.description:
        var desc = RTCSessionDescription(
            reply.description.sdp, reply.description.type);
        if (desc.type == 'offer') {
          onnegotiate?.call(desc);
        } else {
          _emitter.emit('description', desc);
        }
        break;
      case pb.Reply_Payload.trickle:
        var map = {
          'target': reply.trickle.target.value,
          'candidate': _jsonDecoder.convert(reply.trickle.init)
        };
        ontrickle?.call(Trickle.fromMap(map));
        break;
      case pb.Reply_Payload.trackEvent:
        var state = TrackState.ADD;
        switch (reply.trackEvent.state) {
          case pb.TrackEvent_State.ADD:
            state = TrackState.ADD;
            break;
          case pb.TrackEvent_State.UPDATE:
            state = TrackState.UPDATE;
            break;
          case pb.TrackEvent_State.REMOVE:
            state = TrackState.REMOVE;
            break;
        }
        var event = TrackEvent()
          ..uid = reply.trackEvent.uid
          ..state = state;

        Function(pb.MediaType ptype) convMediaType = (pb.MediaType ptype) {
          var type = MediaType.MEDIAUNKNOWN;
          switch (ptype) {
            case pb.MediaType.UserMedia:
              type = MediaType.USERMEDIA;
              break;
            case pb.MediaType.ScreenCapture:
              type = MediaType.SCREENCAPTURE;
              break;
            case pb.MediaType.Cavans:
              type = MediaType.CAVANS;
              break;
            case pb.MediaType.Streaming:
              type = MediaType.STREAMING;
              break;
            case pb.MediaType.VoIP:
              type = MediaType.VOIP;
              break;
          }
          return type;
        };

        event.tracks = reply.trackEvent.tracks
            .map((e) => TrackInfo()
              ..id = e.id
              ..stream_id = e.streamId
              ..kind = e.kind
              ..muted = e.muted
              ..label = e.label
              ..layer = e.layer
              ..frame_rate = e.frameRate
              ..width = e.width
              ..height = e.height
              ..type = convMediaType(e.type))
            .toList();
        ontrackevent?.call(event);
        break;
      case pb.Reply_Payload.subscription:
        RtcError? err;
        if (reply.subscription.error != null) {
          err = RtcError(
              reply.subscription.error.code, reply.subscription.error.reason);
        }
        _emitter.emit('subscription', Result(reply.subscription.success, err));
        break;
      case pb.Reply_Payload.error:
        _emitter.emit('error', RtcError(reply.error.code, reply.error.reason));
        break;
      case pb.Reply_Payload.notSet:
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
  Future<RTCSessionDescription> join(
      String sid, String uid, RTCSessionDescription offer) {
    Completer completer = Completer<RTCSessionDescription>();
    var description = pb.SessionDescription(
        sdp: offer.sdp, type: offer.type, trackInfos: _tracksInfos);

    var cfg = <String, String>{};

    if (config != null) {
      cfg['NoPublish'] = config!.no_publish ? 'true' : 'false';
      cfg['NoSubscribe'] = config!.no_subscribe ? 'true' : 'false';
      cfg['NoAutoSubscribe'] = config!.no_auto_subscribe ? 'true' : 'false';
    }

    var request = pb.Request()
      ..join = (pb.JoinRequest(
        sid: sid,
        uid: uid,
        config: cfg,
        description: description,
      ));
    _requestStream.add(request);
    Function(pb.JoinReply) handler;
    handler = (pb.JoinReply reply) {
      if (reply.success) {
        var desc = RTCSessionDescription(
            reply.description.sdp, reply.description.type);
        completer.complete(desc);
      } else {
        completer.completeError(reply.error);
      }
    };
    _emitter.once('join-reply', handler);
    return completer.future as Future<RTCSessionDescription>;
  }

  @override
  Future<RTCSessionDescription> offer(RTCSessionDescription offer) {
    Completer completer = Completer<RTCSessionDescription>();
    var description = pb.SessionDescription(
        sdp: offer.sdp, type: offer.type, trackInfos: _tracksInfos);
    var req = pb.Request(description: description);
    _requestStream.add(req);
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
    var req = pb.Request(description: description);
    _requestStream.add(req);
  }

  @override
  void trickle(Trickle trickle) {
    var req = pb.Request()
      ..trickle = (pb.Trickle()
        ..target = pb.Target.valueOf(trickle.target)!
        ..init = _jsonEncoder.convert(trickle.candidate.toMap()));
    _requestStream.add(req);
  }

  Future<Result> subscribe(List<Subscription> infos) async {
    final subscription = pb.SubscriptionRequest()
      ..subscriptions.addAll(infos.map((e) => pb.Subscription()
        ..layer = e.layer
        ..mute = e.mute
        ..subscribe = e.subscribe
        ..trackId = e.trackId));
    var req = pb.Request();
    req.subscription = subscription;
    _requestStream.add(req);
    Completer completer = Completer<Result>();
    Function(Result) handler;
    handler = (ret) {
      completer.complete(ret);
    };
    _emitter.once('subscription', handler);
    return completer.future as Future<Result>;
  }

  void _buildTrackInfos(MediaStream stream) {
    final tracks = stream.getTracks();
    var trackInfos = <pb.TrackInfo>[];
    for (var track in tracks) {
      trackInfos.add(pb.TrackInfo()
        ..type = pb.MediaType.UserMedia
        ..id = track.id!
        ..kind = track.kind!
        ..muted = track.muted!
        ..muted = !track.enabled
        ..streamId = stream.id);
    }
    _tracksInfos = trackInfos;
  }
}
