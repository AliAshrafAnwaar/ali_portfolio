import 'package:dartz/dartz.dart';

import '../../../../core/error/error_mapper.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/experience.dart';
import '../../domain/repositories/experience_repository.dart';
import '../datasources/experience_factory_ds.dart';

class ExperienceRepositoryImpl implements ExperienceRepository {
  ExperienceRepositoryImpl(this._ds);
  final ExperienceDataSource _ds;

  @override
  Future<Either<Failure, List<Experience>>> getExperience() async {
    try {
      return Right(await _ds.getExperience());
    } catch (e) {
      return Left(mapDioError(e));
    }
  }
}
