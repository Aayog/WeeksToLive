import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static String id = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Edit Profile'),
      ),
    );
  }
}
