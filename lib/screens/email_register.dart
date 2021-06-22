import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:weekstolive/screens/home.dart';

class EmailRegisterScreen extends StatefulWidget {
  static String id = 'email_register';

  @override
  _EmailRegisterScreenState createState() => _EmailRegisterScreenState();
}

class _EmailRegisterScreenState extends State<EmailRegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              controller: _emailController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              controller: _passwordController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              controller: _confirmController,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  try {
                    if (_passwordController.text != '' &&
                        _confirmController.text != '' &&
                        _passwordController.text == _confirmController.text) {
                      UserCredential result =
                          await _auth.createUserWithEmailAndPassword(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim());

                      String userId = result.user!.uid;

                      print(userId);

                      FirebaseFirestore.instance.doc('users/$userId').set({
                        'name': 'danyu rajbahak',
                        'gender': 'male',
                        'dob': '21/07/1999',
                      });

                      Navigator.pushNamed(context, HomeScreen.id);
                    } else {
                      print('Passwords do not match');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
