import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_ion/flutter_ion.dart' as ion;
import 'package:uuid/uuid.dart';

import 'common.dart';

class PubSubController extends GetxController {
  List<Participant> participants = <Participant>[].obs;
  late ion.IonBaseConnector _connector;
  ion.IonSDKSFU? _rtc;
  final String _uid = Uuid().v4();

  @override
  @mustCallSuper
  void onInit() {
    super.onInit();
    _connector = ion.IonBaseConnector(Config.ion_sfu_url);
  }

  void pubsub() async {
    if (_rtc == null) {
      _rtc = new ion.IonSDKSFU(_connector);
      _rtc!.ontrack = (track, ion.RemoteStream remoteStream) async {
        if (track.kind == 'video') {
          print('ontrack: remote stream => ${remoteStream.id}');
          participants.add(Participant(remoteStream, true)..initialize());
        }
      };
      await _rtc!.connect();
      await _rtc!.join('test session', _uid);
      var localStream = await ion.LocalStream.getUserMedia(
          constraints: Config.defaultConstraints);
      await _rtc!.publish(localStream);
      participants.add(Participant(localStream, false)..initialize());
    } else {
      _rtc?.close();

      participants.forEach((element) {
        element.dispose();
      });

      participants.clear();
      _rtc = null;
    }
  }
}

class PubSubTestView extends StatelessWidget {
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
        appBar: AppBar(title: Text('ion-sfu pub/sub test')),
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
                  return getItemView(c.participants[index]);
                }))),
        floatingActionButton: FloatingActionButton(
            onPressed: c.pubsub, child: Icon(Icons.video_call)));
  }
}
