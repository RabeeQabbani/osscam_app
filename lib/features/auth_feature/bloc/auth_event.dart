part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class LoginEvent extends AuthEvent {
  final String email;
  final String pasword;

  LoginEvent({required this.email, required this.pasword});
}

final class RegisterEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  RegisterEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}

final class LogoutEvent extends AuthEvent {
  
}
