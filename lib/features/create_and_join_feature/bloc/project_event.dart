part of 'project_bloc.dart';

@immutable
sealed class ProjectEvent {}

class AddProjectEvent extends ProjectEvent {
  final String projectName;
  final String projectDescription;

  AddProjectEvent({required this.projectName, required this.projectDescription});

}
