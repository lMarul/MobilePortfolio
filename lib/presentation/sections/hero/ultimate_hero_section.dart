import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_durations.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/providers/navigation_providers.dart';
import '../../../core/theme/theme_extensions.dart';
import '../../../core/utils/extensions.dart';
import '../../widgets/common/gradient_border.dart';
import '../../widgets/common/profile_avatar.dart';
import '../../widgets/common/shimmer_text.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🦸 ULTIMATE HERO SECTION — Mobile-First Refactor
/// ═══════════════════════════════════════════════════════════════════════════
///
/// **Why this redesign?**
///
/// The previous implementation left-aligned all text and crammed it into
/// a narrow column that felt like a copy-paste of the web layout. On a
/// 360-428dp phone screen, that creates two problems:
///   1. The asymmetric weight pulls the eye to the left margin, leaving
///      dead space on the right.
///   2. Without a clear focal point (avatar/image) the section reads as
///      a generic text block rather than a "hero" statement.
///
/// Mobile-first solution (vertical stack, centered):
///   • Large centered avatar/initials circle → immediate visual anchor.
///   • Greeting line → small caps, red accent, centered.
///   • Name → downsized to 26-30sp (was 32-48sp on web) so it never
///     wraps more than 2 lines on the narrowest screens.
///   • Typewriter role → centered below name for rhythm.
///   • Description → capped at 3-4 lines (~13sp Inter) for readability.
///   • CTA buttons → full-width row, both equally weighted.
///   • Scroll indicator → bottom-centered.
///
/// Font-size rationale:
///   - H1 (name) = 28sp → fits 2-word names on 360dp without clipping.
///   - Subtitle / role = 18sp → noticeable hierarchy step-down.
///   - Body = 13sp → comfortable mobile reading size at arm's length.

class UltimateHeroSection extends ConsumerStatefulWidget {
  const UltimateHeroSection({super.key});

  @override
  ConsumerState<UltimateHeroSection> createState() => _UltimateHeroSectionState();
}

class _UltimateHeroSectionState extends ConsumerState<UltimateHeroSection>
    with TickerProviderStateMixin {
  late AnimationController _glowController;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      vsync: this,
      duration: AppDurations.glowPulse,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  /// Scroll to a section by its GlobalKey - using Flutter's ensureVisible
  void _scrollToSection(GlobalKey sectionKey) {
    final context = sectionKey.currentContext;
    if (context != null) {
      // Use Flutter's built-in ensureVisible which handles all the complex scroll logic
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOutCubic,
        alignment: 0.1, // Scroll so the section is 10% from the top (accounts for app bar)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cyberpunk = context.cyberpunk;
    final theme = Theme.of(context);
    final screenHeight = context.screenHeight;
    final screenWidth = context.screenWidth;
    final isSmall = screenWidth < 360;

    return SizedBox(
      // Fill most of the viewport but account for the SliverAppBar above.
      height: screenHeight * 0.88,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isSmall ? 20 : 24),
        child: Column(
          children: [
            const Spacer(flex: 2),

            // ── 1. Avatar / Profile Picture ──
            AnimatedBuilder(
                  animation: _glowController,
                  builder: (context, child) {
                    return Container(
                      width: isSmall ? 96 : 110,
                      height: isSmall ? 96 : 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: cyberpunk.neonPrimary.withValues(
                              alpha: 0.25 + _glowController.value * 0.2,
                            ),
                            blurRadius: 28 + _glowController.value * 12,
                            spreadRadius: -4,
                          ),
                        ],
                      ),
                      child: ProfileAvatar(
                        size: isSmall ? 96 : 110,
                        showGlow: false,
                        useGradientBorder: true,
                      ),
                    );
                  },
                )
                .animate()
                .fadeIn(duration: 700.ms, delay: 200.ms)
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1, 1),
                  duration: 700.ms,
                  delay: 200.ms,
                ),

            SizedBox(height: isSmall ? 24 : 32),

            // ── 2. Greeting ──
            Text(
                  AppStrings.heroGreeting,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: isSmall ? 12 : 14,
                    fontWeight: FontWeight.w500,
                    color: cyberpunk.neonPrimary,
                    letterSpacing: 2.0,
                  ),
                )
                .animate()
                .fadeIn(duration: 500.ms, delay: 400.ms)
                .slideY(begin: 0.15, end: 0),

            const SizedBox(height: 8),

            // ── 3. Name ──
            Builder(
              builder: (context) {
                final theme = Theme.of(context);
                final isDark = theme.brightness == Brightness.dark;
                return ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      colors: [
                        cyberpunk.neonPrimary,
                        cyberpunk.neonTertiary,
                        cyberpunk.neonSecondary,
                      ],
                    ).createShader(bounds);
                  },
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      AppStrings.heroName.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cinzel(
                        fontSize: isSmall ? 24 : 28,
                        fontWeight: FontWeight.w700,
                        color: isDark ? Colors.white : AppColors.primaryRed,
                        height: 1.15,
                        letterSpacing: 1.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                );
              },
            )
                .animate()
                .fadeIn(duration: 700.ms, delay: 600.ms)
                .slideY(begin: 0.15, end: 0),

            const SizedBox(height: 14),

            // ── 4. Typewriter Role ──
            const _RoleTypewriter().animate().fadeIn(
              duration: 500.ms,
              delay: 900.ms,
            ),

            const SizedBox(height: 16),

            // ── 5. Description ──
            Text(
                  AppStrings.heroDescription,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: isSmall ? 12 : 13,
                    fontWeight: FontWeight.w400,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
                    height: 1.65,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                )
                .animate()
                .fadeIn(duration: 500.ms, delay: 1100.ms)
                .slideY(begin: 0.1, end: 0),

            SizedBox(height: isSmall ? 28 : 36),

            // ── 6. CTA Buttons ──
            Row(
                  children: [
                    // Primary — "View Work"
                    Expanded(
                      child: GradientBorder(
                        gradient: LinearGradient(
                          colors: [
                            cyberpunk.neonPrimary,
                            cyberpunk.neonSecondary,
                          ],
                        ),
                        strokeWidth: 1.5,
                        borderRadius: 12,
                        child: Material(
                          color: cyberpunk.neonPrimary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                            onTap: () {
                              _scrollToSection(HomeSectionKeys.projectsKey);
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: isSmall ? 13 : 15,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    LucideIcons.rocket,
                                    size: 16,
                                    color: cyberpunk.neonPrimary,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'View Works',
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: cyberpunk.neonPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Secondary — "Contact"
                    Expanded(
                      child: GradientBorder(
                        gradient: LinearGradient(
                          colors: [
                            cyberpunk.neonPrimary.withValues(alpha: 0.5),
                            cyberpunk.neonPrimary.withValues(alpha: 0.3),
                          ],
                        ),
                        strokeWidth: 1.5,
                        borderRadius: 12,
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                            onTap: () {
                              _scrollToSection(HomeSectionKeys.contactKey);
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: isSmall ? 13 : 15,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    LucideIcons.mail,
                                    size: 16,
                                    color: cyberpunk.neonPrimary,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Contact',
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: cyberpunk.neonPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                .animate()
                .fadeIn(duration: 500.ms, delay: 1300.ms)
                .slideY(begin: 0.15, end: 0),

            const Spacer(flex: 3),

            SizedBox(height: isSmall ? 16 : 24),
          ],
        ),
      ),
    );
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// ⌨️ ROLE TYPEWRITER EFFECT
/// ═══════════════════════════════════════════════════════════════════════════

class _RoleTypewriter extends StatefulWidget {
  const _RoleTypewriter();

  @override
  State<_RoleTypewriter> createState() => _RoleTypewriterState();
}

class _RoleTypewriterState extends State<_RoleTypewriter> {
  int _currentRoleIndex = 0;
  String _displayText = '';
  bool _isDeleting = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTypewriter();
  }

  void _startTypewriter() {
    _timer = Timer.periodic(Duration(milliseconds: _isDeleting ? 50 : 100), (
      timer,
    ) {
      setState(() {
        final currentRole = AppStrings.heroRoles[_currentRoleIndex];

        if (!_isDeleting) {
          // Typing
          if (_displayText.length < currentRole.length) {
            _displayText = currentRole.substring(0, _displayText.length + 1);
          } else {
            // Wait before deleting
            _timer?.cancel();
            Future.delayed(const Duration(seconds: 2), () {
              if (mounted) {
                _isDeleting = true;
                _startTypewriter();
              }
            });
          }
        } else {
          // Deleting
          if (_displayText.isNotEmpty) {
            _displayText = _displayText.substring(0, _displayText.length - 1);
          } else {
            _isDeleting = false;
            _currentRoleIndex =
                (_currentRoleIndex + 1) % AppStrings.heroRoles.length;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;
    final cyberpunk = context.cyberpunk;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ShimmerText(
            text: _displayText,
            style: GoogleFonts.cinzel(
              fontSize: isSmallScreen ? 16 : 18,
              fontWeight: FontWeight.w600,
              color: cyberpunk.neonPrimary,
            ),
          ),
        ),
        // Blinking cursor
        Container(
              width: 2,
              height: isSmallScreen ? 18 : 20,
              margin: const EdgeInsets.only(left: 2),
              color: cyberpunk.neonPrimary,
            )
            .animate(onPlay: (c) => c.repeat())
            .fadeIn(duration: 500.ms)
            .then()
            .fadeOut(duration: 500.ms),
      ],
    );
  }
}
