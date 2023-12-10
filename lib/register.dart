
import 'package:flutter/material.dart';
import 'package:flutter_application_12/login_ui/home.dart';
import 'package:flutter_application_12/login_ui/ui/color_set.dart';
import 'package:flutter_application_12/firebase_services.dart';




class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() => SignUpPageState();

}

class SignUpPageState extends State<SignUpPage> {

  bool passwordVisible = false;
  bool loading = false;
  bool isSubmit = false;
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

  jumpintoHomePage() async {
    setState(() {
      isSubmit = true;
    });

    if (isSubmit) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => const HomePage()
        )
      );
    }
    setState(() {
      isSubmit = false;
    });
  }


  handleSubmit() async {
    final email = emailController.value.text;
    final password = passwordController.value.text;
    setState(() {
      loading = true;
    });

    await FirebaseAuthService().signUpWithEmailAndPassword(email, password);
    jumpintoHomePage();
    setState(() {
      loading = false;
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create an account'),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [ColorSet.gradientColor3, ColorSet.gradientColor4],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
              )
          ),
          child: Stack(
            children: [
                                //Get Infor
                                Column(
                                  children: [
                                                        //Khối Username
                                    Padding(
                                      padding: const EdgeInsets.only(top: 80,left: 400,right: 400),
                                      child:  
                                      TextFormField(
                                        controller: emailController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
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
                                          color: Theme.of(context).primaryColorDark,),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 14,),
                                                        //Khối Password
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(400, 12, 400, 12),
                                      child: TextFormField(
                                        controller: passwordController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
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
                                    const SizedBox(height: 24,),
                                    ElevatedButton(
                                      onPressed: (){
                                        handleSubmit();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black,
                                      ),
                                      child:loading? 
                                        const SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2.0,
                                          ),
                                        )
                                        : const Text('Submit',
                                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: ColorSet.normalText),
                                      )
                                    )
                                  ],
                                ),
            ],
          ),
        )
      ),
    );
  }

}