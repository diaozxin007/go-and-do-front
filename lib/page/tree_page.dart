import 'package:flutter/material.dart';
import 'package:goanddo/widget/tree/tree-widget.dart';

class TreePage extends StatefulWidget {
  @override
  _TreePageState createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('树形列表'),
      ),
      body: TreeWidget(),
    );
  }
}
