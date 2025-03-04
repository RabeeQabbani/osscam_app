part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginFailedState extends LoginState {
  final String message;
  LoginFailedState({required this.message});
}

final class LoginSuccessState extends LoginState {}

final class LoginLoadingState extends LoginState {}
