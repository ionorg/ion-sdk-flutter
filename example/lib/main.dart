import 'dart:core';

import 'package:flutter/material.dart';

import 'views/echo_test.dart';
import 'views/pub_sub.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class RouteItem {
  RouteItem({
    required this.title,
    required this.subtitle,
    required this.push,
  });

  final String title;
  final String subtitle;
  final Function(BuildContext context) push;
}

class _MyAppState extends State<MyApp> {
  List<RouteItem> items = <RouteItem>[
    RouteItem(
        title: 'Echo Test (ion-sfu)',
        subtitle: 'echo test with simulcast.',
        push: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => EchoTest()));
        }),
    RouteItem(
        title: 'Pub Sub (ion-sfu)',
        subtitle: 'pub sub.',
        push: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => PubSub()));
        }),
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget _buildRow(context, item) {
    return ListBody(children: <Widget>[
      ListTile(
        title: Text(item.title),
        onTap: () => item.push(context),
        trailing: Icon(Icons.arrow_right),
      ),
      Divider()
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('ION example'),
          ),
          body: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              itemCount: items.length,
              itemBuilder: (context, i) {
                return _buildRow(context, items[i]);
              })),
    );
  }
}
