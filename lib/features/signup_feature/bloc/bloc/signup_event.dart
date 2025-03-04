part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

final class RegisterEvent extends SignupEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  RegisterEvent({required this.firstName, required this.lastName, required this.email, required this.password});

  
}
