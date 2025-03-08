part of 'project_bloc.dart';

@immutable
sealed class ProjectState {}

final class ProjectInitial extends ProjectState {}

final class ProjectLoading extends ProjectState {}

final class ProjectError extends ProjectState {
  final String errorMessage;

  ProjectError({required this.errorMessage});
}

final class AddProjectSuccess extends ProjectState {
  final ProjectModel projectModel;

  AddProjectSuccess({required this.projectModel});
}

final class DeleteProjectSuccess extends ProjectState {}

final class GetOneProjectSuccess extends ProjectState {
  final ProjectModel projectModel;
  GetOneProjectSuccess({required this.projectModel});
}

final class JoinToProjectSuccess extends ProjectState {}
