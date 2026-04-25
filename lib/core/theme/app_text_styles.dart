import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Typography per DNA.md §4.
/// Headings always DM Serif Display. Body uses the user-selected sans family
/// (defaults to DM Sans). Mono labels use DM Mono.
class AppTextStyles {
  AppTextStyles._();

  /// Family used for body / nav / button text. Swappable via [FontSwitcherCubit].
  static String bodyFamily = 'DM Sans';

  static TextStyle _sans({
    required double size,
    FontWeight weight = FontWeight.w300,
    Color? color,
    double height = 1.75,
    double letterSpacing = 0.0,
  }) {
    return GoogleFonts.getFont(
      bodyFamily,
      fontSize: size,
      fontWeight: weight,
      color: color ?? AppColors.ink2,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle serif({
    required double size,
    Color? color,
    bool italic = false,
    double height = 1.05,
    double letterSpacing = -0.02,
  }) {
    return GoogleFonts.dmSerifDisplay(
      fontSize: size,
      fontWeight: FontWeight.w400,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color ?? AppColors.ink,
      height: height,
      letterSpacing: letterSpacing * size,
    );
  }

  static TextStyle mono({
    double size = 11,
    Color? color,
    FontWeight weight = FontWeight.w400,
    double letterSpacing = 0.05,
  }) {
    return GoogleFonts.dmMono(
      fontSize: size,
      fontWeight: weight,
      color: color ?? AppColors.ink3,
      letterSpacing: letterSpacing * size,
    );
  }

  // ── Convenience presets ────────────────────────────────────────────────
  static TextStyle get displayHero => serif(size: 64, height: 1.05);
  static TextStyle get sectionTitle => serif(size: 30, height: 1.1);
  static TextStyle get contactHeading => serif(size: 44, height: 1.1);

  static TextStyle get body => _sans(size: 15, color: AppColors.ink2);
  static TextStyle get bodyStrong =>
      _sans(size: 15, color: AppColors.ink, weight: FontWeight.w500);
  static TextStyle get heroTitle =>
      _sans(size: 15, color: AppColors.ink3, height: 1.6);
  static TextStyle get heroBio =>
      _sans(size: 15, color: AppColors.ink2, height: 1.85);

  static TextStyle get navLink =>
      _sans(size: 13, color: AppColors.ink2, weight: FontWeight.w400, height: 1.4);
  static TextStyle get buttonPrimary => _sans(
        size: 13,
        color: AppColors.cream,
        weight: FontWeight.w500,
        letterSpacing: 0.02 * 13,
        height: 1.2,
      );
  static TextStyle get buttonSecondary =>
      _sans(size: 13, color: AppColors.ink2, height: 1.2);

  static TextStyle get monoLabel => mono();
  static TextStyle get monoNumber => mono(size: 11, letterSpacing: 0.06);
  static TextStyle get monoTagWarm =>
      mono(size: 11, color: AppColors.warm, weight: FontWeight.w400);
  static TextStyle get monoTiny => mono(size: 10, letterSpacing: 0.05);

  static TextStyle get statNumber => serif(
        size: 42,
        color: AppColors.warm,
        height: 1.0,
        letterSpacing: -0.01,
      );
  static TextStyle get statLabel =>
      _sans(size: 13, color: AppColors.ink3, height: 1.5);

  static TextStyle get projectName => _sans(
        size: 17,
        color: AppColors.ink,
        weight: FontWeight.w500,
        height: 1.3,
        letterSpacing: -0.01 * 17,
      );
  static TextStyle get projectDesc =>
      _sans(size: 13, color: AppColors.ink2, height: 1.65);

  static TextStyle get experienceCo =>
      _sans(size: 14, color: AppColors.ink, weight: FontWeight.w500, height: 1.4);
  static TextStyle get experienceRole => _sans(
        size: 18,
        color: AppColors.ink,
        weight: FontWeight.w400,
        height: 1.3,
        letterSpacing: -0.01 * 18,
      );
  static TextStyle get experienceDesc =>
      _sans(size: 13, color: AppColors.ink2, height: 1.75);
}
