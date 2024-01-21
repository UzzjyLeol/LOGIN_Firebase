import 'package:flutter_application_12/Events/reset_password_event.dart';
import 'package:flutter_application_12/Repositories/auth_repository.dart';
import 'package:flutter_application_12/States/resetpassword_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent,ResetPasswordState> {
  final AuthRepository authRepo;
  ResetPasswordBloc({required this.authRepo}) :super(ResetPasswordInitState()){
    on<ResetPasswordWithEmailEvent>(_onResetPassword);
  }

  Future<void> _onResetPassword(ResetPasswordWithEmailEvent resetPasswordEvent, Emitter<ResetPasswordState> emit) async {
    // emit(ResetPasswordInitState());
    try {
      await authRepo.resetPassword(email: resetPasswordEvent.email);
      emit(ResetPasswordSuccess());
    } catch(_){
      emit(ResetPasswordFailure());
    }
  }
  
}