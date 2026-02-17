import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/theme_extensions.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🌌 ULTIMATE BACKGROUND
/// ═══════════════════════════════════════════════════════════════════════════
/// Animated gradient background with noise texture overlay.

class UltimateBackground extends StatelessWidget {
  const UltimateBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return Positioned.fill(
      child: Stack(
        children: [
          // Base gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [
                        AppColors.darkBackground,
                        const Color(0xFF080808),
                        AppColors.darkBackground,
                      ]
                    : [
                        AppColors.lightBackground,
                        const Color(0xFFFAFAFA),
                        AppColors.lightBackground,
                      ],
              ),
            ),
          ),

          // Radial gradient accent (top-left)
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primaryRed.withValues(alpha: isDark ? 0.12 : 0.08),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Radial gradient accent (bottom-right)
          Positioned(
            bottom: -150,
            right: -150,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.darkRed.withValues(alpha: isDark ? 0.10 : 0.06),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Noise texture overlay
          Positioned.fill(
            child: Opacity(
              opacity: 0.03,
              child: CustomPaint(
                painter: NoisePainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// 📺 NOISE PAINTER
/// ═══════════════════════════════════════════════════════════════════════════
/// Static noise texture for that premium film grain effect.

class NoisePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Simple noise pattern using dots
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final random = DateTime.now().millisecondsSinceEpoch;

    for (int i = 0; i < 2000; i++) {
      final x = ((random * (i + 1) * 7) % size.width.toInt()).toDouble();
      final y = ((random * (i + 1) * 13) % size.height.toInt()).toDouble();
      canvas.drawCircle(Offset(x, y), 0.5, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
