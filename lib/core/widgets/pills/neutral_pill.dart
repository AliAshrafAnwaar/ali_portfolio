import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_text_styles.dart';

/// Neutral skill / tech tag pill — `cream2` bg, hairline border.
class NeutralPill extends StatelessWidget {
  const NeutralPill({super.key, required this.label, this.mono = false, this.tiny = false});
  final String label;
  final bool mono;
  final bool tiny;

  @override
  Widget build(BuildContext context) {
    final style = mono
        ? AppTextStyles.mono(size: tiny ? 10 : 12, color: AppColors.ink3)
        : AppTextStyles.body.copyWith(
            fontSize: tiny ? 10 : 12,
            color: AppColors.ink2,
            height: 1.2,
          );
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: tiny ? 9 : 13,
        vertical: tiny ? 3 : 4,
      ),
      decoration: BoxDecoration(
        color: mono ? Colors.transparent : AppColors.cream2,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(
          color: mono ? AppColors.border : AppColors.border2,
          width: AppHairline.width,
        ),
      ),
      child: Text(label, style: style),
    );
  }
}
