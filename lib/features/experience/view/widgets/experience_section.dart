import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/loaders/error_view.dart';
import '../../../../core/widgets/loaders/shimmer_card.dart';
import '../../view_model/experience_cubit.dart';
import 'experience_item.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExperienceCubit, ExperienceState>(
      builder: (context, state) {
        return switch (state) {
          ExperienceInitial() || ExperienceLoading() => const _Loading(),
          ExperienceErrorState(:final message) => ErrorView(
              message: message,
              onRetry: () => context.read<ExperienceCubit>().load(),
            ),
          ExperienceLoaded(:final items) => Column(
              children: [
                for (var i = 0; i < items.length; i++)
                  ExperienceItem(item: items[i], isFirst: i == 0),
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
        2,
        (_) => const Padding(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.lg),
          child: ShimmerBox(height: 100),
        ),
      ),
    );
  }
}
