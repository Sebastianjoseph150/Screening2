part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignunEvent extends AuthEvent {
  final String username;
  final String password;
  SignunEvent({required this.username, required this.password});
}

class LoginButtonPressed extends AuthEvent {
  final String username;
  final String password;
  LoginButtonPressed({required this.username, required this.password});
}