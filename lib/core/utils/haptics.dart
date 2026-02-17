import 'package:flutter/services.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 📳 HAPTIC FEEDBACK UTILITIES
/// ═══════════════════════════════════════════════════════════════════════════
/// Tactile feedback for premium touch interactions.

abstract final class Haptics {
  /// Light tap feedback (buttons, toggles)
  static void light() => HapticFeedback.lightImpact();

  /// Medium tap feedback (selections, confirmations)
  static void medium() => HapticFeedback.mediumImpact();

  /// Heavy tap feedback (important actions, errors)
  static void heavy() => HapticFeedback.heavyImpact();

  /// Selection change feedback (lists, pickers)
  static void selection() => HapticFeedback.selectionClick();

  /// Vibrate pattern (notifications)
  static void vibrate() => HapticFeedback.vibrate();
}
