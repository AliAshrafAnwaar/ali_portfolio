import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.cream,
      colorScheme: ColorScheme.light(
        primary: AppColors.ink,
        onPrimary: AppColors.cream,
        secondary: AppColors.warm,
        onSecondary: AppColors.cream,
        surface: AppColors.cream,
        onSurface: AppColors.ink,
        error: const Color(0xFFB00020),
        onError: AppColors.cream,
      ),
      textTheme: base.textTheme.copyWith(
        bodyMedium: AppTextStyles.body,
        bodyLarge: AppTextStyles.body,
        titleLarge: AppTextStyles.sectionTitle,
        labelSmall: AppTextStyles.monoLabel,
      ),
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      hoverColor: AppColors.warmLight.withValues(alpha: 0.4),
    );
  }

  static ThemeData dark() {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.ink,
      colorScheme: ColorScheme.dark(
        primary: AppColors.cream,
        onPrimary: AppColors.ink,
        secondary: AppColors.warm2,
        onSecondary: AppColors.ink,
        surface: AppColors.ink,
        onSurface: AppColors.cream,
        error: const Color(0xFFCF6679),
        onError: AppColors.ink,
      ),
      textTheme: base.textTheme.copyWith(
        bodyMedium: AppTextStyles.body.copyWith(color: AppColors.cream),
        bodyLarge: AppTextStyles.body.copyWith(color: AppColors.cream),
        titleLarge: AppTextStyles.sectionTitle.copyWith(color: AppColors.cream),
        labelSmall: AppTextStyles.monoLabel.copyWith(color: AppColors.cream),
      ),
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      hoverColor: AppColors.warm.withValues(alpha: 0.15),
    );
  }
}
