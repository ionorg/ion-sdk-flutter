import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_ion/src/connector/connector.dart' as ion;
import 'package:uuid/uuid.dart';

import 'common.dart';

class PubSubController extends GetxController {
  Map<String, Participant> participants = <String, Participant>{}.obs;
  Rx<bool> connected = Rx(false);
  ion.IonBaseConnector? _connector;
  ion.IonSDKRTC? _sfu;

  final String _uuid = Uuid().v4();
  final String _room = 'test room';
  final String _token = 'token123123123';

  void join() async {
    if (_sfu != null) {
      return;
    }
    _connector ??= ion.IonBaseConnector(Config.ion_cluster_url, token: _token);
    _sfu = ion.IonSDKRTC(_connector!);

    _sfu?.onspeaker = (Map<String, dynamic> list) {
      print('onspeaker: $list');
    };

    _sfu?.ontrack = (track, ion.RemoteStream remoteStream) async {
      if (track.kind == 'video') {
        print('onTrack: remote stream => ${remoteStream.id}');
        participants[remoteStream.stream.id] = Participant(remoteStream, true)
          ..initialize();
      }
    };

    _sfu?.ontrackevent = (ion.TrackEvent event) {
      print(
          'ontrackevent state = ${event.state},  uid = ${event.uid},  tracks = ${event.tracks}');
      switch (event.state) {
        case ion.TrackState.REMOVE:
          if (event.tracks.isNotEmpty) {
            participants.remove(event.tracks[0].stream_id);
          }
          break;
        case ion.TrackState.ADD:
        case ion.TrackState.NONE:
          break;
      }
    };

    await _sfu?.connect();
    await _sfu?.join(_room, _uuid, {});
    var localStream = await ion.LocalStream.getUserMedia(
            constraints: Config.defaultConstraints);
    await _sfu?.publish(localStream);

    participants[localStream.stream.id] = Participant(localStream, false)
          ..initialize();
    connected.value = true;
  }

  void leave() async {
    if (_connector == null && _sfu == null) {
      return;
    }
    participants.forEach((title, element) {
      element.dispose();
    });
    participants.clear();
    _connector?.close();
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
                item.title,
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
        appBar: AppBar(title: Text('ion-cluster pub/sub test')),
        body: Container(
            padding: EdgeInsets.all(10.0),
            child: Obx(() => GridView.builder(
                shrinkWrap: true,
                itemCount: c.participants.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    childAspectRatio: 1.0),
                itemBuilder: (BuildContext context, int index) {
                  return getItemView(
                      c.participants.entries.elementAt(index).value);
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
