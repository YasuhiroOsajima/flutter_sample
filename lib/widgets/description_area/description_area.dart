import 'package:flutter/material.dart';

import '../../style/myboxdecoration.dart' as myboxdecoration;
import 'description.dart' as description;
import 'mychart.dart' as mychart;

class DescriptionArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            decoration: myboxdecoration.MyBoxDecoration(),
            margin: EdgeInsets.only(top: 5.0, left: 5.0),
            padding: EdgeInsets.all(20.0),
            child: description.Description(),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            decoration: myboxdecoration.MyBoxDecoration(),
            margin: EdgeInsets.only(top: 5.0, left: 5.0, bottom: 10.0),
            child: Center(
              child: mychart.MyChart(),
            ),
          ),
        ),
      ],
    );
  }
}
