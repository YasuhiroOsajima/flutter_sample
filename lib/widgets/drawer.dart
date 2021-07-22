import 'package:flutter/material.dart';

import '../routes.dart' as routes;

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'My App',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.home),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text("Member list1"),
                )
              ],
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.hail),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text("Member list2"),
                )
              ],
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/home');
            },
          ),
        ],
      ),
    );
  }
}
