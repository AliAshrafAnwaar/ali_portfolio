import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_text_styles.dart';

/// Available body fonts (DNA.md §11 — font switcher bar).
enum AppBodyFont {
  dmSans('DM Sans'),
  inter('Inter'),
  sora('Sora'),
  jakarta('Plus Jakarta Sans');

  const AppBodyFont(this.family);
  final String family;
}

class FontSwitcherCubit extends Cubit<AppBodyFont> {
  FontSwitcherCubit(this._prefs) : super(AppBodyFont.dmSans);

  static const _key = 'app_body_font';
  final SharedPreferences _prefs;

  Future<void> load() async {
    final saved = _prefs.getString(_key);
    final next = AppBodyFont.values.firstWhere(
      (f) => f.family == saved,
      orElse: () => AppBodyFont.dmSans,
    );
    AppTextStyles.bodyFamily = next.family;
    emit(next);
  }

  Future<void> setFont(AppBodyFont font) async {
    AppTextStyles.bodyFamily = font.family;
    await _prefs.setString(_key, font.family);
    emit(font);
  }
}
