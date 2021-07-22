import 'package:flutter/material.dart';

class MyBoxDecoration2 extends BoxDecoration {
  MyBoxDecoration2()
      : super(
          color: Color(0xf0e68c),
          border: Border.all(color: Colors.black, style: BorderStyle.solid),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        );
}
