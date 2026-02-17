import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🎨 CYBERPUNK THEME EXTENSION
/// ═══════════════════════════════════════════════════════════════════════════
/// Custom theme extension for cyberpunk-specific colors and effects.
/// Access via: Theme.of(context).extension<CyberpunkTheme>()

@immutable
class CyberpunkTheme extends ThemeExtension<CyberpunkTheme> {
  const CyberpunkTheme({
    required this.neonPrimary,
    required this.neonSecondary,
    required this.neonTertiary,
    required this.glassBackground,
    required this.glassBorder,
    required this.glowColor,
    required this.surfaceVariant,
    required this.textMuted,
    required this.primaryGradient,
    required this.secondaryGradient,
    required this.accentGradient,
  });

  /// Primary neon accent (Cyan)
  final Color neonPrimary;

  /// Secondary neon accent (Pink/Magenta)
  final Color neonSecondary;

  /// Tertiary neon accent (Purple)
  final Color neonTertiary;

  /// Glass/frosted background color
  final Color glassBackground;

  /// Glass border color
  final Color glassBorder;

  /// Glow/shadow color for neon effects
  final Color glowColor;

  /// Variant surface for cards/containers
  final Color surfaceVariant;

  /// Muted text color
  final Color textMuted;

  /// Primary gradient
  final LinearGradient primaryGradient;

  /// Secondary gradient
  final LinearGradient secondaryGradient;

  /// Accent gradient
  final LinearGradient accentGradient;

  // ═══════════════════════════════════════════════════════════════════════════
  // 🌙 DARK THEME PRESET (Red & Black)
  // ═══════════════════════════════════════════════════════════════════════════

  static const CyberpunkTheme dark = CyberpunkTheme(
    neonPrimary: AppColors.primaryRed,
    neonSecondary: AppColors.brightRed,
    neonTertiary: AppColors.darkRed,
    glassBackground: AppColors.glassBackgroundDark,
    glassBorder: AppColors.glassBorderDark,
    glowColor: AppColors.primaryRed,
    surfaceVariant: AppColors.darkCard,
    textMuted: AppColors.darkTextMuted,
    primaryGradient: AppColors.primaryGradient,
    secondaryGradient: AppColors.secondaryGradient,
    accentGradient: AppColors.accentGradient,
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // ☀️ LIGHT THEME PRESET (Red & White)
  // ═══════════════════════════════════════════════════════════════════════════

  static const CyberpunkTheme light = CyberpunkTheme(
    neonPrimary: AppColors.primaryRed,
    neonSecondary: AppColors.darkRed,
    neonTertiary: AppColors.deepRed,
    glassBackground: AppColors.glassBackgroundLight,
    glassBorder: AppColors.glassBorderLight,
    glowColor: AppColors.primaryRed,
    surfaceVariant: AppColors.lightCard,
    textMuted: AppColors.lightTextMuted,
    primaryGradient: AppColors.primaryGradient,
    secondaryGradient: AppColors.secondaryGradient,
    accentGradient: AppColors.accentGradient,
  );

  @override
  CyberpunkTheme copyWith({
    Color? neonPrimary,
    Color? neonSecondary,
    Color? neonTertiary,
    Color? glassBackground,
    Color? glassBorder,
    Color? glowColor,
    Color? surfaceVariant,
    Color? textMuted,
    LinearGradient? primaryGradient,
    LinearGradient? secondaryGradient,
    LinearGradient? accentGradient,
  }) {
    return CyberpunkTheme(
      neonPrimary: neonPrimary ?? this.neonPrimary,
      neonSecondary: neonSecondary ?? this.neonSecondary,
      neonTertiary: neonTertiary ?? this.neonTertiary,
      glassBackground: glassBackground ?? this.glassBackground,
      glassBorder: glassBorder ?? this.glassBorder,
      glowColor: glowColor ?? this.glowColor,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      textMuted: textMuted ?? this.textMuted,
      primaryGradient: primaryGradient ?? this.primaryGradient,
      secondaryGradient: secondaryGradient ?? this.secondaryGradient,
      accentGradient: accentGradient ?? this.accentGradient,
    );
  }

  @override
  CyberpunkTheme lerp(ThemeExtension<CyberpunkTheme>? other, double t) {
    if (other is! CyberpunkTheme) return this;

    return CyberpunkTheme(
      neonPrimary: Color.lerp(neonPrimary, other.neonPrimary, t)!,
      neonSecondary: Color.lerp(neonSecondary, other.neonSecondary, t)!,
      neonTertiary: Color.lerp(neonTertiary, other.neonTertiary, t)!,
      glassBackground: Color.lerp(glassBackground, other.glassBackground, t)!,
      glassBorder: Color.lerp(glassBorder, other.glassBorder, t)!,
      glowColor: Color.lerp(glowColor, other.glowColor, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      primaryGradient: LinearGradient.lerp(
        primaryGradient,
        other.primaryGradient,
        t,
      )!,
      secondaryGradient: LinearGradient.lerp(
        secondaryGradient,
        other.secondaryGradient,
        t,
      )!,
      accentGradient: LinearGradient.lerp(
        accentGradient,
        other.accentGradient,
        t,
      )!,
    );
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// 🔧 THEME EXTENSION HELPER
/// ═══════════════════════════════════════════════════════════════════════════

extension CyberpunkThemeX on BuildContext {
  /// Quick access to CyberpunkTheme extension
  CyberpunkTheme get cyberpunk =>
      Theme.of(this).extension<CyberpunkTheme>() ?? CyberpunkTheme.dark;

  /// Check if current theme is dark mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
