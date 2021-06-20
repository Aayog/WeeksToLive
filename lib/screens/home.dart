import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'package:weekstolive/screens/login.dart';
// import 'package:weekstolive/services/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  // final _authType =
  //     FirebaseAuth.instance.currentUser!.providerData[0].providerId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Home Page"),
            SizedBox(height: 10),
            Text('Email: ' + _auth.currentUser!.email!),
            ElevatedButton(
              onPressed: () {
                // if (_authType == "google.com") {
                //   final provider = Provider.of<GoogleSignInProvider>(
                //     context,
                //     listen: false,
                //   );

                //   provider.googleLogOut();
                // } else {
                //   _auth.signOut();
                // }

                _auth.signOut();

                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.id, (route) => false);
              },
              child: Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
