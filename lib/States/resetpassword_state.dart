import 'package:equatable/equatable.dart';

class ResetPasswordState extends Equatable {
  const ResetPasswordState();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ResetPasswordInitState extends ResetPasswordState{

}

class ResetPasswordSuccess extends ResetPasswordState {

}

class ResetPasswordFailure extends ResetPasswordState {
  
}