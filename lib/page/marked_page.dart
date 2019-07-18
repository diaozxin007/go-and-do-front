
import 'package:flutter/material.dart';
import 'package:goanddo/navigator/side-drawer.dart';
import 'package:goanddo/widget/tag_search_selector.dart';

class MarkedPage extends StatefulWidget {
  @override
  _MarkedPageState createState() => _MarkedPageState();
}

class _MarkedPageState extends State<MarkedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('已标注'),
      ),
      body: TagSearchSelector(selected: _buildSelectedItems(),searchItem: SearchItem(),allCanSelect: _buildAllCanSelectItems(),),
      resizeToAvoidBottomPadding: false,
    );
  }

  _buildSelectedItems(){
    List<ShowItem> selectedItems = new List();
    for(var i=0; i< 5; i++){
      selectedItems.add(ShowItem(label: "测试"+i.toString(),));
    }
    return selectedItems;
  }

  _buildAllCanSelectItems(){
    List<ShowItem> allCanSelectItems = new List();
    for(var i=0; i < 10; i++){
      allCanSelectItems.add(ShowItem(label: "可选"+i.toString(),blankColor: true,));
    }
    return allCanSelectItems;
  }
}
