abstract class LoginEvent {}


class LoginRequested extends LoginEvent {
  final String email;
  final String password;

  LoginRequested({
    required this.email,
    required this.password,
  });
}

class LogoutRequested extends LoginEvent {
  LogoutRequested();
}

class PasswordChanged extends LoginEvent {
  final String password;
  PasswordChanged({required this.password});
}

class SignUpRequested extends LoginEvent{
  final String email;
  final String password;

  SignUpRequested({required this.email,required  this.password});
}

class ResetPasswordRequested extends LoginEvent {
  final String email;

  ResetPasswordRequested({required this.email});
}

