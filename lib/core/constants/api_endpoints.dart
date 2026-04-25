/// Centralized API endpoints. The base URL is a placeholder until a real
/// backend is wired — the app currently runs on factory demo data.
class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://api.aliashraf.dev';

  static const String profile = '/v1/profile';
  static const String skills = '/v1/skills';
  static const String projects = '/v1/projects';
  static const String experience = '/v1/experience';
}

/// Toggle to switch every repository between factory demo data and remote API.
const bool kUseFactoryData = true;
