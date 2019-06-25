import 'package:flutter/material.dart';
import 'package:goanddo/widget/tree/non_root_widget.dart';
import 'package:goanddo/widget/tree/root_widget.dart';
import 'package:goanddo/widget/tree/tree_node.dart';
import 'package:goanddo/widget/tree/tree_view.dart';

class TreeWidget extends StatefulWidget {
  @override
  _TreeWidgetState createState() => _TreeWidgetState();
}

class _TreeWidgetState extends State<TreeWidget> {
  List<TreeNode> nodeList = _loadNodeListData();

  @override
  Widget build(BuildContext context) {
    return TreeView(
      parentList: _getParentList(),
    );
  }

  static List<TreeNode> _loadNodeListData() {
    return [
      TreeNode(
          title: "1",
          expand: true,
          root: true,
          childData: [TreeNode(title: "2"), TreeNode(title: "3")]),
      TreeNode(title: "4",expand:false,root: true),
      TreeNode(title: "5", expand: true, root: true, childData: [
        TreeNode(title: "6", expand: true, childData: [TreeNode(title: "7")])
      ])
    ];
  }

  List<Parent> _getParentList() {
    List<Parent> parentList = [];
    nodeList.forEach((node) {
      Parent parent = _getParent(treeNode: node);
      parentList.add(parent);
    });
    return parentList;
  }

  Parent _getParent({@required TreeNode treeNode}) {
    ChildList childList =
        treeNode.expand ? _getChildList(treeNode: treeNode) : null;

    return Parent(
      parent: _getTreeWidget(treeNode: treeNode),
      childList: childList,
    );
  }

  ChildList _getChildList({@required TreeNode treeNode}) {
    List<Widget> widgetList = [];
    List<TreeNode> childNodes = treeNode.childData;
    childNodes.forEach((childNode) {
      widgetList.add(Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: _getParent(treeNode: childNode),
      ));
    });

    return ChildList(children: widgetList);
  }

  Widget _getTreeWidget({TreeNode treeNode}) => treeNode.root
      ? _getRootWidget(treeNode: treeNode)
      : _getNonRootWidget(treeNode: treeNode);

  RootWidget _getRootWidget({@required TreeNode treeNode}) => RootWidget(
        title: treeNode.title,
        expand: treeNode.expand,
      );

  NonRootWidget _getNonRootWidget({@required TreeNode treeNode}) =>
      NonRootWidget(
        title: treeNode.title,
        expand: treeNode.expand,
        overdueLabel: "截止",
      );
}
