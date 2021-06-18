import 'dart:async';
import 'dart:convert';

import 'package:events2/events2.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:uuid/uuid.dart';

import '../_library/proto/sfu/sfu.pbgrpc.dart' as pb;
import '../client.dart';
import '../signal/signal.dart';
import '../stream.dart';
import 'ion.dart';

class IonSDKSFU extends IonService {
  @override
  String name = 'sfu';
  Map<String, dynamic>? config;
  IonBaseConnector connector;
  _IonSFUGRPCSignal? _sig;
  late Client _sfu;
  Function(MediaStreamTrack track, RemoteStream stream)? ontrack;
  Function(RTCDataChannel channel)? ondatachannel;
  Function(List<dynamic> list)? onspeaker;

  IonSDKSFU(this.connector, {this.config}) {
    connector.registerService(this);
  }

  @override
  Future<void> connect() async {
    _sig ??= _IonSFUGRPCSignal(connector, this);
    await _sig?.connect();

    _sfu = Client(_sig!, config ?? {});
    _sfu.transports = {
      RolePub: await Transport.create(
          role: RolePub, signal: _sig!, config: config ?? {}),
      RoleSub: await Transport.create(
          role: RoleSub, signal: _sig!, config: config ?? {})
    };

    _sfu.signal.onready = () async {
      if (_sfu.initialized == false) {
        _sfu.initialized = true;
      }
    };

    _sfu.transports[RolePub]!.pc!.onRenegotiationNeeded = () => _sfu.onnegotiationneeded();
    _sfu.ontrack = (MediaStreamTrack track, RemoteStream stream) =>
        ontrack?.call(track, stream);
    _sfu.ondatachannel =
        (RTCDataChannel channel) => ondatachannel?.call(channel);
    _sfu.onspeaker = (List<dynamic> list) => onspeaker?.call(list);
  }

  Future<void> join(String sid, String uid) {
    return _sfu.join(sid, uid);
  }

  Future<List<StatsReport>>? getPubStats(MediaStreamTrack selector) {
    return _sfu.getPubStats(selector);
  }

  Future<List<StatsReport>>? getSubStats(MediaStreamTrack selector) {
    return _sfu.getSubStats(selector);
  }

  Future<void> publish(LocalStream stream) {
    return _sfu.publish(stream);
  }

  Future<RTCDataChannel> createDataChannel(String label) {
    return _sfu.createDataChannel(label);
  }

  @override
  void close() {
    _sfu.close();
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
  late pb.SFUClient _client;
  late StreamController<pb.SignalRequest> _requestStream;
  late grpc.ResponseStream<pb.SignalReply> _replyStream;

  _IonSFUGRPCSignal(this.connector, this.service) {
    _client = pb.SFUClient(connector.grpcClientChannel(),
        options: connector.callOptions());
    _requestStream = StreamController<pb.SignalRequest>();
  }

  void _onSignalReply(pb.SignalReply reply) {
    switch (reply.whichPayload()) {
      case pb.SignalReply_Payload.join:
        var map =
            _jsonDecoder.convert(String.fromCharCodes(reply.join.description));
        var desc = RTCSessionDescription(map['sdp'], map['type']);
        _emitter.emit('join-reply', desc);
        break;
      case pb.SignalReply_Payload.description:
        var map = _jsonDecoder.convert(String.fromCharCodes(reply.description));
        var desc = RTCSessionDescription(map['sdp'], map['type']);
        if (desc.type == 'offer') {
          onnegotiate?.call(desc);
        } else {
          _emitter.emit('description', reply.id, desc);
        }
        break;
      case pb.SignalReply_Payload.trickle:
        var map = {
          'target': reply.trickle.target.value,
          'candidate': _jsonDecoder.convert(reply.trickle.init)
        };
        ontrickle?.call(Trickle.fromMap(map));
        break;
      case pb.SignalReply_Payload.iceConnectionState:
      case pb.SignalReply_Payload.error:
      case pb.SignalReply_Payload.notSet:
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
    var id = _uuid.v4();
    var request = pb.SignalRequest()
      ..id = id
      ..join = (pb.JoinRequest()
        ..description = utf8.encode(_jsonEncoder.convert(offer.toMap()))
        ..sid = sid
        ..uid = uid);
    _requestStream.add(request);

    Function(String, dynamic) handler;
    handler = (respid, desc) {
      if (respid == id) {
        completer.complete(desc);
      }
    };
    _emitter.once('description', handler);
    return completer.future as Future<RTCSessionDescription>;
  }

  @override
  Future<RTCSessionDescription> offer(RTCSessionDescription offer) {
    Completer completer = Completer<RTCSessionDescription>();
    var id = _uuid.v4();
    var request = pb.SignalRequest()
      ..id = id
      ..description = utf8.encode(_jsonEncoder.convert(offer.toMap()));
    _requestStream.add(request);
    Function(String, dynamic) handler;
    handler = (respid, desc) {
      if (respid == id) {
        completer.complete(desc);
      }
    };
    _emitter.once('description', handler);
    return completer.future as Future<RTCSessionDescription>;
  }

  @override
  void answer(RTCSessionDescription answer) {
    var reply = pb.SignalRequest()
      ..description = utf8.encode(_jsonEncoder.convert(answer.toMap()));
    _requestStream.add(reply);
  }

  @override
  void trickle(Trickle trickle) {
    var reply = pb.SignalRequest()
      ..trickle = (pb.Trickle()
        ..target = pb.Trickle_Target.valueOf(trickle.target)!
        ..init = _jsonEncoder.convert(trickle.candidate.toMap()));
    _requestStream.add(reply);
  }
}
