import 'package:flutter_application_12/Login/login_event.dart';
import 'package:flutter_application_12/Login/login_state.dart';
import 'package:flutter_application_12/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordBloc extends Bloc<LoginEvent,LoginState> {
  final AuthRepository authRepo;
  ResetPasswordBloc({required this.authRepo}) :super(Initial()) {
    on<ResetPasswordRequested>(onresetPassword);
    // ((event, emit) async {
    //   try {
    //     await authRepo.resetPassword(email: event.email);
    //     emit(Submitted());
    //   } catch(e) {
    //     emit(ErrorSubmit());
    //   }
    // });
  }

  Future<void> onresetPassword(ResetPasswordRequested event, Emitter<LoginState> emit) async {
    emit(Initial());
    try {
      await authRepo.resetPassword(email: event.email);
      emit(Submitted());
    } catch(e) {
      emit(ErrorSubmit());
    }
  }
}