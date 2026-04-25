import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/pills/neutral_pill.dart';
import '../../domain/entities/project.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.project, this.onTap});
  final Project project;
  final VoidCallback? onTap;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final hovering = _hovering;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
          decoration: BoxDecoration(
            color: hovering ? AppColors.warmLight : AppColors.cream,
            borderRadius: BorderRadius.circular(AppRadius.card),
            border: Border.all(
              color: hovering ? AppColors.warm2 : AppColors.border2,
              width: AppHairline.width,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.project.index,
                    style: AppTextStyles.monoLabel,
                  ),
                  AnimatedSlide(
                    offset: hovering ? const Offset(0.18, -0.18) : Offset.zero,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    child: Text(
                      '↗',
                      style: TextStyle(
                        fontSize: 18,
                        color: hovering ? AppColors.warm : AppColors.ink3,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(widget.project.name, style: AppTextStyles.projectName),
              const SizedBox(height: AppSpacing.xs),
              Text(widget.project.description, style: AppTextStyles.projectDesc),
              const SizedBox(height: AppSpacing.lg),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  for (final t in widget.project.tech)
                    NeutralPill(label: t, mono: true, tiny: true),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
