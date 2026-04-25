import 'package:dio/dio.dart';

import 'failures.dart';

Failure mapDioError(Object error) {
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const NetworkFailure();
      case DioExceptionType.badResponse:
        final code = error.response?.statusCode ?? 0;
        return ServerFailure.code(code);
      case DioExceptionType.cancel:
        return const UnknownFailure('Request cancelled.');
      case DioExceptionType.unknown:
      case DioExceptionType.badCertificate:
        return const UnknownFailure();
    }
  }
  return const UnknownFailure();
}
