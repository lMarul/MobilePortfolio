import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/app_colors.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// ✨ SHIMMER TEXT
/// ═══════════════════════════════════════════════════════════════════════════
/// Text with animated shimmer/shine effect.

class ShimmerText extends StatelessWidget {
  const ShimmerText({
    super.key,
    required this.text,
    required this.style,
    this.shimmerColor,
    this.animate = true,
    this.textAlign,
  });

  final String text;
  final TextStyle style;
  final Color? shimmerColor;
  final bool animate;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    Widget textWidget = Text(text, style: style, textAlign: textAlign);

    if (animate) {
      textWidget = textWidget
          .animate(onPlay: (c) => c.repeat())
          .shimmer(
            duration: 2000.ms,
            color: shimmerColor ?? AppColors.primaryRed.withValues(alpha: 0.3),
          );
    }

    return textWidget;
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// 🌈 GRADIENT TEXT
/// ═══════════════════════════════════════════════════════════════════════════
/// Text with gradient fill.

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.text,
    required this.style,
    required this.gradient,
  });

  final String text;
  final TextStyle style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: Text(text, style: style.copyWith(color: Colors.white)),
    );
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// 🔆 NEON TEXT
/// ═══════════════════════════════════════════════════════════════════════════
/// Text with neon glow effect.

class NeonText extends StatelessWidget {
  const NeonText({
    super.key,
    required this.text,
    required this.style,
    required this.glowColor,
    this.glowRadius = 20,
  });

  final String text;
  final TextStyle style;
  final Color glowColor;
  final double glowRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Glow layer
        Text(
          text,
          style: style.copyWith(
            foreground: Paint()
              ..color = glowColor
              ..maskFilter = MaskFilter.blur(BlurStyle.normal, glowRadius),
          ),
        ),
        // Main text
        Text(text, style: style),
      ],
    );
  }
}
