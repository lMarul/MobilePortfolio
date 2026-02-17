/// ═══════════════════════════════════════════════════════════════════════════
/// ⏱️ ANIMATION DURATIONS
/// ═══════════════════════════════════════════════════════════════════════════
/// Standardized timing for smooth, consistent animations across the app.
/// Based on Material Design motion principles with a premium feel.
library;

abstract final class AppDurations {
  // ═══════════════════════════════════════════════════════════════════════════
  // 🚀 MICRO INTERACTIONS (Instant feedback)
  // ═══════════════════════════════════════════════════════════════════════════

  /// Button press feedback
  static const Duration instant = Duration(milliseconds: 50);

  /// Ripple effects
  static const Duration fastest = Duration(milliseconds: 100);

  /// Hover states, focus rings
  static const Duration fast = Duration(milliseconds: 150);

  // ═══════════════════════════════════════════════════════════════════════════
  // 🎭 STANDARD TRANSITIONS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Default animation duration
  static const Duration normal = Duration(milliseconds: 300);

  /// Card expansions, dropdowns
  static const Duration medium = Duration(milliseconds: 250);

  /// Modal/sheet animations
  static const Duration slow = Duration(milliseconds: 500);

  // ═══════════════════════════════════════════════════════════════════════════
  // ✨ PREMIUM ANIMATIONS (The "Wow" Factor)
  // ═══════════════════════════════════════════════════════════════════════════

  /// Page transitions
  static const Duration pageTransition = Duration(milliseconds: 600);

  /// Hero animations
  static const Duration hero = Duration(milliseconds: 800);

  /// Splash/loading screen
  static const Duration splash = Duration(milliseconds: 2000);

  /// Theme transition (radial expansion)
  static const Duration themeTransition = Duration(milliseconds: 700);

  // ═══════════════════════════════════════════════════════════════════════════
  // 🔄 CONTINUOUS ANIMATIONS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Particle float cycle
  static const Duration particleFloat = Duration(seconds: 4);

  /// Gradient rotation
  static const Duration gradientRotation = Duration(seconds: 8);

  /// Glow pulse
  static const Duration glowPulse = Duration(seconds: 2);

  /// Shimmer sweep
  static const Duration shimmer = Duration(milliseconds: 1500);

  // ═══════════════════════════════════════════════════════════════════════════
  // ⏳ DELAYS (Stagger animations)
  // ═══════════════════════════════════════════════════════════════════════════

  /// Stagger delay between list items
  static const Duration staggerDelay = Duration(milliseconds: 50);

  /// Section entrance delay
  static const Duration sectionDelay = Duration(milliseconds: 100);

  /// Initial load delay (let page settle)
  static const Duration initialDelay = Duration(milliseconds: 200);
}
