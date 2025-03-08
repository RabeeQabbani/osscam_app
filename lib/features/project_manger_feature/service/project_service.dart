import 'package:dio/dio.dart';
import 'package:osscam_app2/constants/constant_url.dart';
import 'package:osscam_app2/core/config/header_config.dart';
import 'package:osscam_app2/core/exceptions/service_exception.dart';
import 'package:osscam_app2/features/project_manger_feature/model/project_model.dart';

abstract class ProjectService {
  Future<ProjectModel?> getOneProjectById({required int id});

  Future<ProjectModel?> editOneProjectById({
    required String id,
    required String projectName,
    required String projectDescription,
  });

  deleteOneProjectById({required int id});


  Future<List<ProjectModel>> getAllProjects();

  Future<ProjectModel?> addNewProject({
    required String projectName,
    required String projectDescription,
  });

  joinUserToProjectById({required int id});
}

class ProjectServiceImple extends ProjectService {
  Dio dio;
  ProjectServiceImple({required this.dio});

  @override
  Future<ProjectModel?> addNewProject({
    required String projectName,
    required String projectDescription,
  }) async {
    try {
      final response = await dio.post(
        ConstantUrl.projects,
        data: {
          "projectName": projectName,
          "projectDescription": projectDescription,
          "projectStatus": "",
        },
        options: HeaderConfig.getHeader(useToken: true),
      );
      ProjectModel projectModel = ProjectModel.fromJson(response.data);
      return projectModel;
    } on DioException catch (e) {
      handleDioException(e);
      return null;
    }
  }

  @override
  deleteOneProjectById({required int id}) async {
    try {
      await dio.delete(
        "${ConstantUrl.projects}/$id",
        options: HeaderConfig.getHeader(useToken: true),
      );
    } on DioException catch (e) {
      handleDioException(e);
      return null;
    }
  }

  @override
  Future<ProjectModel?> editOneProjectById({
    required String id,
    required String projectName,
    required String projectDescription,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<ProjectModel>> getAllProjects() {
    throw UnimplementedError();
  }

  @override
  Future<ProjectModel?> getOneProjectById({required int id}) async {
    try {
      final response = await dio.get(
        "${ConstantUrl.projects}/$id",
        options: HeaderConfig.getHeader(useToken: true),
      );
      ProjectModel projectModel = ProjectModel.fromJson(response.data);
      return projectModel;
    } on DioException catch (e) {
      handleDioException(e);
      return null;
    }
  }

  @override
  joinUserToProjectById({required int id}) async {
    try {
      await dio.post(
        "${ConstantUrl.projects}/$id/new-user-to-project",
        options: HeaderConfig.getHeader(useToken: true),
      );
    } on DioException catch (e) {
      handleDioException(e);
      return null;
    }
  }
}
