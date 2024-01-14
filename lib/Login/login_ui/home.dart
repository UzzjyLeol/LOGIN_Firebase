import 'package:flutter/material.dart';
import 'package:flutter_application_12/Login/login_bloc.dart';
import 'package:flutter_application_12/Login/login_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static Route<void> route(){
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              BlocProvider.of<LoginBloc>(context).add(LogoutRequested());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            child: const Text('Sign Out'),
            ),
        ),
      ),
    );
  }

}