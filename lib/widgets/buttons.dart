import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Row(
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
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
