import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/pills/warm_pill.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/experience.dart';

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({
    super.key,
    required this.item,
    required this.isFirst,
  });
  final Experience item;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final isMobile = context.isMobile;
    final badgeLabel = item.type == EmploymentType.freelance
        ? l.expBadgeFreelance
        : l.expBadgeFullTime;

    final left = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(item.company, style: AppTextStyles.experienceCo),
        const SizedBox(height: 4),
        Text(
          item.period,
          style: AppTextStyles.mono(size: 10, letterSpacing: 0.05),
        ),
        const SizedBox(height: 10),
        WarmPill(label: badgeLabel, mono: true, tiny: true),
      ],
    );

    final right = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(item.role, style: AppTextStyles.experienceRole),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Text(item.description, style: AppTextStyles.experienceDesc),
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        border: Border(
          top: isFirst
              ? BorderSide(color: AppColors.border, width: AppHairline.width)
              : BorderSide.none,
          bottom: BorderSide(color: AppColors.border, width: AppHairline.width),
        ),
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                left,
                const SizedBox(height: AppSpacing.sm),
                right,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 200, child: left),
                const SizedBox(width: AppSpacing.xl4),
                Expanded(child: right),
              ],
            ),
    );
  }
}
