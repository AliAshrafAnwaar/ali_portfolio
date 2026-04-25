import 'package:dartz/dartz.dart';

import '../../../../core/error/error_mapper.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/skill_category.dart';
import '../../domain/repositories/skills_repository.dart';
import '../datasources/skills_factory_ds.dart';

class SkillsRepositoryImpl implements SkillsRepository {
  SkillsRepositoryImpl(this._ds);
  final SkillsDataSource _ds;

  @override
  Future<Either<Failure, List<SkillCategory>>> getSkills() async {
    try {
      return Right(await _ds.getSkills());
    } catch (e) {
      return Left(mapDioError(e));
    }
  }
}
