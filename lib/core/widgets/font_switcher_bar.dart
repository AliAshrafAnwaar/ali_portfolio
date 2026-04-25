import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../localization/locale_cubit.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import '../theme/font_switcher_cubit.dart';
import '../theme/theme_mode_cubit.dart';
import '../utils/responsive.dart';

/// Sticky bar above the nav. Lets the user switch body font + locale.
class FontSwitcherBar extends StatelessWidget {
  const FontSwitcherBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile;
    return Container(
      height: 36,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppSpacing.lg : AppSpacing.xl4,
      ),
      decoration: BoxDecoration(
        color: AppColors.cream2,
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: AppHairline.width),
        ),
      ),
      child: Row(
        children: [
          Text(
            'FONT',
            style: AppTextStyles.mono(size: 10, letterSpacing: 0.1),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: BlocBuilder<FontSwitcherCubit, AppBodyFont>(
                builder: (context, current) {
                  return Row(
                    children: [
                      for (final f in AppBodyFont.values)
                        _FontButton(
                          label: f.family,
                          selected: current == f,
                          onTap: () =>
                              context.read<FontSwitcherCubit>().setFont(f),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          BlocBuilder<ThemeModeCubit, ThemeMode>(
            builder: (context, mode) {
              final isDark = mode == ThemeMode.dark;
              return Tooltip(
                message: isDark ? 'Switch to light' : 'Switch to dark',
                child: InkResponse(
                  onTap: () => context.read<ThemeModeCubit>().toggle(),
                  radius: 18,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  hoverColor: AppColors.warmLight,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      isDark
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      size: 16,
                      color: AppColors.ink2,
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: AppSpacing.md),
          BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              final isEn = locale.languageCode == 'en';
              return GestureDetector(
                onTap: () => context.read<LocaleCubit>().toggle(),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Row(
                    children: [
                      _LangChip(label: 'EN', selected: isEn),
                      const SizedBox(width: 2),
                      _LangChip(label: 'AR', selected: !isEn),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FontButton extends StatefulWidget {
  const _FontButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  State<_FontButton> createState() => _FontButtonState();
}

class _FontButtonState extends State<_FontButton> {
  bool _hovering = false;
  @override
  Widget build(BuildContext context) {
    final color = widget.selected
        ? AppColors.warm
        : (_hovering ? AppColors.ink : AppColors.ink3);
    final bg = widget.selected
        ? AppColors.warmLight
        : (_hovering ? AppColors.cream : Colors.transparent);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: bg,
            border: Border(
              left: BorderSide(color: AppColors.border, width: AppHairline.width),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.label,
            style: AppTextStyles.body.copyWith(
              fontSize: 12,
              color: color,
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}

class _LangChip extends StatelessWidget {
  const _LangChip({required this.label, required this.selected});
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: selected ? AppColors.warmLight : Colors.transparent,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        label,
        style: AppTextStyles.mono(
          size: 10,
          color: selected ? AppColors.warm : AppColors.ink3,
          letterSpacing: 0.1,
        ),
      ),
    );
  }
}
