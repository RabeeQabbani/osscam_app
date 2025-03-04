part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitialState extends SignupState {}

final class SignupSuccessState extends SignupState {}

final class SignupFailedState extends SignupState {
  final String message;

  SignupFailedState({required this.message});
}

final class SignupLoadingState extends SignupState {}
