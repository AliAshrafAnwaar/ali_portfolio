import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/loaders/error_view.dart';
import '../../../core/widgets/loaders/shimmer_card.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../view_model/skills_cubit.dart';
import 'widgets/skill_row.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  String _label(AppLocalizations l, String key) {
    switch (key) {
      case 'skillCategoryMobile':
        return l.skillCategoryMobile;
      case 'skillCategoryWeb':
        return l.skillCategoryWeb;
      case 'skillCategoryBackend':
        return l.skillCategoryBackend;
      case 'skillCategoryArchitecture':
        return l.skillCategoryArchitecture;
      case 'skillCategoryAi':
        return l.skillCategoryAi;
    }
    return key;
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return BlocBuilder<SkillsCubit, SkillsState>(
      builder: (context, state) {
        return switch (state) {
          SkillsInitial() || SkillsLoading() => const _Loading(),
          SkillsError(:final message) => ErrorView(
              message: message,
              onRetry: () => context.read<SkillsCubit>().load(),
            ),
          SkillsLoaded(:final categories) => Column(
              children: [
                for (var i = 0; i < categories.length; i++)
                  SkillRow(
                    label: _label(l, categories[i].categoryKey),
                    tags: categories[i].tags,
                    isFirst: i == 0,
                  ),
              ],
            ),
        };
      },
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        4,
        (_) => const Padding(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
          child: ShimmerBox(height: 28),
        ),
      ),
    );
  }
}
