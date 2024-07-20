// lib/features/auth/presentation/bloc/auth_event.dart
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class SignupEvent extends AuthEvent {
  final String email;
  final String password;

  SignupEvent({required this.email, required this.password});
}
