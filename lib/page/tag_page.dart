import 'package:flutter/material.dart';
import 'package:goanddo/widget/tree/tree-widget.dart';

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
      body: TreeWidget(),
    );
  }
}
