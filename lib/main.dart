import 'package:flutter/material.dart';
import 'package:flutter_application_12/Bloc/authentication_bloc.dart';
import 'package:flutter_application_12/Bloc/login_bloc.dart';
import 'package:flutter_application_12/Bloc/register_bloc.dart';
import 'package:flutter_application_12/Bloc/reset_password_bloc.dart';
import 'package:flutter_application_12/Events/authentication_event.dart';
import 'package:flutter_application_12/Login/login_ui/home.dart';
import 'package:flutter_application_12/Login/login_ui/login.dart';
import 'package:flutter_application_12/Repositories/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'States/authentication_state.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
    apiKey: 'AIzaSyCrTswYZyl7XH5Ie9LPscWPz6o0zAOfarE',
    appId: '1:88190219884:android:4947a6f330766bb376ca49',
    messagingSenderId: '88190219884',
    projectId: 'loginapp-b59e2'));
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthRepository _authRepository= AuthRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: 
            MultiBlocProvider(providers:
            [
              BlocProvider(
                create: (context) {
                  final authenticationBloc = AuthenticationLoginBloc(authRepository: _authRepository);
                  authenticationBloc.add(AuthenticationEventInit());
                  return authenticationBloc;
                }
              ),
              BlocProvider(create: (context) => RegisterBloc(authRepo: _authRepository)),
              BlocProvider(create: (context) => ResetPasswordBloc(authRepo: _authRepository)),
              BlocProvider(create: (context) => LoginBloc(authRepo: _authRepository)),
            ],
            child: BlocBuilder<AuthenticationLoginBloc, AuthenticationState>(
              builder: (context, authenState) {
                if (authenState is AuthenticationStateSuccess) {
                  return const HomePage();
                } else if (authenState is AuthenticationStateInit) {
                  return BlocProvider<LoginBloc>(
                    create: (context) => LoginBloc(authRepo: _authRepository),
                    child: LoginPage(authRepository: _authRepository,),
                  );
                } else {
                  return const Text('NOTHING');
                }
              },
            )
          ),
    );
  }
}
