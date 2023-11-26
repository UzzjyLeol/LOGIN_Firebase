import 'package:flutter/material.dart';



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