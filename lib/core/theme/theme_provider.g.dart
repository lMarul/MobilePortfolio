// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeControllerHash() => r'8b6630e618c58d23503cfc023e5c00f4cc4394ea';

/// See also [ThemeController].
@ProviderFor(ThemeController)
final themeControllerProvider =
    AutoDisposeNotifierProvider<ThemeController, ThemeModeOption>.internal(
      ThemeController.new,
      name: r'themeControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$themeControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ThemeController = AutoDisposeNotifier<ThemeModeOption>;
String _$themeTransitionStateHash() =>
    r'565782b62c699717cbb29f372276aa67b38f3c72';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🔄 THEME TRANSITION STATE
/// ═══════════════════════════════════════════════════════════════════════════
/// Tracks theme transition for animation purposes.
///
/// Copied from [ThemeTransitionState].
@ProviderFor(ThemeTransitionState)
final themeTransitionStateProvider =
    AutoDisposeNotifierProvider<ThemeTransitionState, bool>.internal(
      ThemeTransitionState.new,
      name: r'themeTransitionStateProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$themeTransitionStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ThemeTransitionState = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
