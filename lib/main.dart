import 'package:flutter/material.dart';
import 'package:goanddo/navigator/bottom_navigator.dart';
import 'package:goanddo/navigator/home-body.dart';
import 'package:goanddo/page/inbox_page.dart';
import 'package:goanddo/page/main_add_page.dart';
import 'package:goanddo/page/marked_page.dart';
import 'package:goanddo/page/project_page.dart';
import 'package:goanddo/page/tag_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go and do',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeBody(),
      routes: {
        'inbox': (context) => InboxPage(),
        'project': (context) => ProjectPage(),
        'tag': (context) => TagPage(),
        'marked': (context) => MarkedPage(),
        'home_add': (context) => MainAddPage()
      },
    );
  }
}
