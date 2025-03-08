part of 'project_bloc.dart';

@immutable
sealed class ProjectEvent {}

class AddProjectEvent extends ProjectEvent {
  final String projectName;
  final String projectDescription;

  AddProjectEvent({
    required this.projectName,
    required this.projectDescription,
  });
}

class DeleteProjectEvent extends ProjectEvent {
  final int projectId;

  DeleteProjectEvent({required this.projectId});
}

class GetOneProjectEvent extends ProjectEvent {
  final int projectId;

  GetOneProjectEvent({required this.projectId});
}

class JoinToProject extends ProjectEvent {
  final int projectId;

  JoinToProject({required this.projectId});
}
