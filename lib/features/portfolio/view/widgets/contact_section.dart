import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/utils/url_opener.dart';
import '../../../../core/widgets/serif_heading.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/profile.dart';
import 'contact_link_row.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, required this.profile});
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final isMobile = context.isMobile;

    final left = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SerifHeading(
          size: isMobile ? 36 : 52,
          parts: [
            SerifPart('${l.contactHeading}\n'),
            SerifPart(l.contactHeadingAccent, accent: true),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          l.contactSub,
          style: AppTextStyles.body.copyWith(
            fontSize: 14,
            color: AppColors.ink3,
            height: 1.75,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );

    final right = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContactLinkRow(
          label: l.contactEmail,
          value: profile.email,
          onTap: () => UrlOpener.email(profile.email),
        ),
        ContactLinkRow(
          label: l.contactLinkedIn,
          value: '${profile.linkedIn} ↗',
          onTap: () => UrlOpener.open(profile.linkedIn),
        ),
        ContactLinkRow(
          label: l.contactGithub,
          value: '${profile.github} ↗',
          onTap: () => UrlOpener.open(profile.github),
        ),
        ContactLinkRow(
          label: l.contactWhatsApp,
          value: profile.phone,
          onTap: () => UrlOpener.open(profile.whatsapp),
        ),
      ],
    );

    if (isMobile) {
      return Column(children: [left, const SizedBox(height: AppSpacing.xl2 + 4), right]);
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        left,
        const SizedBox(width: 48),
        Expanded(child: right),
      ],
    );
  }
}
