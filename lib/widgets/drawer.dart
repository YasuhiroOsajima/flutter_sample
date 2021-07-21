import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
            title: Text('Los Angeles'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Honolulu'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Dallas'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Seattle'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Tokyo'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
