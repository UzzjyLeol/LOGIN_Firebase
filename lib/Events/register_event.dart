import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {

}

class SignUpEmailChangedEvent extends RegisterEvent {
  final String email;
  //constructor
  SignUpEmailChangedEvent({required this.email});
  @override
  List <Object> get props => [email];
  @override
  String toString() => 'RegisterEmailChanged {email: $email}';
}

class SignUpPasswordChangedEvent extends RegisterEvent {
  final String password;
  //constructor
  SignUpPasswordChangedEvent({required this.password});
  @override
  List <Object> get props => [password];
  @override
  String toString() => 'RegisterPasswordChanged {password: $password}';

}

class SignUpWithEmailAndPasswordEvent extends RegisterEvent{
  final String email;
  final String password;

  SignUpWithEmailAndPasswordEvent({required this.email,required  this.password});
  
  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
  @override
  String toString() => 'Submitted {email :$email, password:$password}';
}

class SignUpEventInit extends RegisterEvent {
  SignUpEventInit();
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}