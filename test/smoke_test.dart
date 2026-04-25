import 'package:ali_portfolio/core/theme/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AppColors tokens are defined', () {
    expect(AppColors.cream, isNotNull);
    expect(AppColors.warm, isNotNull);
    expect(AppColors.ink, isNotNull);
  });
}
