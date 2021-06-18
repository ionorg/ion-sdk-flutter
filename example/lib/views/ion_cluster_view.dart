import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_ion/flutter_ion.dart' as ion;
import 'package:uuid/uuid.dart';

import 'common.dart';

class PubSubController extends GetxController {
  Map<String, Participant> plist = <String, Participant>{}.obs;
  Rx<bool> connected = Rx(false);
  ion.IonBaseConnector? _connector;
  ion.IonAppBiz? _biz;
  ion.IonSDKSFU? _sfu;
  ion.LocalStream? _localStream;

  final String _uuid = Uuid().v4();
  final String _room = 'test room';
  final Map<String, String> _info = {'name': 'flutter_client'};
  final String _token = 'token123123123';

  void join() async {
    if (_biz != null || _sfu != null) {
      return;
    }
    _connector ??= ion.IonBaseConnector(Config.ion_cluster_url, token: _token);
    _biz = ion.IonAppBiz(_connector!);
    _sfu = ion.IonSDKSFU(_connector!);

    _sfu?.onspeaker = (Map<String, dynamic> list) {
      print('onspeaker: $list');
    };

    _sfu?.ontrack = (track, ion.RemoteStream remoteStream) async {
      if (track.kind == 'video') {
        print('onTrack: remote stream => ${remoteStream.id}');
        var renderer = RTCVideoRenderer();
        await renderer.initialize();
        renderer.srcObject = remoteStream.stream;
        plist[remoteStream.stream.id] =
            Participant('Remote', renderer, remoteStream.stream);
      }
    };

    _biz?.onJoin = (bool success, String reason) async {
      print('onJoin success = $success, reason = $reason');

      if (success) {
        await _sfu?.connect();
        await _sfu?.join(_room, _uuid);

        _localStream = await ion.LocalStream.getUserMedia(
            constraints: Config.defaultConstraints);

        await _sfu?.publish(_localStream!);
        var renderer = RTCVideoRenderer();
        await renderer.initialize();
        renderer.srcObject = _localStream!.stream;
        plist[_localStream!.stream.id] =
            Participant('Local Stream', renderer, _localStream!.stream);
      }

      _biz?.message(
          _uuid, 'all', <String, dynamic>{'text': 'hello from flutter'});
    };

    _biz?.onLeave = (reason) {
      print('onLeave reason = $reason');
    };

    _biz?.onPeerEvent = (ion.PeerEvent event) {
      print(
          'onPeerEvent state = ${event.state},  peer uid = ${event.peer.uid}, info = ${event.peer.info.toString()}');
    };

    _biz?.onMessage = (ion.Message msg) {
      print(
          'onMessage from = ${msg.from},  to = ${msg.to}, data = ${msg.data}');
    };

    _biz?.onStreamEvent = (ion.StreamEvent event) {
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
          if (plist.isNotEmpty && event.streams.isNotEmpty) {
            plist.remove(event.streams[0].id);
          }
          break;
        case ion.StreamState.NONE:
          break;
      }
    };

    await _biz?.connect();

    _biz?.join(sid: _room, uid: _uuid, info: _info);

    connected.value = true;
  }

  void leave() async {
    if (_connector == null && _biz == null && _sfu == null) {
      return;
    }

    await _localStream!.unpublish();
    _localStream!.stream.getTracks().forEach((element) {
      element.stop();
    });
    await _localStream!.stream.dispose();
    _localStream = null;

    plist.forEach((title, element) {
      element.renderer.srcObject = null;
    });
    plist.clear();
    _connector?.close();
    _biz = null;
    _sfu = null;
    _connector = null;
    connected.value = false;
  }
}

class IonClusterView extends StatelessWidget {
  final PubSubController c = Get.put(PubSubController());

  Widget getItemView(Participant item) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${item.title}: ${item.stream.id.substring(0, 8)}',
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
        appBar: AppBar(title: Text('ion cluster pub/sub test')),
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
            onPressed: () {
              if (!c.connected.value) {
                c.join();
              } else {
                c.leave();
              }
            },
            child: Icon(Icons.video_call)));
  }
}
