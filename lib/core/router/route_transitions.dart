import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_durations.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// ✨ CUSTOM PAGE TRANSITIONS
/// ═══════════════════════════════════════════════════════════════════════════
/// Premium page transitions for that "Awwwards" feel.

abstract final class RouteTransitions {
  // ═══════════════════════════════════════════════════════════════════════════
  // 🔄 FADE TRANSITION
  // ═══════════════════════════════════════════════════════════════════════════

  static CustomTransitionPage<void> fade({
    required LocalKey key,
    required Widget child,
    Duration? duration,
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      transitionDuration: duration ?? AppDurations.pageTransition,
      reverseTransitionDuration: duration ?? AppDurations.pageTransition,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          ),
          child: child,
        );
      },
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // ⬆️ SLIDE UP TRANSITION
  // ═══════════════════════════════════════════════════════════════════════════

  static CustomTransitionPage<void> slideUp({
    required LocalKey key,
    required Widget child,
    Duration? duration,
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      transitionDuration: duration ?? AppDurations.pageTransition,
      reverseTransitionDuration: duration ?? AppDurations.pageTransition,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.1),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: FadeTransition(
            opacity: curvedAnimation,
            child: child,
          ),
        );
      },
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // ⬅️ SLIDE LEFT TRANSITION
  // ═══════════════════════════════════════════════════════════════════════════

  static CustomTransitionPage<void> slideLeft({
    required LocalKey key,
    required Widget child,
    Duration? duration,
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      transitionDuration: duration ?? AppDurations.pageTransition,
      reverseTransitionDuration: duration ?? AppDurations.pageTransition,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );

        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.2, 0),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: FadeTransition(
            opacity: curvedAnimation,
            child: child,
          ),
        );
      },
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // 📐 SCALE TRANSITION
  // ═══════════════════════════════════════════════════════════════════════════

  static CustomTransitionPage<void> scale({
    required LocalKey key,
    required Widget child,
    Duration? duration,
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      transitionDuration: duration ?? AppDurations.pageTransition,
      reverseTransitionDuration: duration ?? AppDurations.pageTransition,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        );

        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.95,
            end: 1.0,
          ).animate(curvedAnimation),
          child: FadeTransition(
            opacity: curvedAnimation,
            child: child,
          ),
        );
      },
    );
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // 🌀 ROTATION TRANSITION (Premium)
  // ═══════════════════════════════════════════════════════════════════════════

  static CustomTransitionPage<void> rotation({
    required LocalKey key,
    required Widget child,
    Duration? duration,
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      transitionDuration: duration ?? AppDurations.hero,
      reverseTransitionDuration: duration ?? AppDurations.hero,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        );

        return RotationTransition(
          turns: Tween<double>(
            begin: -0.02,
            end: 0,
          ).animate(curvedAnimation),
          child: ScaleTransition(
            scale: Tween<double>(
              begin: 0.9,
              end: 1.0,
            ).animate(curvedAnimation),
            child: FadeTransition(
              opacity: curvedAnimation,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
