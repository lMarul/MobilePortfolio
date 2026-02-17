import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_durations.dart';
import '../../../core/theme/theme_provider.dart';

/// Helper to determine if theme is effectively dark
bool _isEffectivelyDark(ThemeModeOption mode) {
  switch (mode) {
    case ThemeModeOption.dark:
      return true;
    case ThemeModeOption.light:
      return false;
    case ThemeModeOption.system:
      final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.dark;
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// 🌓 THEME TOGGLE BUTTON
/// ═══════════════════════════════════════════════════════════════════════════
/// Premium theme toggle with radial expansion animation.

class ThemeToggleButton extends ConsumerStatefulWidget {
  const ThemeToggleButton({super.key});

  @override
  ConsumerState<ThemeToggleButton> createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends ConsumerState<ThemeToggleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppDurations.slow,
      vsync: this,
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    ));

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 0.8),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.8, end: 1.0),
        weight: 50,
      ),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleTheme() {
    _controller.forward(from: 0);
    ref.read(themeControllerProvider.notifier).toggle();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeControllerProvider);
    final isDark = _isEffectivelyDark(themeMode);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _toggleTheme,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value * (_isHovered ? 1.1 : 1.0),
              child: Transform.rotate(
                angle: _rotationAnimation.value,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: _isHovered
                        ? AppColors.primaryGradient
                        : null,
                    color: _isHovered ? null : AppColors.glass,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _isHovered
                          ? AppColors.primaryRed
                          : AppColors.glassBorder,
                      width: _isHovered ? 2 : 1,
                    ),
                    boxShadow: _isHovered
                        ? [
                            BoxShadow(
                              color: AppColors.primaryRed.withOpacity(0.4),
                              blurRadius: 20,
                              spreadRadius: -5,
                            ),
                          ]
                        : null,
                  ),
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: AppDurations.fast,
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                      child: Icon(
                        isDark ? Icons.light_mode : Icons.dark_mode,
                        key: ValueKey(isDark),
                        color: AppColors.primaryRed,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// 🌈 RADIAL THEME TRANSITION
/// ═══════════════════════════════════════════════════════════════════════════
/// Full-screen radial expansion effect for theme transitions.
/// Wrap your app in this to get View Transition-like effects.

class RadialThemeTransition extends ConsumerStatefulWidget {
  final Widget child;

  const RadialThemeTransition({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<RadialThemeTransition> createState() =>
      _RadialThemeTransitionState();
}

class _RadialThemeTransitionState extends ConsumerState<RadialThemeTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _radiusAnimation;
  bool? _previousTheme;
  Offset _tapPosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _radiusAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleThemeChange(bool isDark) {
    if (_previousTheme != null && _previousTheme != isDark) {
      _controller.forward(from: 0);
    }
    _previousTheme = isDark;
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeControllerProvider);
    final isDark = _isEffectivelyDark(themeMode);
    
    // Detect theme changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleThemeChange(isDark);
    });

    return Listener(
      onPointerDown: (event) {
        _tapPosition = event.position;
      },
      child: Stack(
        children: [
          widget.child,
          
          // Radial overlay
          AnimatedBuilder(
            animation: _radiusAnimation,
            builder: (context, child) {
              if (_controller.isAnimating) {
                return Positioned.fill(
                  child: ClipPath(
                    clipper: _RadialClipper(
                      center: _tapPosition,
                      radius: _radiusAnimation.value * 
                          MediaQuery.of(context).size.longestSide * 1.5,
                    ),
                    child: Container(
                      color: isDark ? AppColors.background : Colors.white,
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

class _RadialClipper extends CustomClipper<Path> {
  final Offset center;
  final double radius;

  _RadialClipper({
    required this.center,
    required this.radius,
  });

  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));
  }

  @override
  bool shouldReclip(covariant _RadialClipper oldClipper) {
    return radius != oldClipper.radius || center != oldClipper.center;
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// 🎛️ FLOATING THEME TOGGLE
/// ═══════════════════════════════════════════════════════════════════════════
/// A floating action button style theme toggle.

class FloatingThemeToggle extends ConsumerWidget {
  const FloatingThemeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);
    final isDark = _isEffectivelyDark(themeMode);

    return Positioned(
      right: 20,
      bottom: 100,
      child: GestureDetector(
        onTap: () => ref.read(themeControllerProvider.notifier).toggle(),
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryRed.withOpacity(0.4),
                blurRadius: 20,
                spreadRadius: -5,
              ),
            ],
          ),
          child: Center(
            child: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
              size: 26,
            ),
          ),
        )
            .animate(onPlay: (c) => c.repeat(reverse: true))
            .moveY(begin: 0, end: -8, duration: 2.seconds),
      ),
    );
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// 🌗 THEME SWITCH PILL
/// ═══════════════════════════════════════════════════════════════════════════
/// A pill-style toggle switch for themes.

class ThemeSwitchPill extends ConsumerStatefulWidget {
  const ThemeSwitchPill({super.key});

  @override
  ConsumerState<ThemeSwitchPill> createState() => _ThemeSwitchPillState();
}

class _ThemeSwitchPillState extends ConsumerState<ThemeSwitchPill> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeControllerProvider);
    final isDark = _isEffectivelyDark(themeMode);

    return GestureDetector(
      onTap: () => ref.read(themeControllerProvider.notifier).toggle(),
      child: Container(
        width: 72,
        height: 36,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.glass,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.glassBorder,
          ),
        ),
        child: Stack(
          children: [
            // Moving indicator
            AnimatedAlign(
              duration: AppDurations.medium,
              curve: Curves.easeOutCubic,
              alignment: isDark ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryRed.withOpacity(0.4),
                      blurRadius: 8,
                      spreadRadius: -2,
                    ),
                  ],
                ),
              ),
            ),

            // Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Icon(
                    Icons.dark_mode,
                    size: 16,
                    color: isDark ? Colors.white : Colors.white.withOpacity(0.4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Icon(
                    Icons.light_mode,
                    size: 16,
                    color: isDark ? Colors.white.withOpacity(0.4) : Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
