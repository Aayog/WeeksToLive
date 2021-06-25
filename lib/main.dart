import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'package:weekstolive/screens/authentication.dart';
import 'package:weekstolive/screens/edit_profile.dart';
import 'package:weekstolive/screens/email_register.dart';
import 'package:weekstolive/screens/home.dart';
import 'package:weekstolive/screens/email_login.dart';
import 'package:weekstolive/screens/login.dart';
import 'package:weekstolive/screens/profile.dart';
import 'package:weekstolive/screens/settings.dart';
import 'package:weekstolive/screens/user_details.dart';
// import 'package:weekstolive/services/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (context) => GoogleSignInProvider(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Weeks To Live',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     initialRoute: AuthenticationWrapper.id,
    //     routes: {
    //       AuthenticationWrapper.id: (context) => AuthenticationWrapper(),
    //       HomeScreen.id: (context) => HomeScreen(),
    //       EmailLoginScreen.id: (context) => EmailLoginScreen(),
    //       LoginScreen.id: (context) => LoginScreen(),
    //     },
    //   ),
    // );

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
        EmailLoginScreen.id: (context) => EmailLoginScreen(),
        EmailRegisterScreen.id: (context) => EmailRegisterScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        UserDetailsScreen.id: (context) => UserDetailsScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        EditProfileScreen.id: (context) => EditProfileScreen(),
        SettingsScreen.id: (context) => SettingsScreen(),
      },
    );
  }
}
