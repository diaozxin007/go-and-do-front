import 'package:flutter/material.dart';
import 'package:goanddo/model/tag_model.dart';

GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
String _title;
int _status;

class TagAddPage extends StatelessWidget {
  final TagModel tagModel;

  const TagAddPage({Key key, this.tagModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: tagModel == null ? Text('新标签') : Text('编辑标签'),
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
      body: TagAddBody(tagModel: tagModel,),
    );
  }

  _saveTag() {
    var _form = _formKey.currentState;
    if (_form.validate()) {
      _form.save();
      print(_title);
      print(_status);
    }
  }
}

class TagAddBody extends StatefulWidget {
  final TagModel tagModel;

  const TagAddBody({Key key, this.tagModel}) : super(key: key);
  @override
  _TagAddBodyState createState() => _TagAddBodyState();
}

class _TagAddBodyState extends State<TagAddBody> {
  List<String> _statusList = ['活跃', '暂停', '已丢弃'];
  int selected = 0;


  @override
  void initState() {
    if(widget.tagModel != null){
      selected = widget.tagModel.status;
      _title = widget.tagModel.title;
      _status = widget.tagModel.status;
    }
  }

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
            Padding(
              padding: EdgeInsets.only(top: 20.0,bottom: 5.0,left: 20.0,right: 20.0),
              child: TextFormField(
                initialValue: _title,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '名称',
                  hintStyle: TextStyle(
                    fontFamily: 'WorkSansSemiBold',
                    fontSize: 15.0,
                  ),
                ),
                onSaved: (val) {
                  _title = val;
                },
              ),
            ),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width - 40,
              color: Colors.grey[400],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0,bottom: 5.0,left: 20.0,right: 20.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '状态',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0,left: 16.0,right: 20.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  children: _statusSelects.toList(),
                ),
              ),
            ),
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
