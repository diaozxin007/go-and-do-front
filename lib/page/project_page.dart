import 'package:flutter/material.dart';
import 'package:goanddo/model/item_root_model.dart';
import 'package:goanddo/widget/common_list_view.dart';
import 'dart:ui';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
              height: 60,
              child: Text(
                '项目',
                style: TextStyle(fontSize: 30),
              ),
              alignment: Alignment.centerLeft,
            ),
            CommonListView(
              itemRootModels: _loadData(),
              rootListType: RootListType.project,
            )
          ],
        ),
      ),
    );
  }

  List<ItemRootModel> _loadData() {
    List<ItemRootModel> list = [
      ItemRootModel(title: '项目1', childCount: 3, childDeadlineCount: 1),
      ItemRootModel(title: '项目2', childCount: 2, childDeadlineCount: 0),
      ItemRootModel(title: '项目3', childCount: 5, childDeadlineCount: 3),
      ItemRootModel(title: '项目4', childCount: 0, childDeadlineCount: 0),
    ];
    return list;
  }
}
