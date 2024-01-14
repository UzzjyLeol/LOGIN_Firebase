import 'package:flutter_application_12/auth_repository.dart';
import 'package:flutter_application_12/Login/login_event.dart';
import 'package:flutter_application_12/Login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;
  LoginBloc({required this.authRepo}) : super(Initial()){
    on<LoginRequested>(onLogin);
    on<LogoutRequested>(onLogout);
  }

  Future<void> onLogin(LoginRequested event, Emitter<LoginState> emit) async {
    emit(Loading());
    try {
      await authRepo.signIn(
        email: event.email,
        password: event.password);
      emit(Submitted());
    } catch(e) {
      emit(ErrorSubmit());
    }
  }

  Future<void> onLogout(LogoutRequested event, Emitter<LoginState> emit) async {
    try {
      await authRepo.signOut();
    } catch(e) {
      emit(ErrorSubmit());
    }
  }


}


