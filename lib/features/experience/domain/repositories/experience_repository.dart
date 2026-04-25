import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/experience.dart';

abstract class ExperienceRepository {
  Future<Either<Failure, List<Experience>>> getExperience();
}
