import 'package:flutter/material.dart';
import 'package:flutter_application_12/login_ui/color_set.dart';
import 'package:flutter_application_12/login_ui/contact.dart';
import 'package:flutter_application_12/login_ui/float_background.dart';
import 'package:flutter_application_12/login_ui/get_infor.dart';
import 'package:flutter_application_12/login_ui/login_guide.dart';
import 'package:flutter_application_12/login_ui/submit_button.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          // Set background color và gradient
          decoration: const BoxDecoration(
            gradient:LinearGradient(
              colors: [ColorSet.gradientColor1,ColorSet.gradientColor2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )
          ),         
          child: Stack(
            children: [
              const FloatingBackground(),
              // Tạo Row chứa khối Login và 2 khối SizedBox trống ở 2 bên
              Row(
                children: [
                  // First SizedBox
                  const Expanded(
                    flex: 2,
                    child:
                      SizedBox(width: double.infinity,)
                    ),

                  // Khối Login
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin:const EdgeInsets.only(top: 120,bottom: 42),
                      color: Colors.black87,
                      child: 
                      // Tạo column chứa 6 Block
                        const Column(
                          children: [
                            //Title container
                            LoginTitle(),

                            //Guide container
                            LoginGuide(),

                            //Get Infor
                            GetInfor(),

                            //TextButton ->Forgot
                            ForgotPasswordButton(),

                            //Submit ElevatedButton ->Login
                            LoginButton(),

                            SizedBox(height: 34),

                            //Contact Row
                            Contact()
                          ],
                        ),
                    )
                  ),

                  // Second SizedBox
                  const Expanded(
                    flex: 2,
                    child:
                      SizedBox(width: double.infinity)
                    )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
