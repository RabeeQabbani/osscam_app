import 'package:dio/dio.dart';
import 'package:osscam_app2/constants/constant_url.dart';
import 'package:osscam_app2/core/config/header_config.dart';
import 'package:osscam_app2/core/exceptions/service_exception.dart';
import 'package:osscam_app2/features/create_and_join_feature/model/project_model.dart';

abstract class ProjectService {
  Future<ProjectModel?> getOnProjectById({required String id});
  Future<ProjectModel?> editOnProjectById({
    required String id,
    required String projectName,
    required String projectDescription,
  });
  Future<ProjectModel?> deleteOnprojectById({required String id});
  Future<List<ProjectModel>> getAllProjectBy();
  Future<ProjectModel?> addNewProject({
    required String projectName,
    required String projectDescription,
  });
  joinUserToProjectById({required String id});
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
  Future<ProjectModel?> deleteOnprojectById({required String id}) {
    // TODO: implement deleteOnprojectById
    throw UnimplementedError();
  }

  @override
  Future<ProjectModel?> editOnProjectById({
    required String id,
    required String projectName,
    required String projectDescription,
  }) {
    // TODO: implement editOnProjectById
    throw UnimplementedError();
  }

  @override
  Future<List<ProjectModel>> getAllProjectBy() {
    // TODO: implement getAllProjectBy
    throw UnimplementedError();
  }

  @override
  Future<ProjectModel?> getOnProjectById({required String id}) {
    // TODO: implement getOnProjectById
    throw UnimplementedError();
  }

  @override
  joinUserToProjectById({required String id}) {
    // TODO: implement joinUserToProjectById
    throw UnimplementedError();
  }
}
