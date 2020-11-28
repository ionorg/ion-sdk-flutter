# Flutter sdk for ion

Flutter sdk for the Ion backend.

## Installation

Edit `pubspec.yaml` in your flutter projects.

Add

```yml
    flutter_ion: ^0.2.2
```

## Platform Support

* Android
* iOS
* macOS
* Web

## Usage

```dart
import 'package:flutter_ion/flutter_ion.dart' as ion;

// Connect to ion-sfu.
final signal = ion.JsonRPCSignal("ws://ion-sfu:7000/ws");

ion.Client client = await ion.Client.create(sid: "test session", signal: signal);

client.ontrack = (track, ion.RemoteStream stream) {
    /// mute a remote stream
    stream.mute();
    /// unmute a remote stream
    stream.unmute();

    if (track.kind == "video") {
       /// prefer a layer
       stream.preferLayer(ion.Layer.medium);
       
       /// render remote stream.
       /// remoteRenderer.srcObject = stream.stream;
    }
};

ion.LocalStream localStream = await ion.LocalStream.getUserMedia(
               constraints: ion.Constraints.defaults..simulcast = true);

/// render local stream.
/// localRenderer.srcObject = localStream.stream;

/// publish stream
await client.publish(localStream);

/// mute local straem
localStream.mute();

/// unmute local stream
localStream.unmute();

```
