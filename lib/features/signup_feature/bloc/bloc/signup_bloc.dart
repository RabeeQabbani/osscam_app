// ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:osscam_app2/core/config/service_locater.dart';
import 'package:osscam_app2/core/exceptions/service_exception.dart';
import 'package:osscam_app2/features/login_feature/model/login_model.dart';
import 'package:osscam_app2/features/login_feature/service/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  AuthServices service;
  SignupBloc({required this.service}) : super(SignupInitialState()) {
    on<RegisterEvent>((event, emit) async {
      try {
        emit(SignupLoadingState());
        AuthModel? response = await service.signUp(
          email: event.email,
          password: event.password,
          firstName: event.firstName,
          lastName: event.lastName,
        );
        sl<SharedPreferences>().setString("token", response!.accessToken);
        emit(SignupSuccessState());
      } on ErrorServer catch (e) {
        emit(SignupFailedState(message: e.errorModel.message));
      }
    });
  }
}
