import 'package:equatable/equatable.dart';

import '../domain/entities/profile.dart';

sealed class PortfolioState extends Equatable {
  const PortfolioState();
  @override
  List<Object?> get props => [];
}

class PortfolioInitial extends PortfolioState {
  const PortfolioInitial();
}

class PortfolioLoading extends PortfolioState {
  const PortfolioLoading();
}

class PortfolioLoaded extends PortfolioState {
  const PortfolioLoaded(this.profile);
  final Profile profile;
  @override
  List<Object?> get props => [profile];
}

class PortfolioError extends PortfolioState {
  const PortfolioError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}
