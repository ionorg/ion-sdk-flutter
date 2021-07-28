import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_ion/flutter_ion.dart' as ion;

import 'common.dart';

class EchoTestController extends GetxController {
  Rx<RTCVideoRenderer> localRenderer = RTCVideoRenderer().obs;
  Rx<RTCVideoRenderer> remoteRenderer = RTCVideoRenderer().obs;
  RxInt subBitrate = 0.obs;

  ion.Signal? _signalLocal;
  ion.Signal? _signalRemote;
  ion.Client? _clientPub;
  ion.Client? _clientSub;
  ion.LocalStream? _localStream;
  ion.RemoteStream? _remoteStream;
  Timer? _timer;

  final String _sid = 'test session';
  final String _uid1 = 'client 01';
  final String _uid2 = 'client 02';

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
        _signalLocal ??= ion.GRPCWebSignal(Config.ion_sfu_url);
        _clientPub = await ion.Client.create(
            sid: _sid, uid: _uid1, signal: _signalLocal!);
        _localStream = await ion.LocalStream.getUserMedia(
            constraints: Config.defaultConstraints);
        await _clientPub?.publish(_localStream!);

        localSrcObject = _localStream!.stream;
      } else {
        await _localStream!.unpublish();
        _localStream!.stream.getTracks().forEach((element) {
          element.stop();
        });
        await _localStream!.stream.dispose();
        _localStream = null;
        _clientPub!.close();
        _clientPub = null;
        localSrcObject = null;
      }

      if (_clientSub == null) {
        _signalRemote ??= ion.GRPCWebSignal(Config.ion_sfu_url);
        _clientSub = await ion.Client.create(
            sid: _sid, uid: _uid2, signal: _signalRemote!);
        _clientSub?.ontrack = (track, ion.RemoteStream stream) {
          if (track.kind == 'video') {
            print('ontrack: stream => ${stream.id}');
            remoteSrcObject = stream.stream;
            _remoteStream = stream;
            getStats(track);
          }
        };
        _clientSub?.onspeaker = (Map<String, dynamic> speakers) {
          print('onspeaker: $speakers');
        };
      } else {
        _clientSub?.close();
        _clientSub = null;
        remoteSrcObject = null;
        _timer?.cancel();
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

  void getStats(MediaStreamTrack track) async {
    var bytesPrev;
    var timestampPrev;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
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
      appBar: AppBar(title: Text('ion-sfu echo test')),
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
            onPressed: _showBottomSheet,
            child: Text('Simulcast'),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: c.echotest, child: Icon(Icons.phone)));
}
