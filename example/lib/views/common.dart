import 'package:flutter_ion/flutter_ion.dart' as ion;
import 'package:flutter_webrtc/flutter_webrtc.dart';

class Config {
  static bool simulcast = true;
  static String resolution = 'hd';
  static String codec = 'vp8';
  static String host = '127.0.0.1';
  static String get ion_cluster_url => 'http://' + host + ':5551';
  static String get ion_sfu_url => 'http://' + host + ':9090';
  static ion.Constraints get defaultConstraints => ion.Constraints.defaults
    ..simulcast = simulcast
    ..resolution = resolution
    ..codec = codec;
}

class Participant {
  Participant(this.title, this.renderer, this.stream);
  MediaStream stream;
  String title;
  RTCVideoRenderer renderer;
}
