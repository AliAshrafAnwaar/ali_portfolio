import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/repositories/portfolio_repository.dart';
import 'portfolio_state.dart';

/// ViewModel for the umbrella portfolio data (profile + stats + contact info).
class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit(this._repo) : super(const PortfolioInitial());
  final PortfolioRepository _repo;

  Future<void> load() async {
    emit(const PortfolioLoading());
    final result = await _repo.getProfile();
    result.fold(
      (failure) => emit(PortfolioError(failure.message)),
      (profile) => emit(PortfolioLoaded(profile)),
    );
  }
}
