import 'package:flutter/material.dart';

///项目、动作详情中的信息tab展示的列表的item组件
class InfoItem extends StatefulWidget {
  @override
  _InfoItemState createState() => _InfoItemState();
}
//enum InfoItemType {project,mark,deadline,notice}
class _InfoItemState extends State<InfoItem> {
  final String title; //左边显示标题
  final bool canSelect; //是否可点击选择
  final String selectedName; //选择后显示的name
  final Color selectedNameColor; //选择后显示的name的颜色
  final Icon leftIcon; //最左边显示的icon
  final Widget selectedTag; //选中的标签widget
  final void Function() mainClick; //点击主item本身事件
  final void Function() iconClick; //icon的点击事件
  final void Function() selectedTagClick;

  _InfoItemState({Key key, this.title, this.canSelect, this.selectedName,
      this.selectedNameColor, this.leftIcon, this.selectedTag, this.mainClick,
      this.iconClick, this.selectedTagClick}); //选中标签的的点击事件

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
