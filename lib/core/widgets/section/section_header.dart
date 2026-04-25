import 'package:flutter/material.dart';

import '../../theme/app_spacing.dart';
import '../../theme/app_text_styles.dart';

/// "00  At a glance" — mono number + serif title.
class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.number, required this.title});
  final String number;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xl4 + 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(number, style: AppTextStyles.monoNumber),
          const SizedBox(width: AppSpacing.md),
          Flexible(child: Text(title, style: AppTextStyles.sectionTitle)),
        ],
      ),
    );
  }
}
