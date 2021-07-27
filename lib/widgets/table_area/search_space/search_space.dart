import 'package:flutter/material.dart';

import 'buttons.dart' as buttons;
import 'search.dart' as search;
import '../../../layout.dart' as layout;

class SearchSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double tableAreaWidth = displayWidth * (layout.tableAreaWidth * 0.1);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: tableAreaWidth * 0.7,
          child: buttons.MyButtons(),
        ),
        Container(
          width: tableAreaWidth * 0.3,
          child: search.MySearch(),
        ),
      ],
    );
  }
}
