import 'package:flutter/material.dart';
import 'package:goanddo/widget/tree/image-text.dart';
import 'package:goanddo/widget/tree/tree_node.dart';

class TreeWedget extends StatefulWidget {
  @override
  _TreeWedgetState createState() => _TreeWedgetState();
}

class _TreeWedgetState extends State<TreeWedget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[],
    );
  }

  _buildNode(List<Node> nodes) {
    List<Widget> widgets = List();
    if (nodes != null && nodes.length > 0) {
      for (Node node in nodes) {
//        widgets.add(GestureDetector(
//          child: ImageText(),
//        ));
      }
    }
  }
}
