import 'package:dio/dio.dart';
import 'package:osscam_app2/core/exceptions/error_server_model.dart';

class NoTokenFound implements Exception {
  String message =
      "There is No Token in Key called "
      "token"
      "";
}

class ErrorServer implements Exception {
  ErrorModel errorModel;

  ErrorServer({required this.errorModel});
}


void handleDioException(DioException e) {
  if (e.response?.data != null && e.response!.data is Map<String, dynamic>) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw ErrorServer(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );
      case DioExceptionType.sendTimeout:
        throw ErrorServer(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );

      case DioExceptionType.receiveTimeout:
        throw ErrorServer(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );

      case DioExceptionType.badCertificate:
        throw ErrorServer(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );

      case DioExceptionType.cancel:
        throw ErrorServer(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );

      case DioExceptionType.connectionError:
        throw ErrorServer(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );

      case DioExceptionType.unknown:
        throw ErrorServer(
          errorModel: ErrorModel.fromJson(e.response!.data),
        );

      case DioExceptionType.badResponse:
        switch (e.response!.statusCode) {
          case 400: //Bad request
            throw ErrorServer(
              errorModel: ErrorModel.fromJson(e.response!.data),
            );

          case 401: //unauthorized
            throw ErrorServer(
              errorModel: ErrorModel.fromJson(e.response!.data),
            );

          case 403: //forbidden
            throw ErrorServer(
              errorModel: ErrorModel.fromJson(e.response!.data),
            );

          case 404: //not found
            throw ErrorServer(
              errorModel: ErrorModel.fromJson(e.response!.data),
            );

          case 422: //Unprocessable Entity
            throw ErrorServer(
              errorModel: ErrorModel.fromJson(e.response!.data),
            );

          case 504: //server Exception
            throw ErrorServer(
              errorModel: ErrorModel.fromJson(e.response!.data),
            );
        }
    }
  } else {
    throw ErrorServer(
      errorModel: ErrorModel(
        message: "An error occurred, but no additional details were provided.",
      ),
    );
  }
}
