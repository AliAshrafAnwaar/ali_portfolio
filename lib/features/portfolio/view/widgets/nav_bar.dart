import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/buttons/primary_pill_button.dart';
import '../../../../l10n/generated/app_localizations.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.onAbout,
    required this.onWork,
    required this.onExperience,
    required this.onContact,
    required this.onResume,
  });
  final VoidCallback onAbout;
  final VoidCallback onWork;
  final VoidCallback onExperience;
  final VoidCallback onContact;
  final VoidCallback onResume;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final isMobile = context.isMobile;
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppSpacing.lg : AppSpacing.xl4,
      ),
      decoration: BoxDecoration(
        color: AppColors.cream,
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: AppHairline.width),
        ),
      ),
      child: Row(
        children: [
          Text(
            'ali.dev',
            style: AppTextStyles.mono(
              size: 13,
              color: AppColors.warm,
              letterSpacing: 0.05,
            ),
          ),
          const Spacer(),
          if (!isMobile) ...[
            _NavLink(label: l.navAbout, onTap: onAbout),
            const SizedBox(width: AppSpacing.xl2),
            _NavLink(label: l.navWork, onTap: onWork),
            const SizedBox(width: AppSpacing.xl2),
            _NavLink(label: l.navExperience, onTap: onExperience),
            const SizedBox(width: AppSpacing.xl2),
            _NavLink(label: l.navContact, onTap: onContact),
            const Spacer(),
          ] else ...[
            _MobileMenu(
              onAbout: onAbout,
              onWork: onWork,
              onExperience: onExperience,
              onContact: onContact,
            ),
            const SizedBox(width: AppSpacing.md),
          ],
          PrimaryPillButton(
            label: '${l.navResume} ↗',
            onPressed: onResume,
            compact: true,
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
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
          style: AppTextStyles.navLink.copyWith(
            color: _hovering ? AppColors.ink : AppColors.ink2,
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  const _MobileMenu({
    required this.onAbout,
    required this.onWork,
    required this.onExperience,
    required this.onContact,
  });
  final VoidCallback onAbout;
  final VoidCallback onWork;
  final VoidCallback onExperience;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return PopupMenuButton<int>(
      icon: Icon(Icons.menu, color: AppColors.ink2, size: 22),
      color: AppColors.cream,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.card),
        side: BorderSide(color: AppColors.border2, width: AppHairline.width),
      ),
      onSelected: (i) {
        switch (i) {
          case 0:
            onAbout();
          case 1:
            onWork();
          case 2:
            onExperience();
          case 3:
            onContact();
        }
      },
      itemBuilder: (_) => [
        PopupMenuItem(value: 0, child: Text(l.navAbout, style: AppTextStyles.navLink)),
        PopupMenuItem(value: 1, child: Text(l.navWork, style: AppTextStyles.navLink)),
        PopupMenuItem(value: 2, child: Text(l.navExperience, style: AppTextStyles.navLink)),
        PopupMenuItem(value: 3, child: Text(l.navContact, style: AppTextStyles.navLink)),
      ],
    );
  }
}
