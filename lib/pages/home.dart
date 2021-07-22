import 'package:flutter/material.dart';

import '../widgets/drawer.dart' as drawer;
import '../widgets/table_area.dart' as table_area;
import '../widgets/description_area.dart' as description_area;

class MyHomePage extends StatelessWidget {
  static const String routeName = '/homePage';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // For unforcusing by search box.
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Members list1',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 15.0),
              padding: EdgeInsets.all(10.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: const BorderSide(),
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                onPressed: () {},
              ),
              //child: IconButton(
              //  icon: Icon(Icons.account_box, color: Colors.black),
              //  iconSize: 40,
              //  //label: Text(
              //  //  'Account',
              //  //  style: TextStyle(fontSize: 10, color: Colors.white),
              //  //),
              //  onPressed: () {},
              //),
            ),
          ],
        ),
        drawer: drawer.CustomDrawer(),
        body: Row(
          children: <Widget>[
            Expanded(
              flex: 7,
              child: table_area.TableArea(),
            ),
            Expanded(
              flex: 3,
              child: description_area.DescriptionArea(),
            ),
          ],
        ),
      ),
    );
  }
}
