import 'package:flutter/material.dart';
import 'package:goanddo/model/item_root_model.dart';
import 'dart:ui';

enum RootListType { project, tag, review }

class CommonListView extends StatefulWidget {
  final List<ItemRootModel> itemRootModels;
  final RootListType rootListType;

  const CommonListView({Key key, this.itemRootModels, this.rootListType});

  @override
  _CommonListViewState createState() => _CommonListViewState();
}

class _CommonListViewState extends State<CommonListView> {
  @override
  Widget build(BuildContext context) {
    Widget result;
    switch (widget.rootListType) {
      case RootListType.project:
        {
          result = _projectRootList();
          break;
        }
      case RootListType.tag:
        result = _tagRootList();
        break;
      case RootListType.review:
        result = _reviewRootList();
        break;
    }
    return result;
  }

  _projectRootList() {
    return Flexible(
      child: ListView(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        children: widget.itemRootModels.map((model) {
          return _buildProjectItem(model);
        }).toList(),
      ),
    );
  }

  Widget _buildProjectItem(ItemRootModel model) {
    return Container(
        padding: EdgeInsets.all(10.0),
        height: 50,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Colors.grey, width: 0.5, style: BorderStyle.solid))),
        child: GestureDetector(
          onTap: ()=>{}, //todo 具体onTap事件
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
//          SizedBox(
//            width: 5,
//          ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(model.title),
                  SizedBox(
                    height: 2,
                  ),
                  ChildCountWidget(
                    totalCount: model.childCount,
                    lightCount: model.childDeadlineCount,
                  )
                ],
              ),
              Icon(Icons.chevron_right)
            ],
          ),
        ));
  }

  _tagRootList() {}

  _reviewRootList() {}
}

///子项目个数小圆点展示
class ChildCountWidget extends StatefulWidget {
  final int totalCount;
  final int lightCount;

  ChildCountWidget({this.totalCount, this.lightCount = 0});

  @override
  _ChildCountWidgetState createState() => _ChildCountWidgetState();
}

class _ChildCountWidgetState extends State<ChildCountWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: _createOvals(),
    );
  }

  List<Widget> _createOvals() {
    List<Widget> ovals = [];
    for (int i = 0; i < widget.totalCount; i++) {
      ovals.add(ClipOval(
          child: SizedBox(
        child: Container(
          height: 6,
          width: 6,
          color: i < widget.lightCount ? Colors.deepOrange : Colors.grey,
        ),
      )));
      ovals.add(SizedBox(
        child: Container(
          width: 4,
        ),
      ));
    }
    return ovals;
  }
}
