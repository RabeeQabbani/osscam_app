part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoggingEvent extends LoginEvent {
  final String email;
  final String pasword;

  LoggingEvent({required this.email,required this.pasword});
}
