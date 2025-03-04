import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:osscam_app2/core/exceptions/service_exception.dart';
import 'package:osscam_app2/features/create_and_join_feature/model/project_model.dart';
import 'package:osscam_app2/features/create_and_join_feature/service/project_service.dart';
import 'package:osscam_app2/features/create_project_feature/model/project_model.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectService projectService;
  ProjectBloc({required this.projectService}) : super(ProjectInitial()) {
    on<AddProjectEvent>((event, emit) async {
      try {
        emit(AddProjectLoading());
        ProjectModel? response = await projectService.addNewProject(
          projectName: event.projectName,
          projectDescription: event.projectDescription,
        );
        emit(AddProjectSuccess(projectModel: response!));
      } on ErrorServer catch (e) {
        emit(AddProjectError(errorMessage: e.errorModel.message));
      }
    });
  }
}
