import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:osscam_app2/features/auth_feature/bloc/auth_bloc.dart';
import 'package:osscam_app2/features/auth_feature/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;
setup() async {
  sl.registerSingleton(await SharedPreferences.getInstance());

  sl.registerSingleton<AuthServices>(AuthServicesImple(dio: Dio()));

  sl.registerFactory<AuthBloc>(() => AuthBloc(service: sl<AuthServices>()));
}
