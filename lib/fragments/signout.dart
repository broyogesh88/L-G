import 'package:flutter/material.dart';
import 'package:flutter_google_sign_in_demo/login_screen.dart';

class Signout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Navigator.of(context).pop();
    return LoginScreen();
  }
}
