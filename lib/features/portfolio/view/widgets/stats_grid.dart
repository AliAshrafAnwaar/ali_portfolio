import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/profile.dart';

/// Stats card row. Uses border-on-cell instead of sibling divider widgets,
/// so it doesn't depend on IntrinsicHeight (which collapses inside slivers
/// when combined with Row + Expanded).
class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key, required this.stats});
  final List<Stat> stats;

  String _label(AppLocalizations l, String key) {
    switch (key) {
      case 'stat1Label':
        return l.stat1Label;
      case 'stat2Label':
        return l.stat2Label;
      case 'stat3Label':
        return l.stat3Label;
    }
    return key;
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final isMobile = context.isMobile;
    final radius = BorderRadius.circular(AppRadius.card14);

    final outerDecoration = BoxDecoration(
      color: AppColors.cream,
      borderRadius: radius,
      border: Border.all(color: AppColors.border, width: AppHairline.width),
    );

    if (isMobile) {
      return Container(
        decoration: outerDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < stats.length; i++)
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    top: i == 0
                        ? BorderSide.none
                        : BorderSide(
                            color: AppColors.border,
                            width: AppHairline.width,
                          ),
                  ),
                ),
                child: _StatCell(
                  value: stats[i].value,
                  label: _label(l, stats[i].labelKey),
                ),
              ),
          ],
        ),
      );
    }

    return SizedBox(
      height: 140,
      child: Container(
        decoration: outerDecoration,
        child: Row(
          children: [
            for (var i = 0; i < stats.length; i++)
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      left: i == 0
                          ? BorderSide.none
                          : BorderSide(
                              color: AppColors.border,
                              width: AppHairline.width,
                            ),
                    ),
                  ),
                  child: _StatCell(
                    value: stats[i].value,
                    label: _label(l, stats[i].labelKey),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _StatCell extends StatelessWidget {
  const _StatCell({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value, style: AppTextStyles.statNumber, maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 8),
          Text(label, style: AppTextStyles.statLabel, maxLines: 2, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
