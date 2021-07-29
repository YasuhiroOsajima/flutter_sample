import 'package:flutter/material.dart';

import 'package:myapp/style/myboxdecoration.dart' as myboxdecoration;
import 'package:myapp/widgets/table_area/search_space/search_space.dart'
    as search;
import 'package:myapp/widgets/table_area/datatable_space/datatable.dart'
    as datatable;

class TableArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            decoration: myboxdecoration.MyBoxDecoration(),
            margin: EdgeInsets.only(top: 5.0),
            child: search.SearchSpace(),
          ),
        ),
        Expanded(
          flex: 9,
          child: Container(
            decoration: myboxdecoration.MyBoxDecoration(),
            margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
            child: SizedBox(
              width: double.infinity,
              child: datatable.MyDataTable(),
            ),
          ),
        ),
      ],
    );
  }
}
