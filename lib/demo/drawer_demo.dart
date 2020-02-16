import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // DrawerHeader(
          //   child: Text('Head'.toUpperCase()),
          //   decoration: BoxDecoration(
          //     color: Colors.grey[100]
          //   ),
          // ),
          UserAccountsDrawerHeader(
            accountName: Text('Jun', style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
            accountEmail: Text('18500682038@163.com', style: TextStyle(
              fontWeight: FontWeight.bold
            )),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://upload.jianshu.io/users/upload_avatars/13464654/d894f284-9c41-4160-a65f-8d3291c5fd08.jpeg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[400],
              image: DecorationImage(
                image: NetworkImage('https://c-ssl.duitang.com/uploads/item/201412/16/20141216201759_efWFm.jpeg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.yellow[400].withOpacity(0.6),
                  BlendMode.hardLight
                )
              )
            ),
          ),
          ListTile(
            title: Text('Messages', textAlign: TextAlign.right),
            trailing: Icon(Icons.message, color: Colors.black12, size: 22.0,),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Favorite', textAlign: TextAlign.right),
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0,),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Settings', textAlign: TextAlign.right),
            trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0,),
            onTap: () => Navigator.pop(context),
          )
        ]
      ),
    );
  }
}
