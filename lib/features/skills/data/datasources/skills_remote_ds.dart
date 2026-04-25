import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../domain/entities/skill_category.dart';
import 'skills_factory_ds.dart';

class SkillsRemoteDataSource implements SkillsDataSource {
  SkillsRemoteDataSource(this._dio);
  final Dio _dio;

  @override
  Future<List<SkillCategory>> getSkills() async {
    final res = await _dio.get<List<dynamic>>(ApiEndpoints.skills);
    return (res.data ?? const [])
        .map((c) => SkillCategory(
              categoryKey: c['categoryKey'] as String,
              tags: (c['tags'] as List)
                  .map((t) => SkillTag(
                        label: t['label'] as String,
                        warm: (t['warm'] as bool?) ?? false,
                      ))
                  .toList(),
            ))
        .toList();
  }
}
