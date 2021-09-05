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
  late ion.IonBaseConnector _baseConnector;
  ion.IonSDKSFU? _pub;
  ion.IonSDKSFU? _sub;
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
    _baseConnector = ion.IonBaseConnector(Config.ion_sfu_url);
  }

  Future<void> echotest() async {
    try {
      if (_pub == null) {
        _pub = ion.IonSDKSFU(_baseConnector);
        await _pub?.connect();
        await _pub?.join(_sid, _uid1);
        _localStream = await ion.LocalStream.getUserMedia(
            constraints: Config.defaultConstraints);
        await _pub?.publish(_localStream!);
        localSrcObject = _localStream!.stream;
      } else {
        await _localStream!.unpublish();
        _localStream!.stream.getTracks().forEach((element) {
          element.stop();
        });
        await _localStream!.stream.dispose();
        _localStream = null;
        _pub!.close();
        _pub = null;
        localSrcObject = null;
      }

      if (_sub == null) {
        _sub = ion.IonSDKSFU(_baseConnector);
        _sub?.ontrack = (track, ion.RemoteStream stream) {
          if (track.kind == 'video') {
            print('ontrack: stream => ${stream.id}');
            remoteSrcObject = stream.stream;
            _remoteStream = stream;
            getStats(track);
          }
        };
        _sub?.onspeaker = (Map<String, dynamic> speakers) {
          print('onspeaker: $speakers');
        };

        await _sub?.connect();
        await _sub?.join(_sid, _uid2);
      } else {
        _sub?.close();
        _sub = null;
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
      var results = await _sub?.getSubStats(track);
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
          ElevatedButton(
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
