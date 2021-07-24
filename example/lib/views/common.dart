import 'dart:async';

import 'package:flutter_ion/src/connector/connector.dart' as ion;
import 'package:flutter_webrtc/flutter_webrtc.dart';

class Config {
  static bool simulcast = true;
  static String resolution = 'hd';
  static String codec = 'vp8';
  static String host = '192.168.124.4';
  static String get ion_cluster_url => 'http://' + host + ':5551';
  static String get ion_sfu_url => 'http://' + host + ':9090';
  static ion.Constraints get defaultConstraints => ion.Constraints.defaults
    ..simulcast = simulcast
    ..resolution = resolution
    ..codec = codec;
}

class Participant {
  Participant(this.stream, this.remote);
  bool remote;
  Object stream;
  String get id => remote
      ? (stream as ion.RemoteStream).stream.id
      : (stream as ion.LocalStream).stream.id;

  MediaStream get mediaStream => remote
      ? (stream as ion.RemoteStream).stream
      : (stream as ion.LocalStream).stream;

  String get title => (remote ? 'Remote' : 'Local') + ' ' + id.substring(0, 8);

  RTCVideoRenderer renderer = RTCVideoRenderer();

  void initialize() async {
    await renderer.initialize();
    renderer.srcObject = mediaStream;
    renderer.onResize = () {
      print(
          'onResize [${id.substring(0, 8)}] ${renderer.videoWidth} x ${renderer.videoHeight}');
    };
  }

  void dispose() async {
    renderer.srcObject = null;
    if (!remote) {
      await (stream as ion.LocalStream).unpublish();
      mediaStream.getTracks().forEach((element) {
        element.stop();
      });
      await mediaStream.dispose();
    }
  }

  void preferLayer(ion.Layer layer) {
    if (remote) {
      (stream as ion.RemoteStream).preferLayer?.call(layer);
    }
  }

  void mute(String kind) {
    if (remote) {
      (stream as ion.RemoteStream).mute?.call(kind);
    }
  }

  void unmute(String kind) {
    if (remote) {
      (stream as ion.RemoteStream).unmute?.call(kind);
    }
  }

  void getStats(ion.Client client, MediaStreamTrack track) async {
    var bytesPrev;
    var timestampPrev;
    Timer.periodic(Duration(seconds: 1), (timer) async {
      var results = await client.getSubStats(track);
      results.forEach((report) {
        var now = report.timestamp;
        var bitrate;
        if ((report.type == 'ssrc' || report.type == 'inbound-rtp') &&
            report.values['mediaType'] == 'video') {
          var bytes = report.values['bytesReceived'];
          if (timestampPrev != null) {
            bitrate = (8 *
                    (WebRTC.platformIsWeb
                        ? bytes - bytesPrev
                        : (int.tryParse(bytes)! - int.tryParse(bytesPrev)!))) /
                (now - timestampPrev);
            bitrate = bitrate.floor();
          }
          bytesPrev = bytes;
          timestampPrev = now;
        }
        if (bitrate != null) {
          print('$bitrate kbps');
        }
      });
    });
  }
}
