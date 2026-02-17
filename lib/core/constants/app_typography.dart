import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🔤 TYPOGRAPHY SYSTEM
/// ═══════════════════════════════════════════════════════════════════════════
/// Premium typography matching the web portfolio:
/// - Cinzel: Elegant serif for headings (premium/luxury feel)
/// - Inter: Clean sans-serif for body text (readability)

abstract final class AppTypography {
  // ═══════════════════════════════════════════════════════════════════════════
  // 🏛️ DISPLAY - Cinzel (Headlines, Hero Text)
  // ═══════════════════════════════════════════════════════════════════════════

  /// Hero title - Massive display text
  static TextStyle displayLarge(Color color) => GoogleFonts.cinzel(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: color,
    letterSpacing: 2.0,
    height: 1.1,
  );

  /// Section headers
  static TextStyle displayMedium(Color color) => GoogleFonts.cinzel(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: 1.5,
    height: 1.2,
  );

  /// Sub-section headers
  static TextStyle displaySmall(Color color) => GoogleFonts.cinzel(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: 1.0,
    height: 1.3,
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // 📝 HEADLINES - Cinzel (Card Titles, Important Text)
  // ═══════════════════════════════════════════════════════════════════════════

  /// Large headline
  static TextStyle headlineLarge(Color color) => GoogleFonts.cinzel(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: 0.5,
    height: 1.3,
  );

  /// Medium headline
  static TextStyle headlineMedium(Color color) => GoogleFonts.cinzel(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: color,
    letterSpacing: 0.25,
    height: 1.4,
  );

  /// Small headline
  static TextStyle headlineSmall(Color color) => GoogleFonts.cinzel(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: color,
    height: 1.4,
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // 📖 TITLES - Inter (UI Elements, Navigation)
  // ═══════════════════════════════════════════════════════════════════════════

  /// Large title
  static TextStyle titleLarge(Color color) => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: 0.15,
    height: 1.4,
  );

  /// Medium title
  static TextStyle titleMedium(Color color) => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: 0.1,
    height: 1.5,
  );

  /// Small title
  static TextStyle titleSmall(Color color) => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: 0.1,
    height: 1.5,
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // 📄 BODY - Inter (Paragraphs, Descriptions)
  // ═══════════════════════════════════════════════════════════════════════════

  /// Large body text
  static TextStyle bodyLarge(Color color) => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: color,
    letterSpacing: 0.15,
    height: 1.6,
  );

  /// Medium body text (default)
  static TextStyle bodyMedium(Color color) => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: color,
    letterSpacing: 0.1,
    height: 1.6,
  );

  /// Small body text
  static TextStyle bodySmall(Color color) => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: color,
    letterSpacing: 0.1,
    height: 1.5,
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // 🏷️ LABELS - Inter (Buttons, Tags, Chips)
  // ═══════════════════════════════════════════════════════════════════════════

  /// Large label
  static TextStyle labelLarge(Color color) => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: 0.5,
    height: 1.4,
  );

  /// Medium label
  static TextStyle labelMedium(Color color) => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: 0.5,
    height: 1.4,
  );

  /// Small label
  static TextStyle labelSmall(Color color) => GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: 0.5,
    height: 1.4,
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // ✨ SPECIAL STYLES
  // ═══════════════════════════════════════════════════════════════════════════

  /// Monospace code text
  static TextStyle code(Color color) => GoogleFonts.firaCode(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: color,
    letterSpacing: 0,
    height: 1.5,
  );

  /// Gradient text shader callback
  static Shader gradientShader(Rect bounds, List<Color> colors) {
    return LinearGradient(
      colors: colors,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(bounds);
  }
}
