// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:osscam_app2/core/exceptions/service_exception.dart';
import 'package:osscam_app2/features/project_manger_feature/model/project_model.dart';
import 'package:osscam_app2/features/project_manger_feature/service/project_service.dart';
part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectService service;
  ProjectBloc({required this.service}) : super(ProjectInitial()) {
    on<AddProjectEvent>((event, emit) async {
      try {
        emit(ProjectLoading());
        ProjectModel? response = await service.addNewProject(
          projectName: event.projectName,
          projectDescription: event.projectDescription,
        );
        emit(AddProjectSuccess(projectModel: response!));
      } on ErrorServer catch (e) {
        emit(ProjectError(errorMessage: e.errorModel.message));
      }
    });

    on<DeleteProjectEvent>((event, emit) async {
      try {
        emit(ProjectLoading());
        await service.deleteOneProjectById(id: event.projectId);
        emit(DeleteProjectSuccess());
      } on ErrorServer catch (e) {
        emit(ProjectError(errorMessage: e.errorModel.message));
      }
    });

    on<GetOneProjectEvent>((event, emit) async {
      try {
        emit(ProjectLoading());
        ProjectModel? projectModel = await service.getOneProjectById(
          id: event.projectId,
        );
        emit(GetOneProjectSuccess(projectModel: projectModel!));
      } on ErrorServer catch (e) {
        emit(ProjectError(errorMessage: e.errorModel.message));
      }
    });

    on<JoinToProject>((event, emit) async {
      try {
        emit(ProjectLoading());
        await service.joinUserToProjectById(id: event.projectId);
        emit(JoinToProjectSuccess());
        // final response = await projectService.getOneProjectById(
        //   id: event.projectId,
        // );
        // if (response != null) {
        //   await projectService.joinUserToProjectById(id: event.projectId);
        //   emit(JoinToProjectSuccess());
        // } else {
        //   emit(ProjectError(errorMessage: "Faild to Get Project"));
        // }
      } on ErrorServer catch (e) {
        emit(ProjectError(errorMessage: e.errorModel.message));
      }
    });
  }
}
