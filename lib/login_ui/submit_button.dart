import 'package:flutter/material.dart';

import 'color_set.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      OutlinedButton(
        onPressed: (){},
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.black87,
          foregroundColor: const Color.fromARGB(255, 195, 214, 202),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          side: const BorderSide(width: 1.7, color: ColorSet.borderButton)
        ),
        child: const Padding(
          padding: EdgeInsets.fromLTRB(18, 8, 18, 12),
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.white
            ),
          ),
        )
      );
  }
}

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(top: 24,bottom: 30),
        child: TextButton(
          onPressed: (){},
          style: TextButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 94, 92, 92),
          ),
          child: 
            const Text('Forgot password?',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white54,
              decoration: TextDecoration.underline,
              wordSpacing: 1,
              letterSpacing: 2
            ),
          )
        ),
      );
  }
}