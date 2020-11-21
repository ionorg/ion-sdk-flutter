import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_ion/flutter_ion.dart' as ion;

void main() {
  runApp(GetMaterialApp(
    home: Home(),
  ));
}

class Controller extends GetxController {
  Rx<RTCVideoRenderer> localRenderer = RTCVideoRenderer().obs;
  Rx<RTCVideoRenderer> remoteRenderer = RTCVideoRenderer().obs;
  Future<void> setLocalSrcObject(MediaStream stream) async {
    var old = localRenderer.value;
    await old.initialize();
    old.srcObject = stream;
    localRenderer.value = old;
  }

  Future<void> setRemoteSrcObject(MediaStream stream) async {
    var old = remoteRenderer.value;
    await old.initialize();
    old.srcObject = stream;
    remoteRenderer.value = old;
  }
}

class Home extends StatelessWidget {
  final Controller c = Get.put(Controller());
  final signalLocal = ion.JsonRPCSignal("ws://localhost:7000/ws");
  ion.Client clientLocal;

  Future<ion.LocalStream> connect() async {
    if (clientLocal == null) {
      clientLocal =
          await ion.Client.create(sid: "test session", signal: signalLocal);
      var localStream = await ion.LocalStream.getUserMedia(
          constraints: ion.Constraints.defaults..simulcast = true);
      clientLocal.publish(localStream);
      return localStream;
    }
    return null;
  }

  void _echotest() async {
    var localStream = await connect();
    await c.setLocalSrcObject(localStream.stream);
    clientLocal.ontrack = (track, ion.RemoteStream stream) {
      print('ontrack: stream => ${stream.id}');
      if (track.kind == 'video') {
        c.setRemoteSrcObject(stream.stream);
      }
    };
  }

  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(title: Text("ion flutter echotest")),
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
