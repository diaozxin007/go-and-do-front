import 'package:flutter/material.dart';

GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
String _name;
int _status;

class TagAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新标签'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveTag,
          )
        ],
      ),
      body: TagAddBody(),
    );
  }

  _saveTag() {
    var _form = _formKey.currentState;
    if (_form.validate()) {
      _form.save();
      print(_name);
      print(_status);
    }
  }
}

class TagAddBody extends StatefulWidget {
  @override
  _TagAddBodyState createState() => _TagAddBodyState();
}

class _TagAddBodyState extends State<TagAddBody> {
  List<String> _statusList = ['活跃', '暂停', '已丢弃'];
  int selected = 0;

  ValueChanged<int> onSelectedChanged(int _index) {
    setState(() {
      selected = _index;
    });
  }

  Iterable<Widget> get _statusSelects sync* {
    for (int i = 0; i < _statusList.length; i++) {
      yield StatusSelect(
        index: i,
        choice: _statusList[i],
        parent: this,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: '名称',labelStyle:  TextStyle(fontSize: 20)),
              onSaved: (val) {
                _name = val;
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text('状态',style: TextStyle(fontSize: 20),),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Wrap(
                children: _statusSelects.toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 实现 StatusSelect
// index 为标识StatusSelect
// parent 为父控件
class StatusSelect extends StatelessWidget {
  const StatusSelect(
      {@required this.index,
      @required this.widget,
      @required this.parent,
      @required this.choice})
      : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ChoiceChip(
          label: Text(choice),
          //未选定的时候背景
          selectedColor: Color(0xff1E90FF),
          //被禁用得时候背景
          disabledColor: Colors.grey[300],
          labelStyle: TextStyle(fontWeight: FontWeight.w200, fontSize: 15.0),
          labelPadding: EdgeInsets.only(left: 8.0, right: 8.0),
          materialTapTargetSize: MaterialTapTargetSize.padded,
          onSelected: (bool value) {
            parent.onSelectedChanged(index);
            _status = index;
          },
          selected: parent.selected == index),
    );
  }

  final int index;
  final widget;
  final parent;
  final String choice;
}
