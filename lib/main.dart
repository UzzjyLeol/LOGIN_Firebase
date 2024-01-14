import 'package:flutter/material.dart';
import 'package:flutter_application_12/Register/register_bloc.dart';
import 'package:flutter_application_12/auth_repository.dart';
import 'package:flutter_application_12/Login/login_bloc.dart';
import 'package:flutter_application_12/Login/login_ui/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
    apiKey: 'AIzaSyCrTswYZyl7XH5Ie9LPscWPz6o0zAOfarE',
    appId: '1:88190219884:android:4947a6f330766bb376ca49',
    messagingSenderId: '88190219884',
    projectId: 'loginapp-b59e2'));
  await Firebase.initializeApp();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginBloc(
              authRepo: RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => RegisterBloc(
              authRepo: RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginPage(),    
        ),
      ),
    );


  }
}
