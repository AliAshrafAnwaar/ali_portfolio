import 'package:flutter/material.dart';

/// Editorial Warm color tokens — see DNA.md §3.
/// `warm` is the ONLY accent. No gradients, no rainbow.
///
/// The palette is *swappable at runtime* via [applyBrightness] so that
/// widgets hardcoding `AppColors.cream`/`ink` still respond to light/dark
/// theme toggles without having to route every colour through
/// `Theme.of(context)`.
class AppColors {
  AppColors._();

  // ── Source-of-truth light tokens (compile-time constants) ────────────
  static const Color _lightCream = Color(0xFFFAF8F4);
  static const Color _lightCream2 = Color(0xFFF3F0EA);
  static const Color _lightCream3 = Color(0xFFE8E3D9);
  static const Color _lightInk = Color(0xFF1C1916);
  static const Color _lightInk2 = Color(0xFF4A4540);
  static const Color _lightInk3 = Color(0xFF8A847B);
  static const Color _lightWarmLight = Color(0xFFF5EDE2);

  // ── Source-of-truth dark tokens (editorial warm-dark) ────────────────
  static const Color _darkBg = Color(0xFF14110F); // deepest background
  static const Color _darkBg2 = Color(0xFF1C1916); // elevated surface
  static const Color _darkBg3 = Color(0xFF2A2522); // chips / dividers
  static const Color _darkFg = Color(0xFFFAF8F4); // primary text
  static const Color _darkFg2 = Color(0xFFD6D0C6); // secondary text
  static const Color _darkFg3 = Color(0xFF948D83); // tertiary text
  static const Color _darkWarmLight = Color(0xFF3A2A1E); // warm-tinted surface

  // ── Live palette (mutable, read by widgets across the app) ───────────
  static Color cream = _lightCream;
  static Color cream2 = _lightCream2;
  static Color cream3 = _lightCream3;
  static Color ink = _lightInk;
  static Color ink2 = _lightInk2;
  static Color ink3 = _lightInk3;
  static Color warmLight = _lightWarmLight;

  // Accent colours stay identical in both modes (DNA.md: single warm accent).
  static const Color warm = Color(0xFFB07D4F);
  static const Color warm2 = Color(0xFFC8966A);
  static const Color available = Color(0xFF4CAF76);

  static Color border = _lightInk.withValues(alpha: 0.10);
  static Color border2 = _lightInk.withValues(alpha: 0.18);

  /// Swap the live palette to match [brightness].
  ///
  /// Must be called before building the widget tree whenever the theme
  /// mode changes (see `ThemeModeCubit` wiring in `AliPortfolioApp`).
  static void applyBrightness(Brightness brightness) {
    if (brightness == Brightness.dark) {
      cream = _darkBg;
      cream2 = _darkBg2;
      cream3 = _darkBg3;
      ink = _darkFg;
      ink2 = _darkFg2;
      ink3 = _darkFg3;
      warmLight = _darkWarmLight;
      border = _darkFg.withValues(alpha: 0.12);
      border2 = _darkFg.withValues(alpha: 0.22);
    } else {
      cream = _lightCream;
      cream2 = _lightCream2;
      cream3 = _lightCream3;
      ink = _lightInk;
      ink2 = _lightInk2;
      ink3 = _lightInk3;
      warmLight = _lightWarmLight;
      border = _lightInk.withValues(alpha: 0.10);
      border2 = _lightInk.withValues(alpha: 0.18);
    }
  }
}
