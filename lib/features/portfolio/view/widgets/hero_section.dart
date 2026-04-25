import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/buttons/primary_pill_button.dart';
import '../../../../core/widgets/buttons/secondary_pill_button.dart';
import '../../../../core/widgets/pills/availability_pill.dart';
import '../../../../core/widgets/serif_heading.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/profile.dart';
import 'identity_card.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.profile,
    required this.onWork,
    required this.onContact,
  });
  final Profile profile;
  final VoidCallback onWork;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final l = AppLocalizations.of(context);

    final left = _HeroLeft(
      profile: profile,
      onWork: onWork,
      onContact: onContact,
    );
    final right = _HeroRight(profile: profile, idCardLabel: l.idCardSubtitle);

    if (isMobile) {
      return DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.border, width: AppHairline.width),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [left, SizedBox(height: 460, child: right)],
        ),
      );
    }

    // Desktop: fixed-height hero so Row(stretch) resolves cleanly.
    return SizedBox(
      height: 720,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.border, width: AppHairline.width),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: left),
            Container(
              width: 340,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: AppColors.border,
                    width: AppHairline.width,
                  ),
                ),
              ),
              child: right,
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroLeft extends StatelessWidget {
  const _HeroLeft({
    required this.profile,
    required this.onWork,
    required this.onContact,
  });
  final Profile profile;
  final VoidCallback onWork;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final isMobile = context.isMobile;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppSpacing.lgOriginal : AppSpacing.xl4,
        vertical: isMobile ? AppSpacing.xl5 : AppSpacing.xl6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SerifHeading(
            size: isMobile ? 48 : 72,
            parts: const [
              SerifPart('Ali '),
              SerifPart('Ashraf', accent: true),
              SerifPart('\nAnwar'),
            ],
          ),
          const SizedBox(height: 6),
          Text(l.heroTitle, style: AppTextStyles.heroTitle),
          const SizedBox(height: AppSpacing.xl3 - 4),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 460),
            child: _HeroBio(text: l.heroBio, bold: l.heroBioBold),
          ),
          const SizedBox(height: AppSpacing.xl4),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              PrimaryPillButton(label: l.heroCtaPrimary, onPressed: onWork),
              SecondaryPillButton(label: l.heroCtaSecondary, onPressed: onContact),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroBio extends StatelessWidget {
  const _HeroBio({required this.text, required this.bold});
  final String text;
  final String bold;

  @override
  Widget build(BuildContext context) {
    final base = AppTextStyles.heroBio;
    final boldStyle = base.copyWith(
      color: AppColors.ink,
      fontWeight: FontWeight.w500,
    );
    final parts = text.split(bold);
    return Text.rich(
      TextSpan(
        children: [
          for (var i = 0; i < parts.length; i++) ...[
            TextSpan(text: parts[i], style: base),
            if (i < parts.length - 1)
              TextSpan(text: bold, style: boldStyle),
          ],
        ],
      ),
    );
  }
}

class _HeroRight extends StatelessWidget {
  const _HeroRight({required this.profile, required this.idCardLabel});
  final Profile profile;
  final String idCardLabel;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Container(
      color: AppColors.cream2,
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 280),
                  child: const _AvatarImage(),
                ),
              ),
            ),
          ),
          IdentityCard(
            name: profile.name,
            subtitle: idCardLabel,
            tags: profile.stackTags,
          ),
        ],
      ),
    );
  }
}

class _AvatarImage extends StatelessWidget {
  const _AvatarImage();
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.avatar,
      fit: BoxFit.contain,
      errorBuilder: (_, e, s) => const _AvatarPlaceholder(),
    );
  }
}

class _AvatarPlaceholder extends StatelessWidget {
  const _AvatarPlaceholder();
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cream3,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.border2, width: AppHairline.width),
        ),
        alignment: Alignment.center,
        child: Text(
          'A',
          style: AppTextStyles.serif(
            size: 90,
            color: AppColors.ink2,
            height: 1.0,
          ),
        ),
      ),
    );
  }
}
