import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/entities/skill_category.dart';
import '../domain/repositories/skills_repository.dart';

sealed class SkillsState extends Equatable {
  const SkillsState();
  @override
  List<Object?> get props => [];
}

class SkillsInitial extends SkillsState {
  const SkillsInitial();
}

class SkillsLoading extends SkillsState {
  const SkillsLoading();
}

class SkillsLoaded extends SkillsState {
  const SkillsLoaded(this.categories);
  final List<SkillCategory> categories;
  @override
  List<Object?> get props => [categories];
}

class SkillsError extends SkillsState {
  const SkillsError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

class SkillsCubit extends Cubit<SkillsState> {
  SkillsCubit(this._repo) : super(const SkillsInitial());
  final SkillsRepository _repo;

  Future<void> load() async {
    emit(const SkillsLoading());
    final r = await _repo.getSkills();
    r.fold(
      (f) => emit(SkillsError(f.message)),
      (data) => emit(SkillsLoaded(data)),
    );
  }
}
