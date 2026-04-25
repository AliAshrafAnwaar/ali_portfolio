import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../domain/entities/project.dart';
import 'projects_factory_ds.dart';

class ProjectsRemoteDataSource implements ProjectsDataSource {
  ProjectsRemoteDataSource(this._dio);
  final Dio _dio;

  @override
  Future<List<Project>> getProjects() async {
    final res = await _dio.get<List<dynamic>>(ApiEndpoints.projects);
    return (res.data ?? const [])
        .map((p) => Project(
              id: p['id'] as String,
              index: p['index'] as String,
              name: p['name'] as String,
              description: p['description'] as String,
              tech: List<String>.from(p['tech'] as List),
              url: p['url'] as String?,
            ))
        .toList();
  }
}
