import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ion/flutter_ion.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:uuid/uuid.dart';

class EchoTest extends StatefulWidget {
  @override
  _EchoTestState createState() => _EchoTestState();
}

class _EchoTestState extends State<EchoTest> {
  var localRenderer = RTCVideoRenderer();
  var remoteRenderer = RTCVideoRenderer();
  final Connector _connector = Connector('http://127.0.0.1:5551');
  final _room = 'ion-simulcast';
  RemoteStream? _remoteStream;
  RTC? _sub;
  int subBitrate = 0;
  late int layerIndex;
  var bytesPrev;
  var timestampPrev;

  @override
  void initState() {
    super.initState();
    layerIndex = 1;
  }

  void _handleConnect() async {
    await start_subscriber(_connector);
    await start_publisher(_connector);
  }

  Future<void> start_publisher(Connector connector) async {
    var rtc = RTC(connector);

    await rtc.connect();
    await rtc.join(_room, Uuid().v4(), JoinConfig());

    // publish LocalStream
    var localStream = await LocalStream.getUserMedia(
        constraints: Constraints.defaults
          ..simulcast = true
          ..resolution = 'hd');
    await rtc.publish(localStream);
    await localRenderer.initialize();
    localRenderer.srcObject = localStream.stream;
    setState(() {});
  }

  Future<void> start_subscriber(Connector connector) async {
    var rtc = RTC(connector);
    rtc.ontrack = (track, RemoteStream remoteStream) async {
      print('onTrack: remote stream => ${remoteStream.id}');
      if (track.kind == 'video') {
        await remoteRenderer.initialize();
        remoteRenderer.srcObject = remoteStream.stream;
        remoteRenderer.onResize = () {
          setState(() {});
        };
        setState(() {});
        Timer.periodic(Duration(seconds: 1), (_) {
          getStats(remoteStream.stream.getVideoTracks()[0]);
        });
        _remoteStream = remoteStream;
      }
    };

    await rtc.connect();
    await rtc.join(_room, Uuid().v4(), JoinConfig());
    _sub = rtc;
  }

  void getStats(MediaStreamTrack track) async {
    var results = await _sub?.getSubStats(track);
    results?.forEach((report) {
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
        setState(() {
          subBitrate = bitrate;
        });
      }
    });
  }

  void _selectSimulcastLayer(int? idx) {
    switch (idx) {
      case 1:
        _remoteStream?.preferLayer!(Layer.high);
        break;
      case 2:
        _remoteStream?.preferLayer!(Layer.medium);
        break;
      case 3:
        _remoteStream?.preferLayer!(Layer.low);
        break;
    }
    setState(() {
      layerIndex = idx!;
    });
  }

  @override
  Widget build(context) => MaterialApp(
      title: 'ion-sfu',
      home: Scaffold(
          appBar: AppBar(title: Text('Echo Test')),
          body: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  'Local ${localRenderer.videoWidth}x${localRenderer.videoHeight}'),
              Expanded(child: RTCVideoView(localRenderer)),
              SizedBox(
                height: 10,
              ),
              Text('Select Layer:', textAlign: TextAlign.center),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('high:'),
                  Radio(
                    value: 1,
                    groupValue: layerIndex,
                    onChanged: _selectSimulcastLayer,
                  ),
                  SizedBox(width: 20),
                  Text('medium:'),
                  Radio(
                    value: 2,
                    groupValue: layerIndex,
                    onChanged: _selectSimulcastLayer,
                  ),
                  Text('low:'),
                  Radio(
                    value: 3,
                    groupValue: layerIndex,
                    onChanged: _selectSimulcastLayer,
                  )
                ],
              ),
              Text(
                  'Remote   ${remoteRenderer.videoWidth}x${remoteRenderer.videoHeight}   $subBitrate kbps'),
              Expanded(child: RTCVideoView(remoteRenderer)),
              SizedBox(
                height: 10,
              ),
            ],
          )),
          floatingActionButton: FloatingActionButton(
              onPressed: _handleConnect, child: Icon(Icons.phone))));
}
