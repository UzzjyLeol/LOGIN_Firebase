import 'package:flutter/material.dart';

class LoginGuide extends StatelessWidget {
  const LoginGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: const EdgeInsets.fromLTRB(6, 6, 6, 24),
        child: 
          const Text(
            'Please enter your login and password!',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white54,
              wordSpacing: 1,
              letterSpacing: 2
            ),
          ),
      );      
  }
}

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 26, bottom: 16),
      child: 
        const Text('LOGIN',
        style: TextStyle(
          fontSize: 40,
          letterSpacing: 2,
          fontWeight: FontWeight.w500,
          color: Colors.white
        ),
        ),
    );
  }
}