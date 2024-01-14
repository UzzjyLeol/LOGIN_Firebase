import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  // final firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password
        );
    } on FirebaseAuthException catch(e) {
      if (e.code=='weak-password') {
        throw Exception('This password is too weak!');
      } else if (e.code=='email-already-in-use') {
        throw Exception('Account already exist for this email!');
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
      );
    } on FirebaseAuthException catch(e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> resetPassword({required String email}) async {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch(e) {
      throw Exception(e.toString());
    }
  }
  
}