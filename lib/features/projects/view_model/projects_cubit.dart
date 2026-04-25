import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/entities/project.dart';
import '../domain/repositories/projects_repository.dart';

sealed class ProjectsState extends Equatable {
  const ProjectsState();
  @override
  List<Object?> get props => [];
}

class ProjectsInitial extends ProjectsState {
  const ProjectsInitial();
}

class ProjectsLoading extends ProjectsState {
  const ProjectsLoading();
}

class ProjectsLoaded extends ProjectsState {
  const ProjectsLoaded(this.items);
  final List<Project> items;
  @override
  List<Object?> get props => [items];
}

class ProjectsError extends ProjectsState {
  const ProjectsError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

class ProjectsCubit extends Cubit<ProjectsState> {
  ProjectsCubit(this._repo) : super(const ProjectsInitial());
  final ProjectsRepository _repo;

  Future<void> load() async {
    emit(const ProjectsLoading());
    final r = await _repo.getProjects();
    r.fold(
      (f) => emit(ProjectsError(f.message)),
      (data) => emit(ProjectsLoaded(data)),
    );
  }
}
