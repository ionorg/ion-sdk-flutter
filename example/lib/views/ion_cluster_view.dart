import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_ion/flutter_ion.dart' as ion;
import 'package:uuid/uuid.dart';

var url = 'http://127.0.0.1:5551';

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

  final ion.BizClient _biz = ion.BizClient(url);
  final ion.Signal _signal = ion.GRPCWebSignal(url);
  ion.Client _client;
  ion.LocalStream _localStream;
  final String _uuid = Uuid().v4();
  final String _room = 'test room';

  void join() async {

    _biz.onJoin = (success, reason) {
      print('onJoin success = $success, reason = $reason');
    };

    _biz.onLeave = (reason) {
      print('onLeave reason = $reason');
    };

    _biz.onPeerEvent = (ion.PeerState state, ion.Peer peer) {
      print('onPeerEvent state = $state,  peer = ${peer.toString()}');
    };

    _biz.onMessage = (String from, String to, dynamic data) {
      print('onPeerEvent from = $from,  to = $to, data = $data');
    };

    _biz.connect();
    var success = await _biz.join(
        sid: _room,
        uid: _uuid,
        info: <String, String>{'name': 'flutter_client'});
    if (success) {
      startStream();
    }
  }

  void startStream() async {
    if (_client == null) {
      _client =
          await ion.Client.create(sid: _room, uid: _uuid, signal: _signal);
      _localStream = await ion.LocalStream.getUserMedia(
          constraints: ion.Constraints.defaults..simulcast = false);
      await _client.publish(_localStream);

      _client.ontrack = (track, ion.RemoteStream remoteStream) async {
        if (track.kind == 'video') {
          print('ontrack: remote stream => ${remoteStream.id}');
          var renderer = RTCVideoRenderer();
          await renderer.initialize();
          renderer.srcObject = remoteStream.stream;
          plist[remoteStream.id] =
              Peer('Remote', renderer, remoteStream.stream);
        }
      };

      _biz.onStreamEvent = (state, sid, uid, streams) {
        print('onStreamEvent state = $state, sid = $sid, uid = $uid,  streams = ${streams.toString()}');
        switch (state) {
          case ion.StreamState.ADD:
            var peer = plist[streams[0].id];
            if (peer != null) {
              //peer.title = uid;
            }
            break;
          case ion.StreamState.REMOVE:
            var peer = plist[streams[0].id];
            if (peer != null) {
              plist.remove(streams[0].id);
            }
            break;
        }
      };

      var renderer = RTCVideoRenderer();
      await renderer.initialize();
      renderer.srcObject = _localStream.stream;
      plist[_localStream.stream.id] =
          Peer('Remote', renderer, _localStream.stream);
    } else {
      await _localStream.unpublish();
      _localStream.stream.getTracks().forEach((element) {
        element.stop();
      });
      await _localStream.stream.dispose();
      _localStream = null;
      _client.close();
      _client = null;
    }
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
