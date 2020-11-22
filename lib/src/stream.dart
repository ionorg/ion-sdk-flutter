import 'dart:convert';

import 'package:flutter_ion/flutter_ion.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'client.dart';
import 'logger.dart';

class FrameRate {
  FrameRate({this.ideal, this.max});
  int ideal;
  int max;
  Map<String, dynamic> toMap() => {
        'ideal': ideal,
        'max': max,
      };
}

class MediaTrackConstraints {
  MediaTrackConstraints({this.frameRate, this.height, this.width});

  /// Properties of video tracks
  FrameRate frameRate;
  int height;
  int width;

  Map<String, dynamic> toMap() => {
        'width': {'ideal': width},
        'height': {'ideal': height},
        'frameRate': frameRate.toMap()
      };
}

class VideoConstraints {
  VideoConstraints({this.constraints, this.encodings});
  MediaTrackConstraints constraints;
  RTCRtpEncoding encodings;
}

var resolutions = ['qvga', 'vga', 'shd', 'hd', 'fhd', 'qhd'];

var videoConstraints = <String, VideoConstraints>{
  'qvga': VideoConstraints(
      constraints: MediaTrackConstraints(
          width: 320, height: 180, frameRate: FrameRate(ideal: 15, max: 30)),
      encodings: RTCRtpEncoding(maxBitrate: 150000, maxFramerate: 15)),
  'vga': VideoConstraints(
      constraints: MediaTrackConstraints(
          width: 640, height: 360, frameRate: FrameRate(ideal: 30, max: 60)),
      encodings: RTCRtpEncoding(maxBitrate: 500000, maxFramerate: 30)),
  'shd': VideoConstraints(
      constraints: MediaTrackConstraints(
          width: 960, height: 540, frameRate: FrameRate(ideal: 30, max: 60)),
      encodings: RTCRtpEncoding(maxBitrate: 1200000, maxFramerate: 30)),
  'hd': VideoConstraints(
      constraints: MediaTrackConstraints(
          width: 1280, height: 720, frameRate: FrameRate(ideal: 30, max: 60)),
      encodings: RTCRtpEncoding(maxBitrate: 2500000, maxFramerate: 30)),
  'fhd': VideoConstraints(
      constraints: MediaTrackConstraints(
          width: 1920, height: 1080, frameRate: FrameRate(ideal: 30, max: 60)),
      encodings: RTCRtpEncoding(maxBitrate: 4000000, maxFramerate: 30)),
  'qhd': VideoConstraints(
      constraints: MediaTrackConstraints(
          width: 2560, height: 1440, frameRate: FrameRate(ideal: 30, max: 60)),
      encodings: RTCRtpEncoding(maxBitrate: 8000000, maxFramerate: 30)),
};

enum Layer { none, low, medium, high }

Map<Layer, String> layerStringType = {
  Layer.none: 'none',
  Layer.low: 'low',
  Layer.medium: 'medium',
  Layer.high: 'high'
};

class Encoding {
  Layer layer;
  int maxBitrate;
  int maxFramerate;
}

class Constraints {
  Constraints(
      {this.resolution,
      this.deviceId,
      this.codec,
      this.audio,
      this.video,
      this.simulcast});
  String resolution;
  String codec;
  bool simulcast;
  bool audio;
  bool video;
  String deviceId;

  static final defaults = Constraints(
      resolution: 'hd',
      codec: 'vp8',
      audio: true,
      video: true,
      simulcast: false);
}

class LocalStream {
  LocalStream(this._stream, this._constraints);
  Constraints _constraints;
  RTCPeerConnection _pc;
  MediaStream _stream;

  MediaStream get stream => _stream;

  static Future<LocalStream> getUserMedia({Constraints constraints}) async {
    var stream = await navigator.mediaDevices.getUserMedia({
      'audio': LocalStream.computeAudioConstraints(
          constraints ?? Constraints.defaults),
      'video': LocalStream.computeVideoConstraints(
          constraints ?? Constraints.defaults)
    });
    return LocalStream(stream, constraints ?? Constraints.defaults);
  }

  static Future<LocalStream> getDisplayMedia({Constraints constraints}) async {
    var stream = await navigator.mediaDevices.getDisplayMedia({
      'video': true,
    });
    return LocalStream(stream, Constraints.defaults);
  }

  static dynamic computeAudioConstraints(Constraints constraints) {
    if (constraints.audio) {
      return true;
    } else if (constraints.video && constraints.resolution != null) {
      return {'deviceId': constraints.deviceId};
    }
    return false;
  }

  static dynamic computeVideoConstraints(Constraints constraints) {
    if (constraints.video) {
      return true;
    } else if (constraints.video && constraints.resolution != null) {
      var resolution = videoConstraints[constraints.resolution].constraints;
      return {
        'mandatory': {
          'minWidth': '1280',
          'minHeight': '720',
          'minFrameRate': '30',
        },
        ...resolution.toMap()
      };
    }
    return false;
  }

  /// 'audio' | 'video'
  MediaStreamTrack getTrack(String kind) {
    var tracks;
    if (kind == 'video') {
      tracks = _stream.getVideoTracks();
      return tracks.length > 0 ? _stream.getVideoTracks()[0] : null;
    }
    tracks = _stream.getAudioTracks();
    return tracks.length > 0 ? _stream.getAudioTracks()[0] : null;
  }

  /// 'audio' | 'video'
  Future<MediaStreamTrack> getNewTrack(String kind) async {
    var stream = await navigator.mediaDevices.getUserMedia({
      kind: kind == 'video'
          ? LocalStream.computeVideoConstraints(_constraints)
          : LocalStream.computeAudioConstraints(_constraints),
    });
    return stream.getTracks()[0];
  }

  void publishTrack({MediaStreamTrack track}) async {
    if (_pc != null) {
      if (track.kind == 'video' && _constraints.simulcast) {
        var idx = resolutions.indexOf(_constraints.resolution);
        var encodings = <RTCRtpEncoding>[
          RTCRtpEncoding(
            rid: 'f',
            active: true,
            maxBitrate: videoConstraints[resolutions[idx]].encodings.maxBitrate,
            minBitrate: 256000,
            scaleResolutionDownBy: 1.0,
            maxFramerate:
                videoConstraints[resolutions[idx]].encodings.maxFramerate,
          )
        ];

        if (idx - 1 >= 0) {
          encodings.add(RTCRtpEncoding(
            rid: 'h',
            active: true,
            scaleResolutionDownBy: 2.0,
            maxBitrate:
                videoConstraints[resolutions[idx - 1]].encodings.maxBitrate,
            minBitrate: 128000,
            maxFramerate:
                videoConstraints[resolutions[idx - 1]].encodings.maxFramerate,
          ));
        }

        if (idx - 2 >= 0) {
          encodings.add(RTCRtpEncoding(
            rid: 'q',
            active: true,
            minBitrate: 64000,
            scaleResolutionDownBy: 4.0,
            maxBitrate:
                videoConstraints[resolutions[idx - 2]].encodings.maxBitrate,
            maxFramerate:
                videoConstraints[resolutions[idx - 2]].encodings.maxFramerate,
          ));
        }

        var transceiver = await _pc.addTransceiver(
            track: track,
            init: RTCRtpTransceiverInit(
              streams: [_stream],
              direction: TransceiverDirection.SendOnly,
              sendEncodings: encodings,
            ));
        setPreferredCodec(transceiver);
      } else {
        var transceiver = await _pc.addTransceiver(
            track: track,
            init: RTCRtpTransceiverInit(
              streams: [_stream],
              direction: TransceiverDirection.SendOnly,
              sendEncodings: track.kind == 'video'
                  ? [videoConstraints[_constraints.resolution].encodings]
                  : [],
            ));
        if (track.kind == 'video') {
          setPreferredCodec(transceiver);
        }
      }
    }
  }

  void setPreferredCodec(RTCRtpTransceiver transceiver) {
    /// TODO(cloudwebrtc):
    /*
    if ('setCodecPreferences' in transceiver) {
      var  cap = RTCRtpSender.getCapabilities('video');
      if (!cap) return;
      var  selCodec = cap.codecs.find(
        (c) => c.mimeType == `video/${Constraints.codec.toUpperCase()}` || c.mimeType == `audio/OPUS`,
      );
      if (selCodec) {
        transceiver.setCodecPreferences([selCodec]);
      }
    }
    */
  }

  Future<void> updateTrack(
      {MediaStreamTrack next, MediaStreamTrack prev}) async {
    _stream.addTrack(next);
    // If published, replace published track with track from new device
    if (prev != null && prev.enabled) {
      _stream.removeTrack(prev);
      prev.dispose();
      if (_pc != null) {
        var senders = await _pc.getSenders();

        senders.forEach((RTCRtpSender sender) {
          if (sender?.track?.kind == next.kind) {
            sender.track?.dispose();
            sender.replaceTrack(next);
          }
        });
      }
    } else {
      _stream.addTrack(next);

      if (_pc != null) {
        publishTrack(track: next);
      }
    }
  }

  Future<void> publish(RTCPeerConnection pc) async {
    _pc = pc;
    _stream.getTracks().forEach((track) async => publishTrack(track: track));
  }

  Future<void> unpublish() async {
    if (_pc != null) {
      var tracks = _stream.getTracks();
      var senders = await _pc.getSenders();
      senders.forEach((RTCRtpSender s) async {
        if (s.track != null && tracks.contains((e) => s.track.id == e.id)) {
          await _pc?.removeTrack(s);
        }
      });
    }
  }

  /// 'audio' | 'video'
  Future<void> switchDevice(String kind, {String deviceId}) async {
    _constraints.deviceId = deviceId;
    var prev = getTrack(kind);
    var next = await getNewTrack(kind);
    updateTrack(next: next, prev: prev);
  }

  // 'audio' | 'video'
  Future<void> mute(String kind) async {
    var track = getTrack(kind);
    if (track != null) {
      await track.dispose();
    }
  }

  /// 'audio' | 'video'
  Future<void> unmute(String kind) async {
    var prev = getTrack(kind);
    var track = await getNewTrack(kind);
    updateTrack(next: track, prev: prev);
  }
}

class RemoteStream {
  RTCDataChannel api;
  MediaStream stream;
  bool audio;
  Layer video;
  Layer _videoPreMute;
  String get id => stream.id;

  Function(Layer layer) preferLayer;
  Function(String kind) mute;
  Function(String kind) unmute;
}

final jsonEncoder = JsonEncoder();
RemoteStream makeRemote(MediaStream stream, Transport transport) {
  var remote = RemoteStream();
  remote.stream = stream;
  remote.audio = true;
  remote.video = Layer.none;
  remote._videoPreMute = Layer.high;

  var select = () {
    var call = {
      'streamId': remote.id,
      'video': layerStringType[remote.video],
      'audio': remote.audio,
    };
    if (transport.api == null) {
      log.warn('api datachannel not ready yet');
    }

    if (transport.api == null) {
      /// queue call if we aren't open yet
      transport.onapiopen = () {
        transport.api?.send(RTCDataChannelMessage(jsonEncoder.convert(call)));
      };
    }

    transport.api?.send(RTCDataChannelMessage(jsonEncoder.convert(call)));
  };

  remote.preferLayer = (Layer layer) {
    remote.video = layer;
    select();
  };

  remote.mute = (kind) {
    if (kind == 'audio') {
      remote.audio = false;
    } else if (kind == 'video') {
      remote._videoPreMute = remote.video;
      remote.video = Layer.none;
    }
    select();
  };

  remote.unmute = (kind) {
    if (kind == 'audio') {
      remote.audio = true;
    } else if (kind == 'video') {
      remote.video = remote._videoPreMute;
    }
    select();
  };

  return remote;
}
