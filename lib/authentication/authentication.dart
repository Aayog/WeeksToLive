import 'package:flutter/material.dart';
import 'package:weekstolive/screens/home.dart';
import 'package:weekstolive/screens/login.dart';

class AuthenticationWrapper extends StatelessWidget {
  static String id = 'authentication_screen';

  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
