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
    return Container(
      width: MediaQuery.of(context).size.width - 10,
      height: MediaQuery.of(context).size.height - 100,
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width - 10,
            child: Row(
              children: <Widget>[
                SelectedItems(
                  selected: widget.selected,
                ),
                widget.searchItem
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 10,
            height: MediaQuery.of(context).size.height - 150,
            decoration:
                BoxDecoration(border: Border.all(width: 2, color: Colors.red)),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(10, 4, 0, 4),
            child: Container(
              width: 80,
              child: ListView(
                children: _buildCanSelectItems(widget.allCanSelect),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildCanSelectItems(List<ShowItem> allCanSelect) {
    List<Widget> widgets = new List();
    for (ShowItem item in allCanSelect) {
      Widget container = SizedBox(
        width: 50,
        height: 40,
        child: item,
      );
      widgets.add(container);
    }
    return widgets;
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
    return Container(
      width: 80,
      height: 40,
      child: Card(
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
              hintText: '添加标签',
              hintStyle: TextStyle(fontSize: 14),
              contentPadding: EdgeInsets.all(6),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
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
      width: MediaQuery.of(context).size.width - 100,
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
  final bool blankColor;

  const ShowItem({Key key, this.label, this.blankColor = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      height: 40,
      child: Card(
        elevation: 15.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Text(
          label,
          style: TextStyle(height: 1.4),
          textAlign: TextAlign.center,
        ),
        color: blankColor == false
            ? Color.fromRGBO(221, 160, 221, 1.0)
            : Colors.white,
      ),
    );
  }
}
