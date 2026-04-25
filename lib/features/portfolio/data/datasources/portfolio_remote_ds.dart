import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../models/profile_model.dart';
import 'portfolio_factory_ds.dart';

class PortfolioRemoteDataSource implements PortfolioDataSource {
  PortfolioRemoteDataSource(this._dio);
  final Dio _dio;

  @override
  Future<ProfileModel> getProfile() async {
    final res = await _dio.get<Map<String, dynamic>>(ApiEndpoints.profile);
    return ProfileModel.fromJson(res.data!);
  }
}
