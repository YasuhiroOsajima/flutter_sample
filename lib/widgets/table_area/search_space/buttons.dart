import 'package:flutter/material.dart';

import 'package:myapp/widgets/table_area/search_space/create_dialog.dart'
    as create_dialog;

class MyButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 50.0),
          child: ElevatedButton(
            child: const Text('Create'),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              onPrimary: Colors.white,
            ),
            onPressed: () async {
              var result = await showDialog<int>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return create_dialog.MyButtons();
                },
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 30.0),
          child: ElevatedButton(
            child: const Text('Delete'),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              onPrimary: Colors.white,
            ),
            onPressed: () async {
              var result = await showDialog<int>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return create_dialog.MyButtons();
                },
              );
            },
          ),
        )
      ],
    );
  }
}
