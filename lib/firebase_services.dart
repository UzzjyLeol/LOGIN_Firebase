import 'package:firebase_auth/firebase_auth.dart';




class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;


  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return null;
  }

  Future<void> resetPassword({required String email}) async {
    await auth
    .sendPasswordResetEmail(email: email)
    .then((value) => null);
  }


}







// class FirebaseAuthService {

//   FirebaseAuth auth = FirebaseAuth.instance;
//   Future<User?> signUpWithEmailAndPassword(String email, String password) async {
//     try {
//       UserCredential credential = auth.createUserWithEmailAndPassword(email: email, password: password) as UserCredential;
//       return credential.user;
//     } catch (e) {
//       print('Some error occured');
//     }
//     return null;

//   }

  

//   Future<User?> signInWithEmailAndPassword(String email, String password) async {
//     try {
//       UserCredential credential = auth.signInWithEmailAndPassword(email: email, password: password) as UserCredential;
//       return credential.user;
//     } catch (e) {
//       print('Some error occured');
//     }
//     return null;

//   }
// }