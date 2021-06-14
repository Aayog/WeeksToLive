import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weekstolive/screens/authentication.dart';
import 'package:weekstolive/screens/home.dart';
import 'package:weekstolive/screens/login/email_login.dart';
import 'package:weekstolive/screens/login/login.dart';
import 'package:weekstolive/services/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weeks To Live',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AuthenticationWrapper.id,
        routes: {
          AuthenticationWrapper.id: (context) => AuthenticationWrapper(),
          HomeScreen.id: (context) => HomeScreen(),
          EmailLoginScreen.id: (context) => EmailLoginScreen(),
          LoginScreen.id: (context) => LoginScreen(),
        },
      ),
    );
  }
}
