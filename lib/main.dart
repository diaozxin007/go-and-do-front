import 'package:flutter/material.dart';
import 'package:goanddo/navigator/bottom_navigator.dart';

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
      home: BottomNavigator(),
    );
  }
}
