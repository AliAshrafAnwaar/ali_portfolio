import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_spacing.dart';
import '../../theme/app_text_styles.dart';

/// Outlined hairline pill button. Hover shifts border + text to `--ink`.
class SecondaryPillButton extends StatefulWidget {
  const SecondaryPillButton({
    super.key,
    required this.label,
    required this.onPressed,
  });
  final String label;
  final VoidCallback? onPressed;

  @override
  State<SecondaryPillButton> createState() => _SecondaryPillButtonState();
}

class _SecondaryPillButtonState extends State<SecondaryPillButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final color = _hovering ? AppColors.ink : AppColors.ink2;
    final border = _hovering ? AppColors.ink : AppColors.border2;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(AppRadius.pill),
            border: Border.all(color: border, width: AppHairline.width),
          ),
          child: Text(
            widget.label,
            style: AppTextStyles.buttonSecondary.copyWith(color: color),
          ),
        ),
      ),
    );
  }
}
