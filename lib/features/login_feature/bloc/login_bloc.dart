// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:osscam_app2/core/config/service_locater.dart';
import 'package:osscam_app2/core/exceptions/service_exception.dart';
import 'package:osscam_app2/features/login_feature/model/login_model.dart';
import 'package:osscam_app2/features/login_feature/service/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthServices service;
  LoginBloc({required this.service}) : super(LoginInitialState()) {
    on<LoggingEvent>((event, emit) async {
      try {
        emit(LoginLoadingState());
        AuthModel? response = await service.login(
          email: event.email,
          password: event.pasword,
        );
        sl<SharedPreferences>().setString("token",  response!.accessToken);
        emit(LoginSuccessState());
      } on ErrorServer catch (e) {
        emit(LoginFailedState(message: e.errorModel.message));
      }
    });
  }
}
