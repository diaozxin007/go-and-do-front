import 'package:flutter/material.dart';
import 'package:goanddo/navigator/side-drawer.dart';

class MainAddPage extends StatefulWidget {
  @override
  _MainAddPageState createState() => _MainAddPageState();
}

class _MainAddPageState extends State<MainAddPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('新建'),
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
                          borderRadius: BorderRadius.all(Radius.circular(10))),
//                      icon: Icon(Icons.title),
                      hintText: '未命名的项'
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return '请输入标题';
                      }
                    },
                  ),
                ],
              ),
            )));
  }
}
