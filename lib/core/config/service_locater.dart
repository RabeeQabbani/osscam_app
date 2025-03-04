import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:osscam_app2/features/login_feature/bloc/login_bloc.dart';
import 'package:osscam_app2/features/login_feature/service/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;
setup() async {
  sl.registerSingleton(await SharedPreferences.getInstance());

  sl.registerSingleton<AuthServices>(AuthServicesImple(dio: Dio()));

  sl.registerFactory<LoginBloc>(() => LoginBloc(service: sl<AuthServices>()));
}
