import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🔮 FLOATING ORBS
/// ═══════════════════════════════════════════════════════════════════════════
/// Animated floating orbs background effect (matches web particles).

class FloatingOrbs extends StatefulWidget {
  const FloatingOrbs({
    super.key,
    this.orbCount = 5,
  });

  final int orbCount;

  @override
  State<FloatingOrbs> createState() => _FloatingOrbsState();
}

class _FloatingOrbsState extends State<FloatingOrbs>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Orb> _orbs;
  final math.Random _random = math.Random();

  @override
  void initState() {
    super.initState();
    _initializeOrbs();
  }

  void _initializeOrbs() {
    _controllers = [];
    _orbs = [];

    for (int i = 0; i < widget.orbCount; i++) {
      final controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 8 + _random.nextInt(8)),
      )..repeat(reverse: true);

      _controllers.add(controller);

      _orbs.add(Orb(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        size: 100 + _random.nextDouble() * 200,
        color: _getRandomColor(),
        opacity: 0.1 + _random.nextDouble() * 0.15,
        controller: controller,
        offsetX: (_random.nextDouble() - 0.5) * 0.2,
        offsetY: (_random.nextDouble() - 0.5) * 0.2,
      ));
    }
  }

  Color _getRandomColor() {
    final colors = [
      AppColors.primaryRed,
      AppColors.brightRed,
      AppColors.darkRed,
      AppColors.lightRed,
    ];
    return colors[_random.nextInt(colors.length)];
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: _orbs.map((orb) => _buildOrb(orb)).toList(),
      ),
    );
  }

  Widget _buildOrb(Orb orb) {
    return AnimatedBuilder(
      animation: orb.controller,
      builder: (context, child) {
        final screenSize = MediaQuery.sizeOf(context);
        final progress = orb.controller.value;

        // Calculate animated position
        final x = orb.x + (orb.offsetX * progress);
        final y = orb.y + (orb.offsetY * progress);

        return Positioned(
          left: x * screenSize.width - orb.size / 2,
          top: y * screenSize.height - orb.size / 2,
          child: Container(
            width: orb.size,
            height: orb.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  orb.color.withValues(alpha: orb.opacity),
                  orb.color.withValues(alpha: 0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Orb data class
class Orb {
  final double x;
  final double y;
  final double size;
  final Color color;
  final double opacity;
  final AnimationController controller;
  final double offsetX;
  final double offsetY;

  Orb({
    required this.x,
    required this.y,
    required this.size,
    required this.color,
    required this.opacity,
    required this.controller,
    required this.offsetX,
    required this.offsetY,
  });
}
