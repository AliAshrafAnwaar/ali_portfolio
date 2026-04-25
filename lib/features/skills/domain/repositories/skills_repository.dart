import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/skill_category.dart';

abstract class SkillsRepository {
  Future<Either<Failure, List<SkillCategory>>> getSkills();
}
