import 'package:equatable/equatable.dart';

class SkillTag extends Equatable {
  const SkillTag({required this.label, this.warm = false});
  final String label;
  final bool warm;
  @override
  List<Object?> get props => [label, warm];
}

class SkillCategory extends Equatable {
  const SkillCategory({required this.categoryKey, required this.tags});
  final String categoryKey;
  final List<SkillTag> tags;
  @override
  List<Object?> get props => [categoryKey, tags];
}
