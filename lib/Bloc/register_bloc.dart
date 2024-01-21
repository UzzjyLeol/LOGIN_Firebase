import 'package:flutter_application_12/Events/register_event.dart';
import 'package:flutter_application_12/Repositories/auth_repository.dart';
import 'package:flutter_application_12/States/register_state.dart';
// import 'package:flutter_application_12/Validate/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepo;
  RegisterBloc({required this.authRepo}) : super(RegisterState.init()){
    on<SignUpWithEmailAndPasswordEvent>(_onSignUp);
  }
  
  // @override
  // Stream<RegisterState> mapEventToState(RegisterEvent registerEvent) async* {
  //   if (registerEvent is SignUpEmailChangedEvent) {
  //     yield state.copyAndUpdate(isValiEmail: Validator.isValidEmail(registerEvent.email),);
  //   } else if (registerEvent is SignUpPasswordChangedEvent) {
  //     yield state.copyAndUpdate(isValidPassword: Validator.isValidPassword(registerEvent.password));
  //   } else if (registerEvent is SignUpWithEmailAndPasswordEvent) {
  //     yield RegisterState.loading();
  //     try {
  //       await authRepo.signUp(email: registerEvent.email, password: registerEvent.password);
  //       yield RegisterState.success();
  //     } catch(e) {
  //       yield RegisterState.failure();
  //     }
  //   }
  // }

  Future<void> _onSignUp(SignUpWithEmailAndPasswordEvent signUpEvent, Emitter<RegisterState> emit) async {
    emit(RegisterState.loading());
    try {
      authRepo.signUp(email: signUpEvent.email, password: signUpEvent.password);
      emit(RegisterState.success());
    } catch (_) {
      emit(RegisterState.failure());
    }
  }
}
