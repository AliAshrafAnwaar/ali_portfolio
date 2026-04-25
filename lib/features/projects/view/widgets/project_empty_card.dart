import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class ProjectEmptyCard extends StatelessWidget {
  const ProjectEmptyCard({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return DottedRoundedBorder(
      radius: AppRadius.card,
      color: AppColors.border2,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Text(
          label,
          style: AppTextStyles.body.copyWith(
            fontSize: 13,
            color: AppColors.ink3,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}

/// Lightweight dashed border using a CustomPainter.
class DottedRoundedBorder extends StatelessWidget {
  const DottedRoundedBorder({
    super.key,
    required this.child,
    this.radius = 16,
    this.color = const Color(0x331C1916),
    this.strokeWidth = 0.8,
    this.dash = 5,
    this.gap = 4,
  });

  final Widget child;
  final double radius;
  final Color color;
  final double strokeWidth;
  final double dash;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedRRectPainter(
        radius: radius,
        color: color,
        strokeWidth: strokeWidth,
        dash: dash,
        gap: gap,
      ),
      child: child,
    );
  }
}

class _DashedRRectPainter extends CustomPainter {
  _DashedRRectPainter({
    required this.radius,
    required this.color,
    required this.strokeWidth,
    required this.dash,
    required this.gap,
  });
  final double radius;
  final Color color;
  final double strokeWidth;
  final double dash;
  final double gap;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    final rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );
    final path = Path()..addRRect(rrect);
    final metrics = path.computeMetrics();
    for (final m in metrics) {
      double distance = 0.0;
      while (distance < m.length) {
        final next = distance + dash;
        canvas.drawPath(m.extractPath(distance, next.clamp(0, m.length)), paint);
        distance = next + gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedRRectPainter old) =>
      old.color != color ||
      old.radius != radius ||
      old.strokeWidth != strokeWidth ||
      old.dash != dash ||
      old.gap != gap;
}
