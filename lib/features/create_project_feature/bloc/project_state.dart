part of 'project_bloc.dart';

@immutable
sealed class ProjectState {}

final class ProjectInitial extends ProjectState {}

final class ProjectCreatedSuccessfully extends ProjectState {}

final class Loading extends ProjectState {}

final class Error extends ProjectState {}
