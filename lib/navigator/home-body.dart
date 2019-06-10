import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:goanddo/navigator/side-drawer.dart';
import 'dart:ui';

import 'package:goanddo/page/main_add_page.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Go and do')),
        drawer: SideDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, PageRouteBuilder(pageBuilder:
                (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
              return ScaleTransition(
                scale: Tween<double>(begin: 0.0,end:1.0).animate(CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
                child: MainAddPage(),
              );
            }));
          },
          child: Icon((Icons.add)),
          backgroundColor: Colors.orange,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          elevation: 30.0,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 44,
          ),
        ),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: StaggeredGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: _children,
                staggeredTiles: _tiles,
              ),
            ),
          ],
        ));
  }
}

List<StaggeredTile> _tiles = [
  StaggeredTile.count(2, 0.5),
  StaggeredTile.count(1, 1),
  StaggeredTile.count(1, 1),
  StaggeredTile.count(1, 1)
];

List<Widget> _children = [
  HomeTile('收件箱', 'inbox', Colors.green, Icons.inbox),
  HomeTile('项目', 'project', Colors.blue, Icons.view_list),
  HomeTile('标签', 'tag', Colors.purple, Icons.label),
  HomeTile('已标注', 'marked', Colors.orange, Icons.bookmark),
];

class HomeTile extends StatelessWidget {
  final String title;
  final String route;
  final Color backgroundColor;
  final IconData iconData;

  HomeTile(this.title, this.route, this.backgroundColor, this.iconData);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: InkWell(
        onTap:
            route == null ? null : () => Navigator.of(context).pushNamed(route),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  iconData,
                  color: backgroundColor,
                ),
                Text(title,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: backgroundColor, fontSize: 20))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
