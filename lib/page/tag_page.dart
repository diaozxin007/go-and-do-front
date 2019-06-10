
import 'package:flutter/material.dart';
import 'package:goanddo/navigator/side-drawer.dart';

class TagPage extends StatefulWidget {
  @override
  _TagPageState createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('标签'),
      ),
      body: Center(
          child: Text('标签')
      ),
    );
  }
}
