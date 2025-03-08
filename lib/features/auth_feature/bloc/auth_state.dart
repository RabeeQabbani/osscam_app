part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class InitialState extends AuthState {}

final class LoadingState extends AuthState {}

final class FailedState extends AuthState {
  final String message;
  FailedState({required this.message});
}

final class LoginSuccessState extends AuthState {}

final class LogoutSuccessState extends AuthState {}

final class SignupSuccessState extends AuthState {}
