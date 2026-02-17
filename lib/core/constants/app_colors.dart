import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🎨 RED & WHITE/BLACK COLOR PALETTE
/// ═══════════════════════════════════════════════════════════════════════════
/// Premium color system matching the web portfolio's aesthetic.
/// Red accent with white (light mode) and black (dark mode) backgrounds.

abstract final class AppColors {
  // ═══════════════════════════════════════════════════════════════════════════
  // 🔴 PRIMARY ACCENT COLORS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Primary Red - Main accent color
  static const Color primaryRed = Color(0xFFDC2626);

  /// Bright Red - For glows and highlights
  static const Color brightRed = Color(0xFFEF4444);

  /// Dark Red - For pressed/active states
  static const Color darkRed = Color(0xFFB91C1C);

  /// Deep Red - Rich variant
  static const Color deepRed = Color(0xFF991B1B);

  /// Light Red - Soft variant
  static const Color lightRed = Color(0xFFFCA5A5);

  /// Red Glow - For shadows and glows
  static const Color redGlow = Color(0x66DC2626);

  // ═══════════════════════════════════════════════════════════════════════════
  // 🌙 DARK THEME - Primary Palette (Red & Black)
  // ═══════════════════════════════════════════════════════════════════════════

  /// Pure black background
  static const Color darkBackground = Color(0xFF000000);

  /// Slightly elevated surface
  static const Color darkSurface = Color(0xFF0A0A0A);

  /// Card/container background
  static const Color darkCard = Color(0xFF141414);

  /// Elevated elements
  static const Color darkElevated = Color(0xFF1C1C1C);

  /// Primary text (white)
  static const Color darkTextPrimary = Color(0xFFFFFFFF);

  /// Secondary text
  static const Color darkTextSecondary = Color(0xFFB0B0B0);

  /// Muted text
  static const Color darkTextMuted = Color(0xFF707070);

  // ═══════════════════════════════════════════════════════════════════════════
  // ☀️ LIGHT THEME - Primary Palette (Red & White)
  // ═══════════════════════════════════════════════════════════════════════════

  /// Pure white background
  static const Color lightBackground = Color(0xFFFFFFFF);

  /// Slightly off-white surface
  static const Color lightSurface = Color(0xFFFAFAFA);

  /// Card background
  static const Color lightCard = Color(0xFFFFFFFF);

  /// Elevated elements
  static const Color lightElevated = Color(0xFFF5F5F5);

  /// Primary text (black)
  static const Color lightTextPrimary = Color(0xFF0A0A0A);

  /// Secondary text
  static const Color lightTextSecondary = Color(0xFF4A4A4A);

  /// Muted text
  static const Color lightTextMuted = Color(0xFF8A8A8A);

  // ═══════════════════════════════════════════════════════════════════════════
  // ✨ ACCENT COLORS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Electric Cyan - Legacy (kept for compatibility)
  static const Color neonCyan = primaryRed;

  /// Hot Pink/Magenta - Legacy (kept for compatibility)
  static const Color neonPink = brightRed;

  /// Electric Purple - Legacy (kept for compatibility)
  static const Color neonPurple = darkRed;

  /// Neon Blue - Secondary accent
  static const Color neonBlue = Color(0xFF3B82F6);

  /// Neon Green (for success states)
  static const Color neonGreen = Color(0xFF22C55E);

  /// Neon Orange (for warnings)
  static const Color neonOrange = Color(0xFFF97316);

  /// Neon Red (for errors)
  static const Color neonRed = Color(0xFFEF4444);

  // ═══════════════════════════════════════════════════════════════════════════
  // 🌈 GRADIENTS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Primary gradient (Red → Dark Red)
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [brightRed, darkRed],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Secondary gradient (Light Red → Red)
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [lightRed, primaryRed],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Accent gradient (Bright Red → Primary Red)
  static const LinearGradient accentGradient = LinearGradient(
    colors: [brightRed, primaryRed],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  /// Animated border gradient (red spectrum)
  static const LinearGradient borderGradient = LinearGradient(
    colors: [brightRed, primaryRed, darkRed, brightRed],
    stops: [0.0, 0.33, 0.66, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Dark fade gradient (for overlays)
  static const LinearGradient darkFadeGradient = LinearGradient(
    colors: [Colors.transparent, darkBackground],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Light fade gradient (for overlays)
  static const LinearGradient lightFadeGradient = LinearGradient(
    colors: [Colors.transparent, lightBackground],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // 🪟 GLASSMORPHISM COLORS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Glass background (dark mode)
  static const Color glassBackgroundDark = Color(0x1AFFFFFF);

  /// Glass border (dark mode)
  static const Color glassBorderDark = Color(0x33FFFFFF);

  /// Glass background (light mode)
  static const Color glassBackgroundLight = Color(0x80FFFFFF);

  /// Glass border (light mode)
  static const Color glassBorderLight = Color(0x4DFFFFFF);

  /// Red glass tint (dark mode)
  static const Color redGlassDark = Color(0x1ADC2626);

  /// Red glass tint (light mode)
  static const Color redGlassLight = Color(0x26DC2626);

  // ═══════════════════════════════════════════════════════════════════════════
  // 🎯 CONVENIENCE ALIASES (for easier usage)
  // ═══════════════════════════════════════════════════════════════════════════

  /// Default glass color
  static const Color glass = glassBackgroundDark;

  /// Default glass border
  static const Color glassBorder = glassBorderDark;

  /// Default surface color
  static const Color surface = darkSurface;

  /// Light surface color
  static const Color surfaceLight = darkElevated;

  /// Default background
  static const Color background = darkBackground;

  // ═══════════════════════════════════════════════════════════════════════════
  // 🔆 GLOW COLORS (for shadows/effects)
  // ═══════════════════════════════════════════════════════════════════════════

  /// Primary red glow
  static Color primaryGlow = primaryRed.withValues(alpha: 0.4);

  /// Bright red glow
  static Color brightGlow = brightRed.withValues(alpha: 0.4);

  /// Dark red glow
  static Color darkGlow = darkRed.withValues(alpha: 0.4);

  /// Legacy compatibility
  static Color cyanGlow = primaryRed.withValues(alpha: 0.4);
  static Color pinkGlow = brightRed.withValues(alpha: 0.4);
  static Color purpleGlow = darkRed.withValues(alpha: 0.4);
}
