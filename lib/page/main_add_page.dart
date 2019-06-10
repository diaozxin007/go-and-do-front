
import 'package:flutter/material.dart';
import 'package:goanddo/navigator/side-drawer.dart';

class MainAddPage extends StatefulWidget {
  @override
  _MainAddPageState createState() => _MainAddPageState();
}

class _MainAddPageState extends State<MainAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新建'),
      ),
      body: Center(child: Text('新建'),),
    );
  }
}