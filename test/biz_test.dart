import 'dart:async';

import 'package:flutter_ion/flutter_ion.dart' as ion;
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

void main() async {
  var biz = ion.BizClient('http://127.0.0.1:5551');
  biz.connect();

  var uid = Uuid().v4();
  var sid = 'test room1';

  test('test join', () async {
    biz.onPeerEvent = (state, peer) {
      print(
          'sid ${peer.sid}, peer ${peer.uid} info ${peer.info}, state $state');
      //expect(peer.uid, uid);
      //expect(peer.sid, sid);
    };
    var success = await biz.join(
        sid: sid, uid: uid, info: <String, String>{'name': 'flutter_client'});

    expect(success, true);
  });

  test('test leave', () async {
    await biz.leave(uid);
  });

  await Future.delayed(Duration(seconds: 10));
}
