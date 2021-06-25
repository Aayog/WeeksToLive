import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  static String id = 'edit_profile';

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
