import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../utils/responsive.dart';

/// Section wrapper — 80×48 padding (56×20 on mobile) + bottom hairline.
class SectionContainer extends StatelessWidget {
  const SectionContainer({super.key, required this.child, this.id});
  final Widget child;
  final Key? id;

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    return Container(
      key: id,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppSpacing.lgOriginal : AppSpacing.xl4,
        vertical: isMobile ? AppSpacing.xl5 : AppSpacing.xl6,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: AppHairline.width),
        ),
      ),
      child: child,
    );
  }
}
