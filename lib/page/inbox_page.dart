import 'package:flutter/material.dart';
import 'package:goanddo/navigator/side-drawer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
class InboxPage extends StatefulWidget {
  final style;

  const InboxPage({Key key, this.style}) : super(key: key);

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('收件箱'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
        child: RaisedButton(
            child: Text("点我触发通知"),
            onPressed: () async {
              await _getNotification();
            }),
      ),
    );
  }

  Future<void> _getNotification() async {

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'go-and-do', '你的提醒', '该吃饭了',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin
        .show(0, '你该吃饭了', '你是不是很饿呀', platformChannelSpecifics, payload: 'item x');
  }

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future<void> onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    await showDialog(context: context,builder: (context) => AlertDialog(title: Text(title),content: Text(body),actions: <Widget>[Container()],));
  }

  Future<void> onSelectNotification(String payload) async {
    debugPrint('notification');
  }
}
