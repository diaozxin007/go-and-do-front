
import 'package:flutter/material.dart';
import 'package:goanddo/navigator/side-drawer.dart';

class MarkedPage extends StatefulWidget {
  @override
  _MarkedPageState createState() => _MarkedPageState();
}

class _MarkedPageState extends State<MarkedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('已标注'),
      ),
      body: Center(
          child: Text('已标注')
      ),
    );
  }
}
