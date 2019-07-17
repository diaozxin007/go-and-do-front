import 'package:flutter/material.dart';

class TagSearchSelector extends StatefulWidget {
  final List<ShowItem> allCanSelect;
  final List<ShowItem> selected;
  final SearchItem searchItem;

  const TagSearchSelector(
      {Key key, this.allCanSelect, this.selected, this.searchItem});

  @override
  _TagSearchSelectorState createState() => _TagSearchSelectorState();
}

class _TagSearchSelectorState extends State<TagSearchSelector> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 10,
      child: Row(
        children: <Widget>[
          SelectedItems(
            selected: widget.selected,
          ),
          widget.searchItem
        ],
      ),
    );
  }
}

///可搜索的item
class SearchItem extends StatefulWidget {
  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 0),
      child: Card(
        child: TextField(
          controller: _controller,
          decoration: new InputDecoration(hintText: '添加标签'),
        ),
      ),
    );
  }
}

///已选择的items
class SelectedItems extends StatefulWidget {
  final List<ShowItem> selected;

  const SelectedItems({Key key, this.selected});

  @override
  _SelectedItemsState createState() => _SelectedItemsState();
}

class _SelectedItemsState extends State<SelectedItems> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 10,
      child: Row(
        children: _buildSelectedWidgets(widget.selected),
      ),
    );
  }

  _buildSelectedWidgets(List<ShowItem> selected) {
    List<Widget> widgets = new List();
    for (ShowItem item in selected) {
      widgets.add(item);
    }
    return widgets;
  }
}

///显示的item widget
class ShowItem extends StatelessWidget {
  final String label;

  const ShowItem({Key key, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      child: Card(
        child: Text(label),
        color: Color.fromRGBO(221, 160, 221, 1.0),
      ),
    );
  }
}
