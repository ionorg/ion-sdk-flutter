import 'dart:convert';
import 'dart:io';

import 'package:flutter_ion/src/utils.dart';
import 'package:test/test.dart';

void main() async {
  test('NormalSdp', _testNormalSdp);
}

void _testNormalSdp() async {
  var sdp = await File('./test/webrtc.sdp').readAsString();
  var capSel = CodecCapabilitySelector(sdp);
  var acaps = capSel.getCapabilities('audio');
  acaps!.codecs = acaps.codecs
      .where((e) => (e['codec'] as String).toLowerCase() == 'opus')
      .toList();
  acaps.setCodecPreferences('audio', acaps.codecs);
  capSel.setCapabilities(acaps);

  var vcaps = capSel.getCapabilities('video');
  vcaps!.codecs = vcaps.codecs.where((e) {
    if ((e['codec'] as String).toLowerCase() == 'h264' ||
        (e['codec'] as String).toLowerCase() == 'rtx') {
      //e['payload'] = 170;
      return true;
    }
    return false;
  }).toList();
  vcaps.setCodecPreferences('audio', vcaps.codecs);
  capSel.setCapabilities(vcaps);

  var jstr = JsonEncoder.withIndent('  ').convert(capSel.session);
  print('session => $jstr');
  print('sdp => ${capSel.sdp()}');
}
