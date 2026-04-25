import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Row of [label] (left) and [value] (right, mono, ellipsized on overflow).
/// Layout is identical on mobile and desktop per the design.
class ContactLinkRow extends StatefulWidget {
  const ContactLinkRow({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
  });
  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  State<ContactLinkRow> createState() => _ContactLinkRowState();
}

class _ContactLinkRowState extends State<ContactLinkRow> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: AppColors.border, width: AppHairline.width),
              bottom:
                  BorderSide(color: AppColors.border, width: AppHairline.width),
            ),
          ),
          child: Row(
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 150),
                style: AppTextStyles.body.copyWith(
                  fontSize: 13,
                  color: _hovering ? AppColors.ink : AppColors.ink3,
                  height: 1.4,
                ),
                child: Text(widget.label),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 150),
                  style: AppTextStyles.mono(
                    size: 12,
                    color: _hovering ? AppColors.warm : AppColors.ink2,
                    letterSpacing: 0.02,
                  ),
                  child: Text(
                    widget.value,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
