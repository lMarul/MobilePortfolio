import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🎨 THEME PROVIDER
/// ═══════════════════════════════════════════════════════════════════════════
/// Manages the app's theme state with Riverpod.
/// Supports system, light, and dark modes with smooth transitions.

enum ThemeModeOption {
  system,
  light,
  dark,
}

@riverpod
class ThemeController extends _$ThemeController {
  @override
  ThemeModeOption build() {
    // Default to system theme
    return ThemeModeOption.system;
  }

  /// Toggle between light and dark mode
  void toggle() {
    final currentBrightness = _getCurrentBrightness();
    state = currentBrightness == Brightness.dark
        ? ThemeModeOption.light
        : ThemeModeOption.dark;
  }

  /// Set specific theme mode
  void setThemeMode(ThemeModeOption mode) {
    state = mode;
  }

  /// Get the actual ThemeMode for MaterialApp
  ThemeMode get themeMode {
    switch (state) {
      case ThemeModeOption.light:
        return ThemeMode.light;
      case ThemeModeOption.dark:
        return ThemeMode.dark;
      case ThemeModeOption.system:
        return ThemeMode.system;
    }
  }

  /// Get current brightness (resolves system theme)
  Brightness _getCurrentBrightness() {
    if (state == ThemeModeOption.system) {
      return SchedulerBinding.instance.platformDispatcher.platformBrightness;
    }
    return state == ThemeModeOption.dark ? Brightness.dark : Brightness.light;
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// 🔄 THEME TRANSITION STATE
/// ═══════════════════════════════════════════════════════════════════════════
/// Tracks theme transition for animation purposes.

@riverpod
class ThemeTransitionState extends _$ThemeTransitionState {
  @override
  bool build() => false;

  /// Set transitioning state
  void setTransitioning(bool value) {
    state = value;
  }
}
