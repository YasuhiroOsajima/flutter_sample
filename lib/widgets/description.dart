import 'package:flutter/material.dart';

class Descriptiona extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.3,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Text(
        'Hello, World!',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
