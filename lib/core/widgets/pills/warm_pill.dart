import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_text_styles.dart';

/// Highlighted accent pill — `warm-light` bg + `warm` text.
class WarmPill extends StatelessWidget {
  const WarmPill({super.key, required this.label, this.mono = false, this.tiny = false});
  final String label;
  final bool mono;
  final bool tiny;

  @override
  Widget build(BuildContext context) {
    final style = mono
        ? AppTextStyles.mono(
            size: tiny ? 10 : 11,
            color: AppColors.warm,
          )
        : AppTextStyles.body.copyWith(
            fontSize: tiny ? 10 : 12,
            color: AppColors.warm,
            height: 1.2,
          );
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: tiny ? 9 : 11,
        vertical: tiny ? 2 : 3,
      ),
      decoration: BoxDecoration(
        color: AppColors.warmLight,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(
          color: AppColors.warm.withValues(alpha: 0.22),
          width: AppHairline.width,
        ),
      ),
      child: Text(label, style: style),
    );
  }
}
