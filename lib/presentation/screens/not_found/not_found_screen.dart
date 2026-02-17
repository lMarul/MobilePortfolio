import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/theme_extensions.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🚫 404 NOT FOUND SCREEN
/// ═══════════════════════════════════════════════════════════════════════════
/// Stylish error page maintaining the cyberpunk aesthetic.

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : Colors.grey.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Glitchy 404
              ShaderMask(
                shaderCallback: (bounds) {
                  return const LinearGradient(
                    colors: [
                      AppColors.primaryRed,
                      AppColors.darkRed,
                      AppColors.brightRed,
                    ],
                  ).createShader(bounds);
                },
                child: Text(
                  '404',
                  style: GoogleFonts.cinzel(
                    fontSize: 120,
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : AppColors.primaryRed,
                    letterSpacing: 8,
                  ),
                ),
              )
                  .animate(onPlay: (c) => c.repeat(reverse: true))
                  .shimmer(
                    duration: 2000.ms,
                    color: AppColors.primaryRed.withValues(alpha: 0.3),
                  ),

              const SizedBox(height: 24),

              // Message
              Text(
                'LOST IN THE VOID',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkTextSecondary,
                  letterSpacing: 6,
                ),
              ).animate().fadeIn(delay: 300.ms),

              const SizedBox(height: 8),

              Text(
                'The page you\'re looking for doesn\'t exist',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.darkTextMuted,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 500.ms),

              const SizedBox(height: 48),

              // Back Button
              OutlinedButton.icon(
                onPressed: () => context.go(AppRouter.home),
                icon: const Icon(Icons.arrow_back),
                label: const Text('RETURN HOME'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: context.cyberpunk.neonPrimary,
                  side: BorderSide(color: context.cyberpunk.neonPrimary),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
              ).animate().fadeIn(delay: 700.ms).slideY(begin: 0.2, end: 0),
            ],
          ),
        ),
      ),
    );
  }
}
