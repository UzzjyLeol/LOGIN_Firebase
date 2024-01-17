import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
  
}

class AuthenticationEventInit extends AuthenticationEvent {
  AuthenticationEventInit();

}

class AuthenticationEventLoggedIn extends AuthenticationEvent {
  AuthenticationEventLoggedIn();

}

class AuthenticationEventLoggedOut extends AuthenticationEvent {

}

class AuthenticationEventResetPassword extends AuthenticationEvent {
  
}
