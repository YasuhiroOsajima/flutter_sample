import 'package:flutter/material.dart';

import '../widgets/drawer.dart' as drawer;
import '../widgets/datatable.dart' as datatable;
import '../widgets/search.dart' as search;

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
            title: const Text('Members List'),
          ),
          drawer: drawer.CustomDrawer(),
          body: Row(
            children: <Widget>[
              Expanded(
                  flex: 7,
                  child: Column(
                    children: <Widget>[
                      search.SearchSpace(),
                      SizedBox(
                        width: double.infinity,
                        child: datatable.MyDataTable(),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Hello, World!',
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}
