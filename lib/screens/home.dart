import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    String userId = _auth.currentUser!.uid;

    Widget requestList() {
      return FutureBuilder<DocumentSnapshot>(
        future: users.doc(userId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong!'),
            );
          }

          if (snapshot.hasData) {
            if (!snapshot.data!.exists) {
              return Text("Document does not exist.");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Name: ${data['name']}'),
                  SizedBox(height: 10),
                  Text(
                      'Date of Birth: ${DateFormat.yMd().format(data['dob'].toDate())}'),
                  SizedBox(height: 10),
                  Text('Gender: ${data['gender']}'),
                  SizedBox(height: 10),
                  Text('Do you smoke?: ${data['smoke']}'),
                  SizedBox(height: 10),
                  Text('Do you drink?: ${data['drink']}'),
                  SizedBox(height: 10),
                  Text('Email: ' + _auth.currentUser!.email!),
                ],
              );
            }
          }

          return Center(child: CircularProgressIndicator());
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
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
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Center(
        child: requestList(),
      ),
    );
  }
}
