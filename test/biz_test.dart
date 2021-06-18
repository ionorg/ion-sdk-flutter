import 'dart:async';

import 'package:flutter_ion/flutter_ion.dart' as ion;
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

void main() async {
  var connector = ion.IonBaseConnector('http://127.0.0.1:5551');
  var biz = ion.IonAppBiz(connector);

  await biz.connect();

  var uid = Uuid().v4();
  var sid = 'test room1';

  test('test join', () async {
    biz.onJoin =  (bool success, String reason) {
      //expect(peer.uid, uid);
      //expect(peer.sid, sid);
    };

    biz.onPeerEvent = (ion.PeerEvent evt) {
       print(
          'sid ${evt.peer.sid}, peer ${evt.peer.uid} info ${evt.peer.info}, state ${evt.state}');
    };

    biz.join(
        sid: sid, uid: uid, info: <String, String>{'name': 'flutter_client'});

    //expect(success, true);
  });

  test('test leave', () async {
     biz.leave(uid);
  });

  await Future.delayed(Duration(seconds: 10));
}
