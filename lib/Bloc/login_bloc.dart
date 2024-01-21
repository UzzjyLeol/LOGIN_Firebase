import 'package:flutter_application_12/Repositories/auth_repository.dart';
import 'package:flutter_application_12/Events/login_event.dart';
import 'package:flutter_application_12/States/login_state.dart';
import 'package:flutter_application_12/Validate/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;
  LoginBloc({required this.authRepo}) : super(LoginState.init()){
    on<LoginWithEmailAndPasswordEvent>(_onLoginWithEmailAndPassword);
    on<LoginEmailChangedEvent>(_onLoginEmailChanged);
    on<LoginPasswordChangedEvent>(_onLoginPasswordChanged);
    on<LogoutRequestedEvent>(_onLogout);
  }

  // @override
  // Stream<LoginState> mapEventToState(LoginEvent loginEvent) async* {
  //   if (loginEvent is LoginEmailChangedEvent) {
  //     yield state.copyAndUpdate(isValiEmail: Validator.isValidEmail(loginEvent.email),);
  //   } else if(loginEvent is LoginPasswordChangedEvent) {
  //     yield state.copyAndUpdate(isValidPassword: Validator.isValidPassword(loginEvent.password));
  //   } else if (loginEvent is LoginWithEmailAndPasswordEvent) {
  //     try {
  //       await authRepo.signIn(email: loginEvent.email, password: loginEvent.password);
  //       yield LoginState.success();
  //     } catch(_) {
  //       yield LoginState.failure();
  //     }
  //   }
  // }

  Future<void> _onLoginWithEmailAndPassword(LoginWithEmailAndPasswordEvent loginWithEmailAndPasswordEvent, Emitter<LoginState> emit) async {
    emit(LoginState.loading());
    try {
      await authRepo.signIn(email: loginWithEmailAndPasswordEvent.email, password: loginWithEmailAndPasswordEvent.password);
      emit(LoginState.success());
    } catch (_) {
      emit(LoginState.failure());
    }
  }

  Future<void> _onLogout(LogoutRequestedEvent logOutEvent, Emitter<LoginState> emit) async {
    try {
      await authRepo.signOut();
      emit(LoginState.init());
    } catch (_) {
      emit(LoginState.success());
    }
  }

  Stream<LoginState> _onLoginEmailChanged(LoginEmailChangedEvent loginEmailChangedEvent, Emitter<LoginState> emit) async* {
    yield state.copyAndUpdate(isValiEmail: Validator.isValidEmail(loginEmailChangedEvent.email));
  }

  Stream<LoginState> _onLoginPasswordChanged(LoginPasswordChangedEvent loginPasswordChangedEvent, Emitter<LoginState> emit) async* {
    yield state.copyAndUpdate(isValidPassword: Validator.isValidPassword(loginPasswordChangedEvent.password));
  }
}


