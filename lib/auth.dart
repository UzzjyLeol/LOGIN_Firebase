import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future <void> registerWithEmailAndPassword(
    String email, String password
  ) async {
    final user = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
      );
      
  }

  Future <void> signInWithEmailAndPassword(String email, String password) async {
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
      );
      
  }
}