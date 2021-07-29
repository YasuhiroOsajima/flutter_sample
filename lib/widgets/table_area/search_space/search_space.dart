import 'package:flutter/material.dart';

import 'package:myapp/widgets/table_area/search_space/buttons.dart' as buttons;
import 'package:myapp/widgets/table_area/search_space/search.dart' as search;
import 'package:myapp/layout.dart' as layout;

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
