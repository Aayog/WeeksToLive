import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:weekstolive/components/sidebar.dart';
// import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome to WeeksToLive'),
          centerTitle: true,
        ),
        drawer: SideBar(),
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Press back twice to exit app.'),
          ),
          child: Center(
            child: Text('Home'),
          ),
        ));
  }
}
