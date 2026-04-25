import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit(this._prefs) : super(const Locale('en'));

  static const _key = 'app_locale';
  static const supported = <Locale>[Locale('en'), Locale('ar')];
  final SharedPreferences _prefs;

  Future<void> load() async {
    final code = _prefs.getString(_key) ?? 'en';
    emit(Locale(code));
  }

  Future<void> setLocale(Locale locale) async {
    await _prefs.setString(_key, locale.languageCode);
    emit(locale);
  }

  Future<void> toggle() async {
    final next = state.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');
    await setLocale(next);
  }
}
