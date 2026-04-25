import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

class HairlineDivider extends StatelessWidget {
  const HairlineDivider({super.key, this.color, this.vertical = false});
  final Color? color;
  final bool vertical;

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.border;
    return vertical
        ? Container(width: AppHairline.width, color: c)
        : Container(height: AppHairline.width, color: c);
  }
}
