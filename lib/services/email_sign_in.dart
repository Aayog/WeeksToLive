import 'package:firebase_auth/firebase_auth.dart';
import 'package:weekstolive/models/user.dart';

class EmailSignInProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  late UserData user;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Signed In';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  Future<String> signUp({required UserData userData}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: userData.email,
        password: userData.password,
      );

      return 'Signed Up';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
