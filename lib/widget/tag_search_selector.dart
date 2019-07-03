import 'package:flutter/material.dart';

class TagSearchSelector extends StatefulWidget {
  final List<ShowItem> allCanSelect;
  final List<ShowItem> selected;
  final SearchItem searchItem;

  const TagSearchSelector({Key key, this.allCanSelect, this.selected, this.searchItem});

  @override
  _TagSearchSelectorState createState() => _TagSearchSelectorState();
}

class _TagSearchSelectorState extends State<TagSearchSelector> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

///可搜索的item
class SearchItem extends StatefulWidget {
  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


///显示的item widget
class ShowItem extends StatelessWidget {
  final String label;

  const ShowItem({Key key, this.label});
  @override
  Widget build(BuildContext context) {
    return Card(child: Text(label),color: Color.fromRGBO(221, 160, 221, 1.0),);
  }
}

