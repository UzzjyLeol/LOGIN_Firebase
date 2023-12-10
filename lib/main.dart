import 'package:flutter/material.dart';
import 'package:flutter_application_12/login_ui/home.dart';
import 'package:flutter_application_12/login_ui/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(apiKey: 'AIzaSyCrTswYZyl7XH5Ie9LPscWPz6o0zAOfarE', appId: '1:88190219884:android:4947a6f330766bb376ca49', messagingSenderId: '88190219884', projectId: 'loginapp-b59e2'));
  await Firebase.initializeApp();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Authentication',

      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        },
      ),


    );
  }
}
