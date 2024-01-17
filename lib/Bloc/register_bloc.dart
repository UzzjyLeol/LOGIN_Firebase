import 'package:flutter_application_12/Events/register_event.dart';
import 'package:flutter_application_12/Repositories/auth_repository.dart';
import 'package:flutter_application_12/States/register_state.dart';
import 'package:flutter_application_12/Validate/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepo;
  RegisterBloc({required this.authRepo}) : super(RegisterState.init());
  
  // @override
  Stream<RegisterState> mapEventToState(RegisterEvent registerEvent) async* {
    if (registerEvent is SignUpEmailChangedEvent) {
      yield state.copyAndUpdate(isValiEmail: Validator.isValidEmail(registerEvent.email),);
    } else if (registerEvent is SignUpPasswordChangedEvent) {
      yield state.copyAndUpdate(isValidPassword: Validator.isValidPassword(registerEvent.password));
    } else if (registerEvent is SignUpWithEmailAndPassword) {
      yield RegisterState.loading();
      try {
        await authRepo.signUp(email: registerEvent.email, password: registerEvent.password);
        yield RegisterState.success();
      } catch(e) {
        yield RegisterState.failure();
      }
    }
  }
}
