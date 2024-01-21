import 'package:flutter/material.dart';
import 'package:flutter_application_12/Bloc/login_bloc.dart';
import 'package:flutter_application_12/Events/login_event.dart';
import 'package:flutter_application_12/Repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final AuthRepository _authRepository = AuthRepository();
  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(authRepo: _authRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: BlocProvider<LoginBloc>(
        create: (BuildContext context) => LoginBloc(authRepo: _authRepository),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: ElevatedButton(
              onPressed: (){
                _loginBloc.add(LogoutRequestedEvent());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: const Text('Sign Out'),
              ),
          ),
        ),
      ),
    );
  }

}