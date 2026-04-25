import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/loaders/error_view.dart';
import '../../../core/widgets/loaders/shimmer_card.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../domain/entities/project.dart';
import '../view_model/projects_cubit.dart';
import 'widgets/project_card.dart';
import 'widgets/project_empty_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      builder: (context, state) {
        return switch (state) {
          ProjectsInitial() || ProjectsLoading() => const _Loading(),
          ProjectsError(:final message) => ErrorView(
              message: message,
              onRetry: () => context.read<ProjectsCubit>().load(),
            ),
          ProjectsLoaded(:final items) => _Grid(
              items: items,
              emptyLabel: l.projectsMoreSoon,
            ),
        };
      },
    );
  }
}

class _Grid extends StatelessWidget {
  const _Grid({required this.items, required this.emptyLabel});
  final List<Project> items;
  final String emptyLabel;

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final children = <Widget>[
      for (final p in items) ProjectCard(project: p),
      if (items.length.isOdd) ProjectEmptyCard(label: emptyLabel),
    ];

    if (isMobile) {
      return Column(
        children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0) const SizedBox(height: AppSpacing.md),
            children[i],
          ],
        ],
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = AppSpacing.md;
        final cardWidth = (constraints.maxWidth - spacing) / 2;

        return Column(
          children: [
            for (var i = 0; i < children.length; i += 2) ...[
              if (i > 0) const SizedBox(height: spacing),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(width: cardWidth, child: children[i]),
                    const SizedBox(width: spacing),
                    if (i + 1 < children.length)
                      SizedBox(width: cardWidth, child: children[i + 1])
                    else
                      SizedBox(width: cardWidth),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();
  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    final boxes = List.generate(4, (_) => const ShimmerBox(height: 200));
    if (isMobile) {
      return Column(
        children: [
          for (var i = 0; i < boxes.length; i++) ...[
            if (i > 0) const SizedBox(height: AppSpacing.md),
            boxes[i],
          ],
        ],
      );
    }
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: AppSpacing.md,
      crossAxisSpacing: AppSpacing.md,
      children: boxes,
    );
  }
}
