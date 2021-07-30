import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_ion/flutter_ion.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _GetMyAppState createState() => _GetMyAppState();
}

class _GetMyAppState extends State<MyApp> {
  final _localRenderer = RTCVideoRenderer();
  final List<RTCVideoRenderer> _remoteRenderers = <RTCVideoRenderer>[];
  final IonBaseConnector _connector = IonBaseConnector('http://localhost:5551');
  late IonSDKRTC _rtc;
  @override
  void initState() {
    super.initState();
    connect();
  }

  void connect() async {
    _rtc = IonSDKRTC(_connector);
    _rtc.onspeaker = (Map<String, dynamic> list) {
      print('onspeaker: $list');
    };

    _rtc.ontrack = (track, RemoteStream remoteStream) async {
      print('onTrack: remote stream => ${remoteStream.id}');
      if (track.kind == 'video') {
        var renderer = RTCVideoRenderer();
        await renderer.initialize();
        renderer.srcObject = remoteStream.stream;
        setState(() {
          _remoteRenderers.add(renderer);
        });
      }
    };

    _rtc.ontrackevent = (TrackEvent event) {
      print(
          'ontrackevent state = ${event.state},  uid = ${event.uid},  tracks = ${event.tracks}');
      if (event.state == TrackState.REMOVE) {
        setState(() {
          _remoteRenderers.removeWhere(
              (element) => element.srcObject?.id == event.tracks[0].stream_id);
        });
      }
    };

    await _rtc.connect();
    await _rtc.join('test room', 'test uid', JoinConfig());

    await _localRenderer.initialize();
    // publish LocalStream
    var localStream =
        await LocalStream.getUserMedia(constraints: Constraints.defaults);
    await _rtc.publish(localStream);
    setState(() {
      _localRenderer.srcObject = localStream.stream;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ion-sfu',
        home: Scaffold(
            appBar: AppBar(
              title: Text('ion-sfu'),
            ),
            body: OrientationBuilder(builder: (context, orientation) {
              return Column(
                children: [
                  Row(
                    children: [Text('Local Video')],
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: 160,
                          height: 120,
                          child: RTCVideoView(_localRenderer, mirror: true))
                    ],
                  ),
                  Row(
                    children: [Text('Remote Video')],
                  ),
                  Row(
                    children: [
                      ..._remoteRenderers.map((remoteRenderer) {
                        return SizedBox(
                            width: 160,
                            height: 120,
                            child: RTCVideoView(remoteRenderer));
                      }).toList(),
                    ],
                  ),
                ],
              );
            })));
  }
}
