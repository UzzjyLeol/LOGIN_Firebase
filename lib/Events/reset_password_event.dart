import 'package:equatable/equatable.dart';

abstract class ResetPasswordEvent extends Equatable {}

class ResetPasswordEmailChangedEvent extends ResetPasswordEvent {
  final String email;
  //constructor
  ResetPasswordEmailChangedEvent({required this.email});
  @override
  List <Object> get props => [email];
  @override
  String toString() => 'ResetPasswordEventEmailChanged: $email';
}

class ResetPasswordWithEmailEvent extends ResetPasswordEvent {
  final String email;
  ResetPasswordWithEmailEvent({required this.email});
  
  @override
  List<Object?> get props => [email];
  @override
  String toString() => 'ResetPasswordEmailChangedEvent: $email';
}