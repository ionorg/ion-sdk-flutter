import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_ion/flutter_ion.dart' as ion;

class Controller extends GetxController {
  Rx<RTCVideoRenderer> localRenderer = RTCVideoRenderer().obs;
  Rx<RTCVideoRenderer> remoteRenderer = RTCVideoRenderer().obs;

  @override
  @mustCallSuper
  void onInit() {
    super.onInit();
    localRenderer.value.initialize();
    remoteRenderer.value.initialize();
  }

  set localSrcObject(MediaStream stream) {
    localRenderer.value.srcObject = stream;
    localRenderer.refresh();
  }

  set remoteSrcObject(MediaStream stream) {
    remoteRenderer.value.srcObject = stream;
    remoteRenderer.refresh();
  }
}

class PubSubTestView extends StatelessWidget {
  final Controller c = Get.put(Controller());
  ion.Signal _signal = ion.JsonRPCSignal("ws://192.168.1.2:7000/ws");
  ion.Client _client;
  ion.LocalStream _localStream;

  void _echotest() async {
    if (_client == null) {
      _client =
          await ion.Client.create(sid: "pub-sub-session", signal: _signal);
      _localStream = await ion.LocalStream.getUserMedia(
          constraints: ion.Constraints.defaults..simulcast = false);
      await _client.publish(_localStream);

      _client.ontrack = (track, ion.RemoteStream stream) {
        if (track.kind == 'video') {
          print('ontrack: stream => ${stream.id}');
          c.remoteSrcObject = stream.stream;
          Timer(Duration(seconds: 4), () {
            stream.preferLayer(ion.Layer.low);
          });
        }
      };

      c.localSrcObject = _localStream.stream;
    } else {
      await _localStream.unpublish();
      _localStream.stream.getTracks().forEach((element) {
        element.dispose();
      });
      _localStream.stream.dispose();
      _localStream = null;
      _client.close();
      _client = null;
      c.localSrcObject = null;
    }
  }

  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(title: Text("pub sub test")),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Local"),
          Obx(() => Expanded(child: RTCVideoView(c.localRenderer.value))),
          Text("Remote"),
          Obx(() => Expanded(child: RTCVideoView(c.remoteRenderer.value)))
        ],
      )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.video_call), onPressed: _echotest));
}
