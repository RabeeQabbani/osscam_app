part of 'project_bloc.dart';

@immutable
sealed class ProjectState {}

final class ProjectInitial extends ProjectState {}

final class AddProjectLoading extends ProjectState {}

final class AddProjectSuccess extends ProjectState {
  final ProjectModel projectModel;

  AddProjectSuccess({required this.projectModel});
}

final class AddProjectError extends ProjectState {
  final String errorMessage;

  AddProjectError({required this.errorMessage});
}
