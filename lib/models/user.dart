import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String id;
  String name;
  String email;
  String password;
  String dob;
  String sex;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.dob,
    required this.sex,
  });

  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('users/$id');

  Future<void> saveInfo() async {
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'dob': dob,
      'sex': sex,
    };
  }
}
