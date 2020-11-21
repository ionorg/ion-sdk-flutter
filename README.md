# Flutter sdk for ion

Flutter sdk for the Ion backend.

## Installation

Edit `pubspec.yaml` in your flutter projects.

Add
```yml
    flutter_ion: ^0.2.0
```

## Usage

```dart
import 'package:flutter_ion/flutter_ion.dart' as ion;

// Connect to ion-sfu.
final signalLocal = ion.JsonRPCSignal("ws://123.45.67.89:7000/ws");
final signalRemote = ion.JsonRPCSignal("ws://123.45.67.89:7000/ws");

ion.Client clientPub = await ion.Client.create(sid: "test session", signal: signalLocal);

ion.LocalStream localStream = await ion.LocalStream.getUserMedia(
               constraints: ion.Constraints.defaults..simulcast = false);
          
await clientPub.publish(localStream);

/// render local stream.
/// localSrcObject = localStream.stream;

ion.Client clientSub = await ion.Client.create(sid: "test session", signal: signalRemote);
clientSub.ontrack = (track, ion.RemoteStream stream) {
  if (track.kind == 'video') {
  print('ontrack: stream => ${stream.id}');
  /// remoteSrcObject = stream.stream;
  
  stream.preferLayer(ion.Layer.low);
};

```
