import 'package:dartz/dartz.dart';

import '../../../../core/error/error_mapper.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../datasources/portfolio_factory_ds.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  PortfolioRepositoryImpl(this._ds);
  final PortfolioDataSource _ds;

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    try {
      final result = await _ds.getProfile();
      return Right(result);
    } catch (e) {
      return Left(mapDioError(e));
    }
  }
}
