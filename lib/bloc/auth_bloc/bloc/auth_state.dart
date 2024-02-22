part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class SigninEvaluateState extends AuthState {}

class SiginSuccesstate extends AuthState {}

class SigninFailuerState extends AuthState {
  final String error;
  SigninFailuerState({required this.error});
}

class LoginEvaluateState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginFailuerState extends AuthState {
  final String loginerror;
  LoginFailuerState({required this.loginerror});
}

class LoginSuccessState extends AuthState {}
