import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('確認'),
      content: Text('確認のダイアログです。'),
      actions: <Widget>[
        OutlinedButton(
          child: const Text('Cancel'),
          style: OutlinedButton.styleFrom(
            primary: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(0),
        ),
        OutlinedButton(
          child: const Text('OK'),
          style: OutlinedButton.styleFrom(
            primary: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(0),
        ),
      ],
    );
  }
}
