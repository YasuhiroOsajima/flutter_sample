import 'package:flutter/material.dart';

import '../style/myboxdecoration.dart' as myboxdecoration;
import '../widgets/search.dart' as search;
import '../widgets/datatable.dart' as datatable;

class TableArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
          flex: 2,
          child: Container(
              decoration: myboxdecoration.MyBoxDecoration(),
              margin: EdgeInsets.only(top: 5.0),
              child: search.SearchSpace())),
      Expanded(
          flex: 8,
          child: Container(
              decoration: myboxdecoration.MyBoxDecoration(),
              margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 1.0,
                child: datatable.MyDataTable(),
              ))),
    ]);
  }
}
