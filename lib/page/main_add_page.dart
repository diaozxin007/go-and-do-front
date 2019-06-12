import 'package:flutter/material.dart';
import 'package:goanddo/widget/info_item.dart';

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
    return SizedBox(
      height: 650,
      child: Column(
        children: <Widget>[
          TabBar(
            tabs: formTabs,
            controller: _tabController,
            labelColor: Colors.black,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Container(
                  height: 600,
                  alignment: Alignment.topCenter,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      InfoItem(
                        title: '标签',
                        leftIcon: Icon(Icons.label),
                        iconClick: (){
                          print('press icon');
                        },
                        mainClick: (){
                          print('press item');
                        },
                      ),
                      InfoItem(
                        title: '项目',
                        iconClick: (){
                          print('press icon');
                        },
                        mainClick: (){
                          print('press item');
                        },
                      ),
                      InfoItem(
                        title: '标注',
                        leftIcon: Icon(Icons.bookmark),
                        iconClick: (){
                          print('press icon');
                        },
                        mainClick: (){
                          print('press item');
                        }
                      ),
                      InfoItem(
                          title: '截止',
                          iconClick: (){
                            print('press icon');
                          },
                          mainClick: (){
                            print('press item');
                          }
                      ),
                      InfoItem(
                          title: '通知',
                          iconClick: (){
                            print('press icon');
                          },
                          mainClick: (){
                            print('press item');
                          }
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 600,
                  child: Center(
                    child: TextField(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
