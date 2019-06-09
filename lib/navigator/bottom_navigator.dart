
import 'package:flutter/material.dart';
import 'package:goanddo/navigator/side-drawer.dart';
import 'package:goanddo/page/inbox_page.dart';
import 'package:goanddo/page/marked_page.dart';
import 'package:goanddo/page/project_page.dart';
import 'package:goanddo/page/tag_page.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _currentIndex = 0;
  static const _defaultColor = Colors.grey;
  static const _activeColor = Colors.lightBlue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Go and do'),
        ),
        drawer: SideDrawer(),
        body: _showNavigationItemPage(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.inbox,
                  color: _defaultColor,
                ),
                activeIcon: Icon(
                  Icons.inbox,
                  color: _activeColor,
                ),
                title: Text(
                  '收件箱',
                  style: TextStyle(
                      color: _currentIndex!= 0 ? _defaultColor : _activeColor),
                )),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_list, color: _defaultColor),
              activeIcon: Icon(
                Icons.view_list,
                color: _activeColor,
              ),
              title: Text(
                '项目',
                style: TextStyle(
                    color: _currentIndex != 1 ? _defaultColor : _activeColor),
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.label, color: _defaultColor),
                activeIcon: Icon(
                  Icons.label,
                  color: _activeColor,
                ),
                title: Text(
                  '标签',
                  style: TextStyle(
                      color: _currentIndex != 2 ? _defaultColor : _activeColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                activeIcon: Icon(
                  Icons.bookmark,
                  color: _activeColor,
                ),
                title: Text(
                  '已标注',
                  style: TextStyle(
                      color: _currentIndex != 3 ? _defaultColor : _activeColor),
                )),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        )
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _showNavigationItemPage(int index) {
    switch (index) {
      case 0:
        return InboxPage();
        break;
      case 1:
        return ProjectPage();
        break;
      case 2:
        return TagPage();
        break;
      case 3:
        return MarkedPage();
        break;
    }
  }
}
