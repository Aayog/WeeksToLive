import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:weekstolive/screens/login/email_login.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, EmailLoginScreen.id);
            },
            label: Text('Sign In with Email'),
            icon: FaIcon(FontAwesomeIcons.envelope),
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue,
              onPrimary: Colors.white,
              minimumSize: Size(
                double.infinity,
                50,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          ElevatedButton.icon(
            onPressed: () {},
            label: Text('Sign In with Google'),
            icon: FaIcon(FontAwesomeIcons.google),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              minimumSize: Size(
                double.infinity,
                50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// keytool.exe -list -v -alias androiddebugkey -keystore C:\\Users\\danyu\\.android\\debug.keystore