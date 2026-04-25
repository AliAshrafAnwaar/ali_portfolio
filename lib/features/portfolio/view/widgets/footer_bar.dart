import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../l10n/generated/app_localizations.dart';

class FooterBar extends StatelessWidget {
  const FooterBar({super.key, required this.onBackToTop});
  final VoidCallback onBackToTop;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final isMobile = context.isMobile;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppSpacing.lg : AppSpacing.xl4,
        vertical: 22,
      ),
      decoration: BoxDecoration(
        color: AppColors.cream2,
        border: Border(
          top: BorderSide(color: AppColors.border, width: AppHairline.width),
        ),
      ),
      child: Row(
        children: [
          Text(
            l.footerCopy,
            style: AppTextStyles.mono(size: 10, letterSpacing: 0.05),
          ),
          const Spacer(),
          _BackToTop(label: l.footerBackToTop, onTap: onBackToTop),
        ],
      ),
    );
  }
}

class _BackToTop extends StatefulWidget {
  const _BackToTop({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<_BackToTop> createState() => _BackToTopState();
}

class _BackToTopState extends State<_BackToTop> {
  bool _hovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: AppTextStyles.mono(
            size: 10,
            color: _hovering ? AppColors.warm : AppColors.ink3,
            letterSpacing: 0.05,
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}
