import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_ion/flutter_ion.dart' as ion;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    home: Home(),
  ));
}

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

class Home extends StatelessWidget {
  final Controller c = Get.put(Controller());
  final signalLocal = ion.JsonRPCSignal("ws://localhost:7000/ws");
  ion.Client _client;
  ion.LocalStream _localStream;

  void _echotest() async {
    if (_client == null) {
      _client =
          await ion.Client.create(sid: "test session", signal: signalLocal);

      _localStream = await ion.LocalStream.getUserMedia(
          constraints: ion.Constraints.defaults..simulcast = true);
      _client.publish(_localStream);

      c.localSrcObject = _localStream.stream;
      _client.ontrack = (track, ion.RemoteStream stream) {
        if (track.kind == 'video') {
          print('ontrack: stream => ${stream.id}');
          c.remoteSrcObject = stream.stream;
        }
      };
    }
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
