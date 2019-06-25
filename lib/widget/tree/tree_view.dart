import 'package:flutter/material.dart';

typedef void ParentSelectChanged(bool isSelected);

class TreeView extends StatelessWidget {
  final List<Parent> parentList;
  final bool hasScrollBar;

  const TreeView(
      {Key key, this.parentList = const <Parent>[], this.hasScrollBar = false});

  @override
  Widget build(BuildContext context) {
    return hasScrollBar ? Scrollbar(child: _getTreeList()) : _getTreeList();
  }

  _getTreeList() {
    return ListView.builder(
        itemBuilder: (context, index) {
          return parentList[index];
        },
        itemCount: parentList.length);
  }
}

class Parent extends StatefulWidget {
  final Widget parent;
  final ChildList childList;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final ParentSelectChanged callback;

  const Parent(
      {Key key,
      @required this.parent,
      @required this.childList,
      this.mainAxisSize = MainAxisSize.min,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.callback});

  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: widget.mainAxisSize,
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      children: <Widget>[
        GestureDetector(
          child: widget.parent,
          onTap: expand,
        ),
        _getChild()
      ],
    );
  }

  void expand() {
    if (widget.callback != null) widget.callback(_isSelected);
    setState(() {
      _isSelected = toggleBool(_isSelected);
    });
  }

  bool toggleBool(bool isSelected) {
    return isSelected ? false : true;
  }

  _getChild() {
    return _isSelected && widget.childList != null ? widget.childList : Container();
  }
}

class ChildList extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  const ChildList(
      {Key key,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.mainAxisSize = MainAxisSize.min,
      this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: children);
  }
}
