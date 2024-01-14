import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {

}

class Initial extends LoginState {
  Initial();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class Loading extends LoginState {
  
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class Submitted extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ErrorSubmit extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class CheckFieldState {

  final String? password;
  bool get isValidPassword => validatePassword(password) == true; 
  CheckFieldState({this.password});

  RegExp passValid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  bool validatePassword(String? pass) {
    if (pass == null){
      return false;
    } else {
      String? passwordChecker = pass.trim();

      if (passValid.hasMatch(passwordChecker)) {
        return true;
      } else {
        return false;
      }
    }
  }
}

