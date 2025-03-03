part of 'project_bloc.dart';

@immutable
sealed class ProjectEvent {}

class CreatingProject extends ProjectEvent {}
