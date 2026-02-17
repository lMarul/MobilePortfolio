import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constants/app_strings.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 📱 MARWIN PORTFOLIO APP
/// ═══════════════════════════════════════════════════════════════════════════
/// Root widget with MaterialApp.router, theme configuration, and Riverpod.

class MarwinPortfolioApp extends ConsumerWidget {
  const MarwinPortfolioApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the STATE so the widget rebuilds when the user toggles theme.
    // Previously only the notifier was watched, which never triggers rebuilds.
    ref.watch(themeControllerProvider);
    final themeController = ref.read(themeControllerProvider.notifier);

    return MaterialApp.router(
      // App Info
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,

      // Router
      routerConfig: AppRouter.router,

      // Theme
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeController.themeMode,

      // Builder for global configurations
      builder: (context, child) {
        return MediaQuery(
          // Prevent system font scaling from breaking layouts
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
