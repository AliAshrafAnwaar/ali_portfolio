import 'package:dartz/dartz.dart';

import '../../../../core/error/error_mapper.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/project.dart';
import '../../domain/repositories/projects_repository.dart';
import '../datasources/projects_factory_ds.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  ProjectsRepositoryImpl(this._ds);
  final ProjectsDataSource _ds;

  @override
  Future<Either<Failure, List<Project>>> getProjects() async {
    try {
      return Right(await _ds.getProjects());
    } catch (e) {
      return Left(mapDioError(e));
    }
  }
}
