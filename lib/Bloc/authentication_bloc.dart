import 'package:flutter_application_12/Events/authentication_event.dart';
import 'package:flutter_application_12/Repositories/auth_repository.dart';
import 'package:flutter_application_12/States/authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationLoginBloc extends Bloc<AuthenticationEvent,AuthenticationState> {
  final AuthRepository authRepository;
  AuthenticationLoginBloc({required this.authRepository}) :super(AuthenticationStateInit()){
    on<AuthenticationEventInit>(_onAuthenticationEventInit);
    on<AuthenticationEventLoggedIn>(_onAuthenticationEventLoggedIn);
  }
  
  // @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent authenticationEvent) async*{
    if (authenticationEvent is AuthenticationEventInit) {
      final isSignedIn = await authRepository.isSignedIn();
      if (isSignedIn) {
        final firebaseUser = await authRepository.getUser();
        yield AuthenticationStateSuccess(firebaseUser: firebaseUser);
      } else {
        yield AuthenticationStateFailure();
      }
    } else if (authenticationEvent is AuthenticationEventLoggedIn) {
      yield AuthenticationStateSuccess(firebaseUser: await authRepository.getUser());
    } else if (authenticationEvent is AuthenticationEventLoggedOut) {
      authRepository.signOut();
      yield AuthenticationStateFailure();
    }
  }

  Future<void> _onAuthenticationEventInit(AuthenticationEvent authEvent, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationStateInit());
  }

  Future<void> _onAuthenticationEventLoggedIn(AuthenticationEvent authEvent, Emitter<AuthenticationState> emit) async {
    
  }
}