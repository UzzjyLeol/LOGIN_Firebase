import 'package:flutter/material.dart';
import 'package:flutter_application_12/Login/login_event.dart';
import 'package:flutter_application_12/Reset_password/reset_password_bloc.dart';
import 'package:flutter_application_12/Login/login_ui/ui/color_set.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override 
  ForgotPasswordPageState createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final TextEditingController forgotPasswordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [ColorSet.gradientColor3,ColorSet.gradientColor4],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              )
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: SizedBox(width: double.infinity,)
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          const SizedBox(height: 140,),
                          TextFormField(
                            controller: forgotPasswordController,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: ColorSet.normalText,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email,color: Theme.of(context).primaryColorDark,),
                              hintText: 'Email',
                              hintStyle: const TextStyle(color: ColorSet.hintText_,fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                                borderSide: const BorderSide(
                                  width: 2.0,
                                  color: ColorSet.borderTextField,
                                )
                              )
                            ),
                          ),
                          const SizedBox(height: 24,),
                          ElevatedButton(
                            onPressed: (){
                              BlocProvider.of<ResetPasswordBloc>(context).add(ResetPasswordRequested(email: forgotPasswordController.text));
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            child: 
                            const Text('Submit',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: ColorSet.normalText,
                              fontSize: 16,
                            ),
                            ),
                          )
                        ],
                      )
                    ),
                  const Expanded(
                    flex: 2,
                    child: SizedBox(width: double.infinity,)
                    ),
                ],
              ),
            ],
          )
        )
      ),
    );
  }
}