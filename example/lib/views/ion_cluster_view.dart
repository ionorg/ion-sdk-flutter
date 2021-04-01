import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_ion/flutter_ion.dart' as ion;
import 'package:uuid/uuid.dart';

var url = 'http://localhost:5551';

class Peer {
  Peer(this.title, this.renderer, this.stream);
  MediaStream stream;
  String title;
  RTCVideoRenderer renderer;
}

class PubSubController extends GetxController {
  Map<String, Peer> plist = <String, Peer>{}.obs;

  @override
  @mustCallSuper
  void onInit() {
    super.onInit();
  }

  final ion.IonConnector _ion = ion.IonConnector(url: url);
  late ion.LocalStream? _localStream;
  final String _uuid = Uuid().v4();
  final String _room = 'test room';

  void join() async {
    _ion.onJoin = (bool success, String reason) async {
      print('onJoin success = $success, reason = $reason');

      if (success) {
        _localStream = await ion.LocalStream.getUserMedia(
            constraints: ion.Constraints.defaults..simulcast = false);
        await _ion.sfu!.publish(_localStream!);
        var renderer = RTCVideoRenderer();
        await renderer.initialize();
        renderer.srcObject = _localStream!.stream;
        plist[_localStream!.stream.id] =
            Peer('Local Stream', renderer, _localStream!.stream);
      }

      _ion.message(
          _uuid, 'all', <String, dynamic>{'text': 'hello from flutter'});
    };

    _ion.onLeave = (reason) {
      print('onLeave reason = $reason');
    };

    _ion.onPeerEvent = (ion.PeerEvent event) {
      print(
          'onPeerEvent state = ${event.state},  peer uid = ${event.peer.uid}, info = ${event.peer.info.toString()}');
    };

    _ion.onMessage = (ion.Message msg) {
      print(
          'onMessage from = ${msg.from},  to = ${msg.to}, data = ${msg.data}');
    };

    _ion.join(
        sid: _room,
        uid: _uuid,
        info: <String, String>{'name': 'flutter_client'});

    _ion.onTrack = (track, ion.RemoteStream remoteStream) async {
      if (track.kind == 'video') {
        print('onTrack: remote stream => ${remoteStream.id}');
        var renderer = RTCVideoRenderer();
        await renderer.initialize();
        renderer.srcObject = remoteStream.stream;
        plist[remoteStream.id] = Peer('Remote', renderer, remoteStream.stream);
      }
    };

    _ion.onStreamEvent = (ion.StreamEvent event) {
      print(
          'onStreamEvent state = ${event.state}, sid = ${event.sid}, uid = ${event.uid},  streams = ${event.streams.toString()}');
      switch (event.state) {
        case ion.StreamState.ADD:
          if (plist.isNotEmpty) {
            var peer = plist[event.streams[0].id];
            if (peer != null) {
              //peer.title = uid;
            }
          }
          break;
        case ion.StreamState.REMOVE:
          if (plist.isNotEmpty) {
            var peer = plist[event.streams[0].id];
            if (peer != null) {
              plist.remove(event.streams[0].id);
            }
          }
          break;
        case ion.StreamState.NONE:
          break;
      }
    };
  }

  void unpublish() async {
    await _localStream!.unpublish();
    _localStream!.stream.getTracks().forEach((element) {
      element.stop();
    });
    await _localStream!.stream.dispose();
    _localStream = null;
  }
}

class IonClusterView extends StatelessWidget {
  final PubSubController c = Get.put(PubSubController());

  Widget getItemView(Peer item) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${item.title}:\n${item.stream.id}',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            Expanded(
              child: RTCVideoView(item.renderer,
                  objectFit:
                      RTCVideoViewObjectFit.RTCVideoViewObjectFitContain),
            ),
          ],
        ));
  }

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(title: Text('pub sub test')),
        body: Container(
            padding: EdgeInsets.all(10.0),
            child: Obx(() => GridView.builder(
                shrinkWrap: true,
                itemCount: c.plist.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    childAspectRatio: 1.0),
                itemBuilder: (BuildContext context, int index) {
                  return getItemView(c.plist.entries.elementAt(index).value);
                }))),
        floatingActionButton: FloatingActionButton(
            onPressed: c.join, child: Icon(Icons.video_call)));
  }
}
