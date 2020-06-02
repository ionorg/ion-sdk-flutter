# Flutter sdk for ion

Flutter sdk for the Ion backend.

## Installation

Edit `pubspec.yaml` in your flutter projects.

Add
```yml
    flutter_ion: ^0.1.2
```

## Usage

```dart
import 'package:flutter_ion/flutter_ion.dart';

...
var url = 'https://$host:8443/ws';
Client client = Client(url);

// Setup handlers
client.on('peer-join', (rid, id, info) async {});

client.on('peer-leave', (rid, id) async {});
  
client.on('transport-open', () {}));

client.on('transport-closed', () {});

client.on('stream-add', (rid, mid, info, tracks) async {
      // handle stream-add
  });

client.on('stream-remove', (rid, mid) async {
      // handle stream-remove
  });
    
client.on('broadcast', (rid, uid, info) async {
      // handle broadcast
  });

// Connect to ion biz node.
await client.connect();

// Join a room
await _client.join(rid, {'name': 'Bob'});

// Leave current room
await client.leave();

// Publish local stream
var resolution = 'vga';
var bandwidth =  '512';
var codec = 'vp8';
var localStream = await client.publish(true, true, false, codec, bandwidth, resolution);

// Subscribe to a remote stream
var bandwidth = '512';
var remoteStream = await client.subscribe(rid, mid, tracks, bandwidth);

// Broadcast a payload to the room
client.broadcast(rid, payload);

// Close client connection
await client.close();
```
