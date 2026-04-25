import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../domain/entities/experience.dart';
import 'experience_factory_ds.dart';

class ExperienceRemoteDataSource implements ExperienceDataSource {
  ExperienceRemoteDataSource(this._dio);
  final Dio _dio;

  @override
  Future<List<Experience>> getExperience() async {
    final res = await _dio.get<List<dynamic>>(ApiEndpoints.experience);
    return (res.data ?? const [])
        .map((e) => Experience(
              id: e['id'] as String,
              company: e['company'] as String,
              period: e['period'] as String,
              role: e['role'] as String,
              description: e['description'] as String,
              type: (e['type'] as String) == 'freelance'
                  ? EmploymentType.freelance
                  : EmploymentType.fullTime,
            ))
        .toList();
  }
}
