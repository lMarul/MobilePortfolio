import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/providers/navigation_providers.dart';
import '../../../core/theme/theme_extensions.dart';
import '../../../core/utils/extensions.dart';
import '../../sections/about/about_section.dart';
import '../../sections/certifications/certifications_section.dart';
import '../../sections/contact/contact_section.dart';
import '../../sections/experience/experience_section.dart';
import '../../sections/hackathons/hackathons_section.dart';
import '../../sections/hero/ultimate_hero_section.dart';
import '../../sections/projects/projects_section.dart';
import '../../sections/skills/skills_section.dart';
import '../../widgets/effects/floating_orbs.dart';
import '../../widgets/layout/ultimate_background.dart';
import '../../widgets/navigation/glass_drawer.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🏠 HOME SCREEN
/// ═══════════════════════════════════════════════════════════════════════════
/// Main scrollable portfolio page with SliverAppBar + Drawer navigation.
///
/// Architecture change:
///  • BEFORE: Floating buttons (profile + theme toggle) overlaid via Stack,
///    colliding with section headers during scroll.
///  • AFTER:  Proper SliverAppBar with hamburger menu leading to a
///    GlassDrawer. Theme toggle moved into the drawer's settings section.
///    This clears the viewport for content and follows native mobile
///    navigation patterns.

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    
    // Restore scroll position if returning from a detail screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _restoreScrollPosition();
    });
  }

  void _restoreScrollPosition() {
    final navState = ref.read(navigationProvider);
    if (navState.source == NavigationSource.homeSection && 
        navState.scrollPosition > 0) {
      // Scroll to the saved position
      _scrollController.animateTo(
        navState.scrollPosition,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      // Reset navigation state after restoration
      ref.read(navigationProvider.notifier).reset();
    }
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      final currentScroll = _scrollController.offset;
      final show = currentScroll > 500;
      if (show != _showBackToTop) {
        setState(() => _showBackToTop = show);
      }
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cyberpunk = context.cyberpunk;

    return Scaffold(
      extendBodyBehindAppBar: true,
      // ── Glass Drawer ──
      drawer: const GlassDrawer(),
      body: Stack(
        children: [
          // Animated Background
          const UltimateBackground(),

          // Floating Orbs
          const FloatingOrbs(),

          // Main Content — SliverAppBar + sections
          CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              // ── Sliver App Bar ──
              SliverAppBar(
                floating: true,
                snap: true,
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.surface.withValues(alpha: 0.95)
                    : AppColors.lightSurface.withValues(alpha: 0.95),
                elevation: 0,
                scrolledUnderElevation: 0,
                leading: Builder(
                  builder: (ctx) => IconButton(
                    icon: Icon(
                      Icons.menu_rounded,
                      color: Theme.of(ctx).colorScheme.onSurface,
                    ),
                    tooltip: 'Menu',
                    onPressed: () => Scaffold.of(ctx).openDrawer(),
                  ),
                ),
                title: LayoutBuilder(
                  builder: (context, constraints) {
                    final width = MediaQuery.of(context).size.width;
                    // Responsive font size: smaller screens get smaller text
                    final fontSize = width < 360 ? 14.0 : width < 400 ? 16.0 : width < 450 ? 18.0 : 20.0;
                    
                    return FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Marwin John Gonzales',
                        style: GoogleFonts.cinzel(
                          fontSize: fontSize,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                      ),
                    );
                  },
                ),
                centerTitle: false,
              ),

              // Hero Section
              SliverToBoxAdapter(
                key: HomeSectionKeys.heroKey,
                child: const UltimateHeroSection(),
              ),

              // About Section
              SliverToBoxAdapter(
                key: HomeSectionKeys.aboutKey,
                child: const AboutSection(),
              ),

              // Projects Section
              SliverToBoxAdapter(
                key: HomeSectionKeys.projectsKey,
                child: const ProjectsSection(),
              ),

              // Hackathons Section
              SliverToBoxAdapter(
                key: HomeSectionKeys.hackathonsKey,
                child: const HackathonsSection(),
              ),

              // Certifications Section
              SliverToBoxAdapter(
                key: HomeSectionKeys.certificationsKey,
                child: const CertificationsSection(),
              ),

              // Skills Section
              SliverToBoxAdapter(
                key: HomeSectionKeys.skillsKey,
                child: const SkillsSection(),
              ),

              // Experience Section
              SliverToBoxAdapter(
                key: HomeSectionKeys.experienceKey,
                child: const ExperienceSection(),
              ),

              // Contact Section
              SliverToBoxAdapter(
                key: HomeSectionKeys.contactKey,
                child: const ContactSection(),
              ),

              // Bottom Padding
              SliverToBoxAdapter(
                child: SizedBox(height: context.safeArea.bottom + 32),
              ),
            ],
          ),

          // Back to Top Button
          if (_showBackToTop)
            Positioned(
              right: 20,
              bottom: context.safeArea.bottom + 20,
              child:
                  GestureDetector(
                        onTap: _scrollToTop,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: cyberpunk.neonPrimary.withValues(
                                  alpha: 0.4,
                                ),
                                blurRadius: 16,
                                spreadRadius: -4,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.keyboard_arrow_up,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 300.ms)
                      .scale(
                        begin: const Offset(0.5, 0.5),
                        end: const Offset(1, 1),
                      ),
            ),
        ],
      ),
    );
  }
}
