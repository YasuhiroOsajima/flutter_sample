import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.3,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Text(
        'Member list1',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
