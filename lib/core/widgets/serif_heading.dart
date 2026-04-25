import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// A serif (DM Serif Display) heading where one accent fragment is rendered
/// in italic + warm color (DNA.md §11 rule 3).
class SerifHeading extends StatelessWidget {
  const SerifHeading({
    super.key,
    required this.parts,
    this.size = 64,
    this.height = 1.05,
    this.textAlign = TextAlign.start,
  });

  /// Ordered text parts. Each part declares whether it is the warm-italic accent.
  final List<SerifPart> parts;
  final double size;
  final double height;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    final base = AppTextStyles.serif(size: size, height: height);
    return Text.rich(
      TextSpan(
        children: [
          for (final p in parts)
            TextSpan(
              text: p.text,
              style: p.accent
                  ? AppTextStyles.serif(
                      size: size,
                      height: height,
                      italic: true,
                      color: AppColors.warm,
                    )
                  : base,
            ),
        ],
      ),
      textAlign: textAlign,
    );
  }
}

class SerifPart {
  const SerifPart(this.text, {this.accent = false});
  final String text;
  final bool accent;
}
