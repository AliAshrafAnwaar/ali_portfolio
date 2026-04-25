import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/pills/neutral_pill.dart';
import '../../../../core/widgets/pills/warm_pill.dart';
import '../../domain/entities/skill_category.dart';

class SkillRow extends StatelessWidget {
  const SkillRow({
    super.key,
    required this.label,
    required this.tags,
    required this.isFirst,
  });
  final String label;
  final List<SkillTag> tags;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        border: Border(
          top: isFirst
              ? BorderSide(color: AppColors.border, width: AppHairline.width)
              : BorderSide.none,
          bottom: BorderSide(color: AppColors.border, width: AppHairline.width),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 140),
                child: Text(
                  label,
                  style: AppTextStyles.mono(
                    size: 11,
                    letterSpacing: 0.05,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.xl4),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _Tags(tags: tags),
            ),
          ),
        ],
      ),
    );
  }
}

class _Tags extends StatelessWidget {
  const _Tags({required this.tags});
  final List<SkillTag> tags;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        for (final t in tags)
          if (t.warm) WarmPill(label: t.label) else NeutralPill(label: t.label),
      ],
    );
  }
}
