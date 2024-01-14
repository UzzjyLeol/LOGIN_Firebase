import 'package:flutter_application_12/auth_repository.dart';
import 'package:flutter_application_12/Login/login_event.dart';
import 'package:flutter_application_12/Login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;
  RegisterBloc({required this.authRepo}) : super(Initial()){
    on<SignUpRequested>((event, emit) async {
      emit(Initial());
      try{
        await authRepo.signUp(email: event.email, password: event.password);
        emit(Submitted());
      } catch(e){
        emit(ErrorSubmit());
      }
    });
  }
}
