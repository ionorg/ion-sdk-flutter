import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_ion/flutter_ion.dart' as ion;

final signalLocal = ion.JsonRPCSignal("ws://localhost:7000/ws");
final signalRemote = ion.JsonRPCSignal("ws://localhost:7000/ws");
ion.Client clientLocal;

void connect() async {
  if (clientLocal == null) {
    clientLocal =
        await ion.Client.create(sid: "test session", signal: signalLocal);
  }
}

void main() {
  runApp(GetMaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  var count = 0.obs;
  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(title: Text("ion sdk flutter example")),
      body: Center(child: Obx(() => Text("Clicks: ${count.string}"))),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            connect();
            count.value++;
          }));
}
