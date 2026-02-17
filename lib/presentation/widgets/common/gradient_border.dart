import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🌈 GRADIENT BORDER
/// ═══════════════════════════════════════════════════════════════════════════
/// Container with animated gradient border effect.

class GradientBorder extends StatelessWidget {
  const GradientBorder({
    super.key,
    required this.child,
    required this.gradient,
    this.strokeWidth = 2,
    this.borderRadius = 12,
    this.padding = EdgeInsets.zero,
  });

  final Widget child;
  final Gradient gradient;
  final double strokeWidth;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GradientBorderPainter(
        gradient: gradient,
        strokeWidth: strokeWidth,
        borderRadius: borderRadius,
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}

class _GradientBorderPainter extends CustomPainter {
  final Gradient gradient;
  final double strokeWidth;
  final double borderRadius;

  _GradientBorderPainter({
    required this.gradient,
    required this.strokeWidth,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRadius),
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant _GradientBorderPainter oldDelegate) {
    return gradient != oldDelegate.gradient ||
        strokeWidth != oldDelegate.strokeWidth ||
        borderRadius != oldDelegate.borderRadius;
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// ✨ ANIMATED GRADIENT BORDER
/// ═══════════════════════════════════════════════════════════════════════════
/// Gradient border with rotation animation.

class AnimatedGradientBorder extends StatefulWidget {
  const AnimatedGradientBorder({
    super.key,
    required this.child,
    this.colors,
    this.strokeWidth = 2,
    this.borderRadius = 12,
    this.duration = const Duration(seconds: 3),
  });

  final Widget child;
  final List<Color>? colors;
  final double strokeWidth;
  final double borderRadius;
  final Duration duration;

  @override
  State<AnimatedGradientBorder> createState() => _AnimatedGradientBorderState();
}

class _AnimatedGradientBorderState extends State<AnimatedGradientBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = widget.colors ??
        [
          const Color(0xFF00F5FF),
          const Color(0xFF8B5CF6),
          const Color(0xFFFF00FF),
          const Color(0xFF00F5FF),
        ];

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return GradientBorder(
          gradient: SweepGradient(
            startAngle: _controller.value * 6.28,
            colors: colors,
          ),
          strokeWidth: widget.strokeWidth,
          borderRadius: widget.borderRadius,
          child: widget.child,
        );
      },
    );
  }
}
