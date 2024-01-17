import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginEmailChangedEvent extends LoginEvent {
  final String email;
  //constructor
  LoginEmailChangedEvent({required this.email});
  @override
  List <Object> get props => [email];
  @override
  String toString() => 'LoginEventEmailChanged: $email';
}

class LoginPasswordChangedEvent extends LoginEvent {
  final String password;
  //constructor
  LoginPasswordChangedEvent({required this.password});
  @override
  List <Object> get props => [password];
  @override
  String toString() => 'LoginEventPasswordChanged: $password';

}

class LoginWithEmailAndPasswordEvent extends LoginEvent {
  final String email;
  final String password;

  LoginWithEmailAndPasswordEvent({
    required this.email,
    required this.password,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [email,password];
  @override
  String toString() => 'LoginWithEmailAndPasswordEvent, email = $email, password = $password';
}

class LogoutRequested extends LoginEvent {
  LogoutRequested();
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

