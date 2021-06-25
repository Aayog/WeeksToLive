import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:weekstolive/screens/login.dart';
import 'package:weekstolive/screens/profile.dart';

class SideBar extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 100.0,
            child: DrawerHeader(
              child: Text(
                'Weeks to Live',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, ProfileScreen.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
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
          ),
        ],
      ),
    );
  }
}
