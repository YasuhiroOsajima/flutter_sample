import 'package:flutter/material.dart';

import '../style/myboxdecoration.dart' as myboxdecoration;

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
                child: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.3,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    'Hello, World!',
                    style: TextStyle(fontSize: 40),
                  ),
                ))),
        Expanded(
            flex: 7,
            child: Container(
              decoration: myboxdecoration.MyBoxDecoration(),
              margin: EdgeInsets.only(top: 5.0, left: 5.0),
            )),
      ],
    );
  }
}
