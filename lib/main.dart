import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:weekstolive/authentication/authentication.dart';
import 'package:weekstolive/screens/home.dart';
import 'package:weekstolive/screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weeks To Live',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AuthenticationWrapper.id,
      routes: {
        AuthenticationWrapper.id: (context) => AuthenticationWrapper(),
        HomeScreen.id: (context) => HomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
      },
    );
  }
}
