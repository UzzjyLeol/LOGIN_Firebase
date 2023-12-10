import 'package:flutter/material.dart';
import 'package:flutter_application_12/login_ui/ui/color_set.dart';
import 'package:flutter_application_12/login_ui/ui/contact.dart';
import 'package:flutter_application_12/login_ui/ui/float_background.dart';
import 'package:flutter_application_12/login_ui/ui/login_guide.dart';
import 'package:flutter_application_12/firebase_services.dart';
import 'package:flutter_application_12/register.dart';
import 'package:flutter_application_12/reset_password.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}


class LoginPageState extends State<LoginPage> {

  bool passwordVisible = false;
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegExp passValid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  bool validatePassword(String pass) {
    String password = pass.trim();

    if (passValid.hasMatch(password)) {
      return true;
    } else {
      return false;
    }

  }

  handleSubmit() async {
    if (!_formKey.currentState!.validate()) return ;
    final email = emailController.value.text;
    final password = passwordController.value.text;

    setState(() {
      _loading = true;
    });
    await FirebaseAuthService().signInWithEmailAndPassword(email, password);
    setState(() {
      _loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login App'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Container(
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
                             Column(
                              children: [
                                //Title container
                                const LoginTitle(),

                                //Guide container
                                const LoginGuide(),

                                //Get Infor
                                Column(
                                  children: [
                                                        //Khối Username
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12,left: 140,right: 140),
                                      child:  
                                      TextFormField(
                                        controller: emailController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty == true) {
                                            return "Please enter your email";
                                          } else {
                                            return null;
                                          }
                                        },
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white60,
                                          fontWeight: FontWeight.w400
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hoverColor: const Color.fromARGB(255, 45, 55, 56),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: ColorSet.borderTextField,
                                              width: 2.0,
                                            ),
                                          ),
                                          labelText: null,
                                          hintText: 'Username',
                                          hintStyle: const TextStyle(
                                            color: ColorSet.hintText_,
                                            letterSpacing: 1,
                                            fontSize: 18
                                          ),
                                          suffixIcon: Icon(Icons.email,
                                          color: Theme.of(context).primaryColorDark,)
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 14,),
                                                        //Khối Password
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(140, 12, 140, 12),
                                      child: TextFormField(
                                        controller: passwordController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty == true) {
                                            return 'Please enter your password';
                                          } else {
                                            if (validatePassword(value)) {
                                              return null;
                                            } else {
                                              return 'Password must contain Capital, Small letter, Number and Special!';
                                            }
                                          }
                                        },
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white60
                                        ),
                                        obscureText: !passwordVisible,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: ColorSet.borderTextField,
                                              width: 2.0,
                                            )
                                          ),
                                          labelText: null,
                                          hintText: "Password",
                                          hintStyle: const TextStyle(
                                            color: ColorSet.hintText_,
                                            letterSpacing: 1,
                                            fontSize: 18
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: (){
                                              setState(() {
                                                passwordVisible = !passwordVisible;
                                              });
                                            },
                                            icon: passwordVisible? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                                            color: Theme.of(context).primaryColorDark,
                                            ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                //TextButton ->Forgot
                                Padding(
                                  padding: const EdgeInsets.only(top: 18),
                                  child: TextButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => const ForgotPasswordPage()
                                        ),
                                      );
                                    },
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
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 16,bottom: 16),
                                  child: TextButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => const SignUpPage()
                                        )
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.black
                                      ),
                                    child: 
                                      const Text('Create Account',
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
                                ),

                                //Submit ElevatedButton ->Login
                                OutlinedButton(
                                        onPressed: (){handleSubmit();},
                                        style: OutlinedButton.styleFrom(
                                          backgroundColor: Colors.black87,
                                          foregroundColor: const Color.fromARGB(255, 195, 214, 202),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                                          side: const BorderSide(width: 1.7, color: ColorSet.borderButton)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(18, 8, 18, 12),
                                          child: _loading?
                                          const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2,
                                            ),
                                          ) : const Text('Login',style: TextStyle(fontSize: 20),),
                                        )
                                      ),
                                const SizedBox(height: 34),

                                //Contact Row
                                const Contact()
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
          )
        )
    );
  }
}