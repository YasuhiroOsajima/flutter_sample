import 'package:flutter/material.dart';

import '../widgets/drawer.dart' as drawer;
import '../widgets/logout_button.dart' as logout_button;
import '../widgets/table_area/table_area.dart' as table_area;
import '../widgets/description_area/description_area.dart' as description_area;
import '../layout.dart' as layout;

class MyHomePage extends StatelessWidget {
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
            logout_button.LogoutButton(),
          ],
        ),
        drawer: drawer.CustomDrawer(),
        body: Row(
          children: <Widget>[
            Expanded(
              flex: layout.tableAreaWidth,
              child: table_area.TableArea(),
            ),
            Expanded(
              flex: layout.descriptionAreaWidth,
              child: description_area.DescriptionArea(),
            ),
          ],
        ),
      ),
    );
  }
}
