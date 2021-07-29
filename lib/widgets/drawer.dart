import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 80.0,
            child: DrawerHeader(
              child: Text(
                'My App',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
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
