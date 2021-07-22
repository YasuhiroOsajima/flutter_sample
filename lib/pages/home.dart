import 'package:flutter/material.dart';

import '../widgets/drawer.dart' as drawer;
import '../widgets/table_area.dart' as table_area;
import '../widgets/description_area.dart' as description_area;

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Members List',
              style: TextStyle(color: Colors.white),
            ),
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
          )),
    );
  }
}
