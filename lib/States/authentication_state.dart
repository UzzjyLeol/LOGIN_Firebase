import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';


abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List <Object?> get props => [];
}

class AuthenticationStateInit extends AuthenticationState {}

class AuthenticationStateSuccess extends AuthenticationState {
  final User firebaseUser;
  const AuthenticationStateSuccess({required this.firebaseUser});
  @override
  List <Object?> get props => [firebaseUser];
  @override
  String toString() => 'AuthenticationStateSuccess, email: ${firebaseUser.email}';
}

class AuthenticationStateFailure extends AuthenticationState {
  
}