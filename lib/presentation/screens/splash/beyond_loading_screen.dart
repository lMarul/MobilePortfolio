import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_durations.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/router/app_router.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// ✨ BEYOND LOADING SCREEN
/// ═══════════════════════════════════════════════════════════════════════════
/// Stunning splash screen with particles, glitch effects, and premium animations.
/// Matches the web portfolio's BeyondLoadingScreen energy.

class BeyondLoadingScreen extends StatefulWidget {
  const BeyondLoadingScreen({super.key});

  @override
  State<BeyondLoadingScreen> createState() => _BeyondLoadingScreenState();
}

class _BeyondLoadingScreenState extends State<BeyondLoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController _particleController;
  late AnimationController _pulseController;
  late AnimationController _glitchController;

  final List<Particle> _particles = [];
  bool _showContent = false;
  bool _isExiting = false;

  @override
  void initState() {
    super.initState();
    _initializeParticles();
    _initializeAnimations();
    _startLoadingSequence();
  }

  void _initializeParticles() {
    final random = math.Random();
    for (int i = 0; i < 50; i++) {
      _particles.add(Particle(
        x: random.nextDouble(),
        y: random.nextDouble(),
        size: random.nextDouble() * 3 + 1,
        speedX: (random.nextDouble() - 0.5) * 0.002,
        speedY: (random.nextDouble() - 0.5) * 0.002,
        opacity: random.nextDouble() * 0.5 + 0.2,
      ));
    }
  }

  void _initializeAnimations() {
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _pulseController = AnimationController(
      vsync: this,
      duration: AppDurations.glowPulse,
    )..repeat(reverse: true);

    _glitchController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    // Trigger random glitches
    _triggerRandomGlitches();
  }

  void _triggerRandomGlitches() async {
    final random = math.Random();
    while (mounted && !_isExiting) {
      await Future.delayed(Duration(milliseconds: random.nextInt(2000) + 500));
      if (mounted && !_isExiting) {
        _glitchController.forward().then((_) => _glitchController.reverse());
      }
    }
  }

  void _startLoadingSequence() async {
    // Show content after a brief delay
    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) {
      setState(() => _showContent = true);
    }

    // Navigate to home after splash duration
    await Future.delayed(AppDurations.splash);
    if (mounted) {
      setState(() => _isExiting = true);
      await Future.delayed(AppDurations.pageTransition);
      if (mounted) {
        context.go(AppRouter.login);
      }
    }
  }

  @override
  void dispose() {
    _particleController.dispose();
    _pulseController.dispose();
    _glitchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Stack(
        children: [
          // Particle Field
          AnimatedBuilder(
            animation: _particleController,
            builder: (context, child) {
              return CustomPaint(
                painter: ParticlePainter(
                  particles: _particles,
                  time: _particleController.value,
                ),
                size: size,
              );
            },
          ),

          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.5,
                colors: [
                  AppColors.primaryRed.withValues(alpha: 0.05),
                  AppColors.darkBackground.withValues(alpha: 0.8),
                  AppColors.darkBackground,
                ],
              ),
            ),
          ),

          // Main Content
          Center(
            child: AnimatedOpacity(
              opacity: _isExiting ? 0 : 1,
              duration: AppDurations.pageTransition,
              child: _showContent
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo/Name with Glitch Effect
                        AnimatedBuilder(
                          animation: _glitchController,
                          builder: (context, child) {
                            final glitch = _glitchController.value;
                            return Transform.translate(
                              offset: Offset(
                                math.sin(glitch * math.pi * 4) * 3 * glitch,
                                0,
                              ),
                              child: ShaderMask(
                                shaderCallback: (bounds) {
                                  return LinearGradient(
                                    colors: [
                                      AppColors.primaryRed,
                                      AppColors.darkRed,
                                      AppColors.brightRed,
                                    ],
                                  ).createShader(bounds);
                                },
                                child: Text(
                                  'M',
                                  style: GoogleFonts.cinzel(
                                    fontSize: 80,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    letterSpacing: 4,
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                            .animate()
                            .fadeIn(duration: 600.ms, delay: 200.ms)
                            .scale(
                              begin: const Offset(0.8, 0.8),
                              end: const Offset(1, 1),
                              duration: 800.ms,
                              curve: Curves.easeOutBack,
                            ),

                        const SizedBox(height: 24),

                        // Subtitle
                        Text(
                          AppStrings.heroName.toUpperCase(),
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkTextSecondary,
                            letterSpacing: 6,
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 600.ms, delay: 600.ms)
                            .slideY(begin: 0.3, end: 0),

                        const SizedBox(height: 48),

                        // Loading Indicator
                        _LoadingIndicator(pulseController: _pulseController)
                            .animate()
                            .fadeIn(duration: 400.ms, delay: 1000.ms),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
          ),

          // Scan Lines Overlay
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(
                painter: ScanLinePainter(),
              ),
            ),
          ),

          // Vignette
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 1.2,
                    colors: [
                      Colors.transparent,
                      AppColors.darkBackground.withValues(alpha: 0.7),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// 🔄 LOADING INDICATOR
/// ═══════════════════════════════════════════════════════════════════════════

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({required this.pulseController});

  final AnimationController pulseController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        children: [
          // Progress Bar
          AnimatedBuilder(
            animation: pulseController,
            builder: (context, child) {
              return Container(
                height: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryRed.withValues(
                        alpha: 0.3 + pulseController.value * 0.3,
                      ),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1),
                  child: LinearProgressIndicator(
                    backgroundColor: AppColors.darkCard,
                    valueColor: AlwaysStoppedAnimation(
                      AppColors.primaryRed.withValues(
                        alpha: 0.7 + pulseController.value * 0.3,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 16),

          // Loading Text
          Text(
            'LOADING',
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.darkTextMuted,
              letterSpacing: 4,
            ),
          ),
        ],
      ),
    );
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// ✨ PARTICLE DATA CLASS
/// ═══════════════════════════════════════════════════════════════════════════

class Particle {
  double x;
  double y;
  final double size;
  final double speedX;
  final double speedY;
  final double opacity;

  Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speedX,
    required this.speedY,
    required this.opacity,
  });
}

/// ═══════════════════════════════════════════════════════════════════════════
/// 🎨 PARTICLE PAINTER
/// ═══════════════════════════════════════════════════════════════════════════

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double time;

  ParticlePainter({required this.particles, required this.time});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (final particle in particles) {
      // Update position
      particle.x += particle.speedX;
      particle.y += particle.speedY;

      // Wrap around
      if (particle.x < 0) particle.x = 1;
      if (particle.x > 1) particle.x = 0;
      if (particle.y < 0) particle.y = 1;
      if (particle.y > 1) particle.y = 0;

      // Draw particle with glow
      final position = Offset(
        particle.x * size.width,
        particle.y * size.height,
      );

      // Glow
      paint.color = AppColors.primaryRed.withValues(alpha: particle.opacity * 0.3);
      canvas.drawCircle(position, particle.size * 3, paint);

      // Core
      paint.color = AppColors.primaryRed.withValues(alpha: particle.opacity);
      canvas.drawCircle(position, particle.size, paint);
    }

    // Draw connection lines between nearby particles
    paint.strokeWidth = 0.5;
    for (int i = 0; i < particles.length; i++) {
      for (int j = i + 1; j < particles.length; j++) {
        final p1 = particles[i];
        final p2 = particles[j];

        final dx = (p1.x - p2.x) * size.width;
        final dy = (p1.y - p2.y) * size.height;
        final distance = math.sqrt(dx * dx + dy * dy);

        if (distance < 100) {
          final alpha = (1 - distance / 100) * 0.2;
          paint.color = AppColors.primaryRed.withValues(alpha: alpha);
          canvas.drawLine(
            Offset(p1.x * size.width, p1.y * size.height),
            Offset(p2.x * size.width, p2.y * size.height),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant ParticlePainter oldDelegate) => true;
}

/// ═══════════════════════════════════════════════════════════════════════════
/// 📺 SCAN LINE PAINTER
/// ═══════════════════════════════════════════════════════════════════════════

class ScanLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withValues(alpha: 0.05)
      ..strokeWidth = 1;

    for (double y = 0; y < size.height; y += 3) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
