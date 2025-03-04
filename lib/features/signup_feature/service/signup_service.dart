// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:dio/dio.dart';
import 'package:osscam_app2/features/signup_feature/model/signup_model.dart';

class SignupService {
  Dio dio;
  SignupService({required this.dio});

  late Response response;
  String baseUrl = "http://199.192.19.220:3011/api/v1/auth/register";

  Future<bool> signUp(SignupModel model) async {
    try {
      response = await dio.post(baseUrl, data: model.toMap());
      
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
