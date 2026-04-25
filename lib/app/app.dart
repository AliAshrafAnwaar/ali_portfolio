import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../core/di/injection.dart';
import '../core/localization/locale_cubit.dart';
import '../core/theme/app_theme.dart';
import '../core/theme/font_switcher_cubit.dart';
import '../core/theme/theme_mode_cubit.dart';
import '../l10n/generated/app_localizations.dart';
import 'router.dart';

class AliPortfolioApp extends StatelessWidget {
  const AliPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocaleCubit>(
          create: (_) => sl<LocaleCubit>()..load(),
        ),
        BlocProvider<FontSwitcherCubit>(
          create: (_) => sl<FontSwitcherCubit>()..load(),
        ),
        BlocProvider<ThemeModeCubit>(
          create: (_) => sl<ThemeModeCubit>()..load(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return BlocBuilder<FontSwitcherCubit, AppBodyFont>(
            builder: (context, font) {
              return BlocBuilder<ThemeModeCubit, ThemeMode>(
                builder: (context, themeMode) {
                  return MaterialApp.router(
                    title: 'Ali Ashraf Anwar',
                    debugShowCheckedModeBanner: false,
                    theme: AppTheme.light(),
                    darkTheme: AppTheme.dark(),
                    themeMode: themeMode,
                    locale: locale,
                    supportedLocales: AppLocalizations.supportedLocales,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    routerConfig: AppRouter.router,
                    builder: (context, child) {
                      return KeyedSubtree(
                        key: ValueKey<String>(
                          '${font.family}|${locale.languageCode}|${themeMode.name}',
                        ),
                        child: child ?? const SizedBox.shrink(),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
