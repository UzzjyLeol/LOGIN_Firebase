import 'package:flutter/material.dart';
import 'package:flutter_application_12/Bloc/authentication_bloc.dart';
import 'package:flutter_application_12/Bloc/login_bloc.dart';
import 'package:flutter_application_12/Events/authentication_event.dart';
import 'package:flutter_application_12/Events/login_event.dart';
import 'package:flutter_application_12/Repositories/auth_repository.dart';
import 'package:flutter_application_12/States/login_state.dart';
import 'package:flutter_application_12/Login/login_ui/home.dart';
import 'package:flutter_application_12/Login/login_ui/ui/color_set.dart';
import 'package:flutter_application_12/Login/login_ui/ui/contact.dart';
import 'package:flutter_application_12/Login/login_ui/ui/float_background.dart';
import 'package:flutter_application_12/Login/login_ui/ui/login_guide.dart';
import 'package:flutter_application_12/Register/register.dart';
import 'package:flutter_application_12/Reset_password/reset_password.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class LoginPage extends StatefulWidget {
  final AuthRepository _authRepository;
  const LoginPage({Key? key, required AuthRepository authRepository}):
  assert(authRepository != null),
  _authRepository = authRepository,
  super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}


class LoginPageState extends State<LoginPage> {


  bool passwordVisible = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late LoginBloc _loginBloc;
  // AuthRepository get _authRepository => widget._authRepository;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    emailController.addListener(() {
      _loginBloc.add(LoginEmailChangedEvent(email: emailController.text));
    });
    passwordController.addListener(() {
      _loginBloc.add(LoginPasswordChangedEvent(password: passwordController.text));
    });
  }

  bool get isPopulated  => emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login App'),
      ),
      body: SafeArea(
        child: BlocBuilder<LoginBloc, LoginState> (
          builder: (context, loginState) {
            if (loginState.isFailure) {
              print('Failed');
            } else if (loginState.isSubmitting) {
              print('Logging in');
            } else if (loginState.isSuccess) {
              BlocProvider.of<AuthenticationLoginBloc>(context).add(AuthenticationEventLoggedIn());
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(  
                child: Container(
                  // Set background color
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
                      Row(
                        children: [
                          // First SizedBox
                          const Expanded(
                            flex: 2,
                            child:
                              SizedBox(width: double.infinity,)
                            ),

                          //Login Box
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin:const EdgeInsets.only(top: 120,bottom: 42),
                              color: Colors.black87,
                              child: 
                                Column(
                                  children: [
                                    //Title container
                                    const LoginTitle(),

                                    //Guide container
                                    const LoginGuide(),

                                    //Get Infor
                                    Column(
                                      children: [
                                        //Email Field
                                        Padding(
                                          padding: const EdgeInsets.only(top: 12,left: 140,right: 140),
                                          child:  
                                          TextFormField(
                                            controller: emailController,
                                            validator: (_) {
                                              return loginState.isValidEmail ? null : 'Invalid!';
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
                                        //Password Field
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(140, 12, 140, 12),
                                          child: TextFormField(
                                              controller: passwordController,
                                              validator: (_) {
                                                return loginState.isValidPassword ? null : 'Invalid';
                                              },
                                              onChanged: (value) => context.read<LoginBloc>().add(LoginPasswordChangedEvent(password: value)),
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

                                    //Forgot Password
                                    Padding(
                                      padding: const EdgeInsets.only(top: 18),
                                      child: TextButton(
                                        onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => ForgotPasswordPage()
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

                                    //Login Submitter
                                    BlocListener<LoginBloc, LoginState>(
                                      listener: (context, loginState) {
                                        if (loginState.isSuccess) {
                                          ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Login successful!'),));
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(), ), );
                                        }
                                      },
                                      child: OutlinedButton(
                                              onPressed: (){
                                                _loginBloc.add(
                                                  LoginWithEmailAndPasswordEvent(email: emailController.text, password: passwordController.text)
                                                );
                                              },
                                              style: OutlinedButton.styleFrom(
                                                backgroundColor: Colors.black87,
                                                foregroundColor: const Color.fromARGB(255, 195, 214, 202),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                                                side: const BorderSide(width: 1.7, color: ColorSet.borderButton)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(18, 8, 18, 12),
                                                child: BlocBuilder<LoginBloc, LoginState>(
                                                  builder: (context, loginState) {
                                                    if (loginState.isSubmitting) {
                                                      return  const SizedBox(
                                                                    width: 20,
                                                                    height: 20,
                                                                    child: CircularProgressIndicator(
                                                                      color: Colors.white,
                                                                      strokeWidth: 2,
                                                                    ),
                                                                  );
                                                    } else {
                                                      return const Text('Login',style: TextStyle(fontSize: 20));
                                                    }
                                                  },
                                                )

                                              ),
                                              )
                                            ),
                                    const SizedBox(height: 34),

                                    //Contact
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
              );
          },
        )
      )
    );
  }
}