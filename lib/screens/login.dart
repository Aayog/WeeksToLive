import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:weekstolive/screens/home.dart';

import 'package:weekstolive/screens/email_login.dart';
import 'package:weekstolive/screens/email_register.dart';
// import 'package:weekstolive/services/google_sign_in.dart';

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
            onPressed: () {
              // final provider = Provider.of<GoogleSignInProvider>(
              //   context,
              //   listen: false,
              // );

              // provider.googleLogin();

              // Navigator.pushNamedAndRemoveUntil(
              //     context, HomeScreen.id, (route) => false);
            },
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
          SizedBox(height: 10.0),
          Text('OR'),
          SizedBox(height: 10.0),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, EmailRegisterScreen.id);
            },
            label: Text('Sign Up with Email'),
            icon: FaIcon(FontAwesomeIcons.envelope),
            style: ElevatedButton.styleFrom(
              primary: Colors.lightGreen,
              onPrimary: Colors.white,
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
