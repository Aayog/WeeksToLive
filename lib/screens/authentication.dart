import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weekstolive/screens/home.dart';

import 'package:weekstolive/screens/login.dart';

class AuthenticationWrapper extends StatelessWidget {
  static String id = 'authentication_screen';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return HomeScreen();
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Something went wrong.'),
          );
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
