import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String dob;
  final String sex;

  User({
    required this.id,
    required this.name,
    required this.email,
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
