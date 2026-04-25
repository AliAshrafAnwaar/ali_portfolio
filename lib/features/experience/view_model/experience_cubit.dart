import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/entities/experience.dart';
import '../domain/repositories/experience_repository.dart';

sealed class ExperienceState extends Equatable {
  const ExperienceState();
  @override
  List<Object?> get props => [];
}

class ExperienceInitial extends ExperienceState {
  const ExperienceInitial();
}

class ExperienceLoading extends ExperienceState {
  const ExperienceLoading();
}

class ExperienceLoaded extends ExperienceState {
  const ExperienceLoaded(this.items);
  final List<Experience> items;
  @override
  List<Object?> get props => [items];
}

class ExperienceErrorState extends ExperienceState {
  const ExperienceErrorState(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

class ExperienceCubit extends Cubit<ExperienceState> {
  ExperienceCubit(this._repo) : super(const ExperienceInitial());
  final ExperienceRepository _repo;

  Future<void> load() async {
    emit(const ExperienceLoading());
    final r = await _repo.getExperience();
    r.fold(
      (f) => emit(ExperienceErrorState(f.message)),
      (data) => emit(ExperienceLoaded(data)),
    );
  }
}
