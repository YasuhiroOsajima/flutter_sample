import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart' as home;
import 'states/members.dart' as members;
import 'states/row_selected.dart' as row_selected;
import 'states/table_sort.dart' as table_sort;
import 'states/table_search.dart' as table_search;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<members.Members>(
          create: (context) => members.Members(),
        ),
        ChangeNotifierProvider<table_sort.TableSort>(
          create: (context) => table_sort.TableSort(),
        ),
        ChangeNotifierProvider<table_search.TableSearch>(
          create: (context) => table_search.TableSearch(),
        ),
        ChangeNotifierProvider<row_selected.RowSelected>(
          create: (context) => row_selected.RowSelected(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

// App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.purple)),
      ),
      home: home.MyHomePage(),
    );
  }
}
