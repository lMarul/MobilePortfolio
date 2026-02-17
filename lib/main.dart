import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🚀 MAIN ENTRY POINT
/// ═══════════════════════════════════════════════════════════════════════════
/// Initializes the app with Riverpod and system UI configuration.
/// All portfolio data is stored locally for instant, offline-first loading.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure system UI overlay
  try {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFF000000),
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    // Lock to portrait mode for optimal experience
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  } catch (e) {
    debugPrint('❌ System UI configuration failed: $e');
    // Continue anyway
  }

  runApp(
    const ProviderScope(
      child: MarwinPortfolioApp(),
    ),
  );
}
