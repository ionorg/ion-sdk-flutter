import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  bool isMe = false;
  String _id;
  String _text;
  String _name;
  String _from;
  String _createAt;
  String _session_id;


  ChatMessage(this._id, this._text, this._name, this._from, this._createAt, this._session_id,);

  @override
  Widget build(BuildContext context) {


    if(isMe){
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_name,style: Theme.of(context).textTheme.subhead),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(_text),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: CircleAvatar(
                child: Text('Me'),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: Text(_name),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_createAt,style: Theme.of(context).textTheme.subhead),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(_text),
              )
            ],
          ),
        ],
      ),
    );
  }
}
