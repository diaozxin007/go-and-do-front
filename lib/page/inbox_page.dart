import 'package:flutter/material.dart';
import 'package:goanddo/navigator/side-drawer.dart';

class InboxPage extends StatefulWidget {
  final style;

  const InboxPage({Key key, this.style}) : super(key: key);

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('收件箱'),
      ),
      body: Center(
          child: Text('收件箱')
      ),
    );
  }
}
