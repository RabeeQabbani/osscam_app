// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:dio/dio.dart';
import 'package:osscam_app2/constants/constant_url.dart';
import 'package:osscam_app2/core/config/header_config.dart';
import 'package:osscam_app2/core/exceptions/service_exception.dart';
import 'package:osscam_app2/features/auth_feature/model/login_model.dart';

abstract class AuthServices {
  Future<AuthModel?> login({required String email, required String password});
  
  logout();
  
  Future<AuthModel?> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
}

class AuthServicesImple extends AuthServices {
  Dio dio;
  AuthServicesImple({required this.dio});

  @override
  Future<AuthModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        ConstantUrl.login,
        data: {"email": email, "password": password},
        options: HeaderConfig.getHeader(useToken: false),
      );
      AuthModel loginModel = AuthModel.fromJson(response.data);
      return loginModel;
    } on DioException catch (e) {
      handleDioException(e);
      return null;
    }
  }

  @override
  logout() async {
    try {
        await dio.put(
        ConstantUrl.logout,
        options: HeaderConfig.getHeader(useToken: true),
      );
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<AuthModel?> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final response = await dio.post(
        ConstantUrl.signUp,
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "role": "USER",
        },
        options: HeaderConfig.getHeader(useToken: false),
      );
      AuthModel authModel = AuthModel.fromJson(response.data);
      return authModel;
    } on DioException catch (e) {
      handleDioException(e);
      return null;
    }
  }
}