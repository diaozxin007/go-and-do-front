import 'package:flutter/material.dart';

///项目、动作详情中的信息tab展示的列表的item组件
class InfoItem extends StatefulWidget {
  final String title; //左边显示标题
  final bool canSelect; //是否可点击选择
  final String selectedName; //选择后显示的name
  final Color selectedNameColor; //选择后显示的name的颜色
  final Icon leftIcon; //最左边显示的icon
  final Widget selectedTags; //选中的标签widget列表
  final void Function() mainClick; //点击主item本身事件
  final void Function() iconClick; //icon的点击事件
  final void Function() selectedTagClick;

  const InfoItem(
      {Key key,
      this.title,
      this.canSelect,
      this.selectedName,
      this.selectedNameColor,
      this.leftIcon,
      this.selectedTags,
      this.mainClick,
      this.iconClick,
      this.selectedTagClick})
      : super(key: key);

  @override
  _InfoItemState createState() => _InfoItemState();
}

//enum InfoItemType {project,mark,deadline,notice}
class _InfoItemState extends State<InfoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(),
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white54,
                border: Border.all(color:Colors.lightBlue,width: 1,),
                borderRadius: BorderRadius.all(Radius.circular(7))),
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildChildrenWidgets(),
            ),
          ),
          onTap: widget.mainClick,
        ));
  }

  List<Widget> _buildChildrenWidgets() {
    List<Widget> childrenWidgets = [];
    if (widget.selectedTags != null) {
      childrenWidgets.add(widget.selectedTags);
    }
    if (widget.title != null) {
      childrenWidgets.add(Text(widget.title));
    }
    if (widget.selectedName != null) {
      childrenWidgets.add(Text(
        widget.selectedName,
        style: TextStyle(color: widget.selectedNameColor),
      ));
    }
    if (widget.leftIcon != null) {
      childrenWidgets.add(GestureDetector(
        child: widget.leftIcon,
        onTap: widget.iconClick,
      ));
    }
    if (widget.leftIcon == null && widget.selectedName == null){
      childrenWidgets.add(Text('无'));
    }
    return childrenWidgets;
  }
}
