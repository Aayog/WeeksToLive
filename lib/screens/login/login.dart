import 'package:flutter/material.dart';

import 'package:weekstolive/screens/login/email_login.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, EmailLoginScreen.id);
            },
            icon: Icon(Icons.email),
            label: Text('Sign in with Email'),
          ),
          SizedBox(height: 10.0),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.gpp_good),
            label: Text('Sign in with Google'),
          ),
        ],
      ),
    );
  }
}

// keytool.exe -list -v -alias androiddebugkey -keystore C:\\Users\\danyu\\.android\\debug.keystore