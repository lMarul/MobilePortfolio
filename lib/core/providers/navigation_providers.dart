import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🧭 NAVIGATION STATE PROVIDER
/// ═══════════════════════════════════════════════════════════════════════════
/// Tracks navigation context and scroll positions for smart back button behavior

enum NavigationSource {
  sidebar,      // User came from sidebar/drawer
  homeSection,  // User came from a section on home page
}

class NavigationState {
  final NavigationSource source;
  final double scrollPosition;  // Scroll position to restore on home page
  final String? sectionKey;     // Section identifier (e.g., 'projects', 'hackathons')

  const NavigationState({
    this.source = NavigationSource.sidebar,
    this.scrollPosition = 0.0,
    this.sectionKey,
  });

  NavigationState copyWith({
    NavigationSource? source,
    double? scrollPosition,
    String? sectionKey,
  }) {
    return NavigationState(
      source: source ?? this.source,
      scrollPosition: scrollPosition ?? this.scrollPosition,
      sectionKey: sectionKey ?? this.sectionKey,
    );
  }
}

class NavigationNotifier extends Notifier<NavigationState> {
  @override
  NavigationState build() => const NavigationState();

  /// Set navigation from sidebar
  void setFromSidebar() {
    state = const NavigationState(source: NavigationSource.sidebar);
  }

  /// Set navigation from home page section with scroll position
  void setFromHomeSection({
    required String sectionKey,
    required double scrollPosition,
  }) {
    state = NavigationState(
      source: NavigationSource.homeSection,
      scrollPosition: scrollPosition,
      sectionKey: sectionKey,
    );
  }

  /// Reset navigation state
  void reset() {
    state = const NavigationState();
  }
}

final navigationProvider =
    NotifierProvider<NavigationNotifier, NavigationState>(
  NavigationNotifier.new,
);

/// Global keys for section widgets on home page
class HomeSectionKeys {
  static final GlobalKey heroKey = GlobalKey();
  static final GlobalKey aboutKey = GlobalKey();
  static final GlobalKey skillsKey = GlobalKey();
  static final GlobalKey experienceKey = GlobalKey();
  static final GlobalKey projectsKey = GlobalKey();
  static final GlobalKey hackathonsKey = GlobalKey();
  static final GlobalKey certificationsKey = GlobalKey();
  static final GlobalKey contactKey = GlobalKey();
}
