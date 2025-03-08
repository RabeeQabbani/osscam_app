// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:osscam_app2/core/config/service_locater.dart';
import 'package:osscam_app2/core/exceptions/service_exception.dart';
import 'package:osscam_app2/features/auth_feature/model/login_model.dart';
import 'package:osscam_app2/features/auth_feature/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthServices service;
  AuthBloc({required this.service}) : super(InitialState()) {
    on<LoginEvent>((event, emit) async {
      try {
        emit(LoadingState());
        AuthModel? response = await service.login(
          email: event.email,
          password: event.pasword,
        );
        sl<SharedPreferences>().setString("token", response!.accessToken);
        emit(LoginSuccessState());
      } on ErrorServer catch (e) {
        emit(FailedState(message: e.errorModel.message));
      }
    });

    on<RegisterEvent>((event, emit) async {
      try {
        emit(LoadingState());
        AuthModel? response = await service.signUp(
          email: event.email,
          password: event.password,
          firstName: event.firstName,
          lastName: event.lastName,
        );
        sl<SharedPreferences>().setString("token", response!.accessToken);
        emit(SignupSuccessState());
      } on ErrorServer catch (e) {
        emit(FailedState(message: e.errorModel.message));
      }
    });

    on<LogoutEvent>((event, emit) async {
      try {
        emit(LoadingState());
        await service.logout();
        emit(LogoutSuccessState());
      } on ErrorServer catch (e) {
        emit(FailedState(message: e.errorModel.message));
      }
    });
  }
}
