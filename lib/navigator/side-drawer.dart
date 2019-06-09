import 'package:flutter/material.dart';
import 'package:goanddo/page/AboutUsScreen.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Burhanuddin Rashid"),
            accountEmail: Text("burhanrashid5253@gmail.com"),
            otherAccountsPictures: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.info,
                    color: Colors.white,
                    size: 36.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<bool>(
                          builder: (context) => AboutUsScreen()),
                    );
                  })
            ],
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              backgroundImage: NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560023295635&di=3756d8b91751bca0e5faf4ca020177db&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201405%2F05%2F20140505225444_Kuajs.jpeg'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings_applications),
            title: Text('设置'),
            onTap: (){
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
