import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 📱 RESPONSIVE BREAKPOINTS
/// ═══════════════════════════════════════════════════════════════════════════
/// Responsive design utilities for different screen sizes.

abstract final class Responsive {
  // ═══════════════════════════════════════════════════════════════════════════
  // 📐 BREAKPOINTS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Mobile max width
  static const double mobileMaxWidth = 600;

  /// Tablet max width
  static const double tabletMaxWidth = 900;

  /// Desktop max width
  static const double desktopMaxWidth = 1200;

  // ═══════════════════════════════════════════════════════════════════════════
  // 🔍 DEVICE TYPE CHECKS
  // ═══════════════════════════════════════════════════════════════════════════

  /// Is mobile screen
  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width < mobileMaxWidth;
  }

  /// Is tablet screen
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= mobileMaxWidth && width < tabletMaxWidth;
  }

  /// Is desktop screen
  static bool isDesktop(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= tabletMaxWidth;
  }

  // ═══════════════════════════════════════════════════════════════════════════
  // 📏 RESPONSIVE VALUES
  // ═══════════════════════════════════════════════════════════════════════════

  /// Get value based on screen size
  static T value<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context)) return desktop ?? tablet ?? mobile;
    if (isTablet(context)) return tablet ?? mobile;
    return mobile;
  }

  /// Get responsive padding
  static EdgeInsets padding(BuildContext context) {
    return value(
      context,
      mobile: const EdgeInsets.symmetric(horizontal: 16),
      tablet: const EdgeInsets.symmetric(horizontal: 32),
      desktop: const EdgeInsets.symmetric(horizontal: 48),
    );
  }

  /// Get responsive content width
  static double contentWidth(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return value(
      context,
      mobile: screenWidth,
      tablet: screenWidth * 0.85,
      desktop: desktopMaxWidth,
    );
  }

  /// Get responsive columns for grid
  static int gridColumns(BuildContext context) {
    return value(
      context,
      mobile: 1,
      tablet: 2,
      desktop: 3,
    );
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// 🎯 RESPONSIVE BUILDER WIDGET
/// ═══════════════════════════════════════════════════════════════════════════

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= Responsive.tabletMaxWidth) {
          return desktop ?? tablet ?? mobile;
        }
        if (constraints.maxWidth >= Responsive.mobileMaxWidth) {
          return tablet ?? mobile;
        }
        return mobile;
      },
    );
  }
}
