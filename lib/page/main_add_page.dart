import 'package:flutter/material.dart';

class MainAddPage extends StatefulWidget {
  @override
  _MainAddPageState createState() => _MainAddPageState();
}

class _MainAddPageState extends State<MainAddPage> {
  final _formKey = GlobalKey<FormState>();

  static const List<Text> _tabTitle = [Text('信息'), Text('备注')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('新建'),
          leading: GestureDetector(
            child: Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                '取消',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          automaticallyImplyLeading: false,
        ),
        body: Form(
            key: _formKey,
            child: Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        labelText: '标题',
                        hintText: '未命名的项'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return '请输入标题';
                      }
                    },
                  ),
                  FormTab()
                ],
              ),
            )));
  }
}

class FormTab extends StatefulWidget {
  @override
  _FormTabState createState() => _FormTabState();
}

class _FormTabState extends State<FormTab> with SingleTickerProviderStateMixin {
  final List<Tab> formTabs = [Tab(text: '信息'), Tab(text: '备注')];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: formTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: TabBar(
        tabs: formTabs,
        controller: _tabController,
        labelColor: Colors.black,
      ),
    );
  }
}

