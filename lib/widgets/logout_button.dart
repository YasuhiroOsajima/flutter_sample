import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.0),
      padding: EdgeInsets.all(10.0),
      child: OutlinedButton(
        child: Text(
          'Logout',
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        style: OutlinedButton.styleFrom(
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/login');
        },
      ),
    );
  }
}
