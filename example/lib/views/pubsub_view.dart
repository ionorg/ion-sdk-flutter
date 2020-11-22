import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_ion/flutter_ion.dart' as ion;

class PubSubController extends GetxController {
  Rx<RTCVideoRenderer> localRenderer = RTCVideoRenderer().obs;
  Rx<RTCVideoRenderer> remoteRenderer = RTCVideoRenderer().obs;

  @override
  @mustCallSuper
  void onInit() {
    super.onInit();
    localRenderer.value.initialize();
    remoteRenderer.value.initialize();
  }

  ion.Signal _signal = ion.JsonRPCSignal("ws://192.168.1.2:7000/ws");
  ion.Client _client;
  ion.LocalStream _localStream;

  void pubsub() async {
    if (_client == null) {
      _client =
          await ion.Client.create(sid: "pub-sub-session", signal: _signal);
      _localStream = await ion.LocalStream.getUserMedia(
          constraints: ion.Constraints.defaults..simulcast = false);
      await _client.publish(_localStream);

      _client.ontrack = (track, ion.RemoteStream stream) {
        if (track.kind == 'video') {
          print('ontrack: stream => ${stream.id}');
          remoteSrcObject = stream.stream;
          Timer(Duration(seconds: 4), () {
            stream.preferLayer(ion.Layer.low);
          });
        }
      };

      localSrcObject = _localStream.stream;
    } else {
      await _localStream.unpublish();
      _localStream.stream.getTracks().forEach((element) {
        element.dispose();
      });
      _localStream.stream.dispose();
      _localStream = null;
      _client.close();
      _client = null;
      localSrcObject = null;
    }
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
  final PubSubController c = Get.put(PubSubController());

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
          child: Icon(Icons.video_call), onPressed: c.pubsub));
}
