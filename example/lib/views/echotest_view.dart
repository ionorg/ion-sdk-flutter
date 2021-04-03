import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_ion/flutter_ion.dart' as ion;

class EchoTestController extends GetxController {
  Rx<RTCVideoRenderer> localRenderer = RTCVideoRenderer().obs;
  Rx<RTCVideoRenderer> remoteRenderer = RTCVideoRenderer().obs;
  late ion.Signal _signalLocal;
  late ion.Signal _signalRemote;
  late ion.Client? _clientPub;
  late ion.Client? _clientSub;
  late ion.LocalStream? _localStream;
  late ion.RemoteStream? _remoteStream;
  late Timer _timer;

  RxInt subBitrate = 0.obs;

  void preferLayer(ion.Layer layer) => _remoteStream?.preferLayer!(layer);

  @override
  @mustCallSuper
  void onInit() {
    super.onInit();
    localRenderer.value.initialize();
    localRenderer.value.onResize = () => localRenderer.refresh();
    remoteRenderer.value.initialize();
    remoteRenderer.value.onResize = () => remoteRenderer.refresh();
  }

  Future<void> echotest() async {
    try {
      if (_clientPub == null) {
        _signalLocal = ion.GRPCWebSignal('http://localhost:9090');

        _clientPub = await ion.Client.create(
            sid: 'test session', uid: 'client id01', signal: _signalLocal);

        _localStream = await ion.LocalStream.getUserMedia(
            constraints: ion.Constraints.defaults..simulcast = true);
        await _clientPub?.publish(_localStream!);

        localSrcObject = _localStream!.stream;
      } else {
        await _localStream!.unpublish();
        _localStream!.stream.getTracks().forEach((element) {
          element.dispose();
        });
        await _localStream!.stream.dispose();
        _localStream = null;
        _clientPub!.close();
        _clientPub = null;
        localSrcObject = null;
      }

      if (_clientSub == null) {
        _signalRemote = ion.GRPCWebSignal('http://localhost:9090');
        _clientSub = await ion.Client.create(
            sid: 'test session', uid: 'client id02', signal: _signalRemote);
        _clientSub?.ontrack = (track, ion.RemoteStream stream) {
          if (track.kind == 'video') {
            print('ontrack: stream => ${stream.id}');
            remoteSrcObject = stream.stream;
            _remoteStream = stream;
            var bytesPrev;
            var timestampPrev;
            _timer = Timer.periodic(Duration(seconds: 1), (timer) {
              getStats(track, bytesPrev, timestampPrev);
            });
          }
        };
      } else {
        _clientSub?.close();
        _clientSub = null;
        remoteSrcObject = null;
        _timer.cancel();
      }
    } catch (e) {
      print(e);
    }
  }

  set localSrcObject(MediaStream? stream) {
    localRenderer.value.srcObject = stream;
    localRenderer.refresh();
  }

  set remoteSrcObject(MediaStream? stream) {
    remoteRenderer.value.srcObject = stream;
    remoteRenderer.refresh();
  }

  void getStats(MediaStreamTrack track, bytesPrev, timestampPrev) async {
    var results = await _clientSub?.getSubStats(track);
    results!.forEach((report) {
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
        subBitrate.value = bitrate;
        //print('$bitrate kbps');
      }
    });
  }
}

class EchoTestView extends StatelessWidget {
  final EchoTestController c = Get.put(EchoTestController());

  void _simulcastLayerSelect(ion.Layer layer) {
    c.preferLayer(layer);
    Get.back();
  }

  void _showBottomSheet() {
    Get.bottomSheet(
      Container(
        child: Wrap(
          children: <Widget>[
            ListTile(
              title:
                  Text('Select Simulcast Layer:', textAlign: TextAlign.center),
            ),
            ListTile(
                leading: Icon(Icons.hd),
                title: Text('high (720p)'),
                onTap: () => _simulcastLayerSelect(ion.Layer.high)),
            ListTile(
              leading: Icon(Icons.sd),
              title: Text('medium (360p)'),
              onTap: () => _simulcastLayerSelect(ion.Layer.medium),
            ),
            ListTile(
              leading: Icon(Icons.sd),
              title: Text('low (180p)'),
              onTap: () => _simulcastLayerSelect(ion.Layer.low),
            ),
            ListTile(
              leading: Icon(Icons.videocam_off_rounded),
              title: Text('none (muted)'),
              onTap: () => _simulcastLayerSelect(ion.Layer.none),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(title: Text('echotest')),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => Text(
              'Local ${c.localRenderer.value.videoWidth}x${c.localRenderer.value.videoHeight}')),
          Obx(() => Expanded(child: RTCVideoView(c.localRenderer.value))),
          Obx(() => Text(
              'Remote   ${c.remoteRenderer.value.videoWidth}x${c.remoteRenderer.value.videoHeight}   ${c.subBitrate.value} kbps')),
          Obx(() => Expanded(child: RTCVideoView(c.remoteRenderer.value))),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            child: Text('Simulcast'),
            onPressed: _showBottomSheet,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.phone), onPressed: c.echotest));
}
