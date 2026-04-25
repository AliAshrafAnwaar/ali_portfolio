import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_colors.dart';

/// Persists the user's light/dark preference (DNA.md editorial aesthetic)
/// and keeps the live [AppColors] palette in sync with the current mode.
class ThemeModeCubit extends Cubit<ThemeMode> {
  ThemeModeCubit(this._prefs) : super(ThemeMode.light);

  static const _key = 'app_theme_mode';
  final SharedPreferences _prefs;

  Future<void> load() async {
    final saved = _prefs.getString(_key);
    final next = saved == 'dark' ? ThemeMode.dark : ThemeMode.light;
    AppColors.applyBrightness(
      next == ThemeMode.dark ? Brightness.dark : Brightness.light,
    );
    emit(next);
  }

  Future<void> setMode(ThemeMode mode) async {
    await _prefs.setString(_key, mode == ThemeMode.dark ? 'dark' : 'light');
    AppColors.applyBrightness(
      mode == ThemeMode.dark ? Brightness.dark : Brightness.light,
    );
    emit(mode);
  }

  Future<void> toggle() async {
    await setMode(state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
  }
}
