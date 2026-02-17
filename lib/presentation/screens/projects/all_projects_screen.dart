import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/image_utils.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_durations.dart';
import '../../../core/providers/navigation_providers.dart';
import '../../../core/router/app_router.dart';
import '../../../data/models/project.dart';
import '../../../data/providers/portfolio_providers.dart';
import '../../widgets/common/glass_card.dart';
import '../../widgets/common/gradient_border.dart';
import '../../widgets/effects/floating_orbs.dart';
import '../../widgets/layout/ultimate_background.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🚀 ALL PROJECTS SCREEN
/// ═══════════════════════════════════════════════════════════════════════════
/// Full archive of all projects with filtering and search.

class AllProjectsScreen extends ConsumerStatefulWidget {
  const AllProjectsScreen({super.key});

  @override
  ConsumerState<AllProjectsScreen> createState() => _AllProjectsScreenState();
}

class _AllProjectsScreenState extends ConsumerState<AllProjectsScreen> {

  @override
  Widget build(BuildContext context) {
    final projectsAsync = ref.watch(projectsProvider);
    final navState = ref.read(navigationProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background
          const UltimateBackground(),
          const FloatingOrbs(),

          // Content
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // App Bar
              SliverAppBar(
                floating: true,
                backgroundColor: isDark
                    ? AppColors.surface.withValues(alpha: 0.95)
                    : AppColors.lightSurface.withValues(alpha: 0.95),
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    LucideIcons.arrowLeft,
                    color: textColor,
                  ),
                  onPressed: () {
                    // Smart navigation: go back to home with scroll restoration
                    if (navState.source == NavigationSource.homeSection) {
                      // Will trigger scroll restoration in home screen
                      context.go(AppRouter.home);
                    } else {
                      // From sidebar, just pop back
                      ref.read(navigationProvider.notifier).reset();
                      context.pop();
                    }
                  },
                ),
                title: Text(
                  'Projects',
                  style: TextStyle(
                    color: isDark ? textColor : AppColors.primaryRed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
              ),

              // Projects Grid
              projectsAsync.when(
                data: (projects) {
                  if (projects.isEmpty) {
                    return const SliverFillRemaining(
                      child: _EmptyState(),
                    );
                  }
                  return SliverPadding(
                    padding: const EdgeInsets.all(24),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _ProjectCard(
                            project: projects[index],
                            index: index,
                            isDark: isDark,
                          ),
                        ),
                        childCount: projects.length,
                      ),
                    ),
                  );
                },
                loading: () => const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryRed,
                    ),
                  ),
                ),
                error: (_, __) => SliverPadding(
                  padding: const EdgeInsets.all(24),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _ProjectCard(
                          project: Project.fallback[index],
                          index: index,
                          isDark: isDark,
                        ),
                      ),
                      childCount: Project.fallback.length,
                    ),
                  ),
                ),
              ),

              // Bottom Padding
              SliverToBoxAdapter(
                child: SizedBox(height: MediaQuery.of(context).padding.bottom + 24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 🃏 PROJECT CARD
// ═══════════════════════════════════════════════════════════════════════════

class _ProjectCard extends StatefulWidget {
  final Project project;
  final int index;
  final bool isDark;

  const _ProjectCard({
    required this.project,
    required this.index,
    required this.isDark,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final project = widget.project;
    final isDark = widget.isDark;
    final isSmall = MediaQuery.of(context).size.width < 360;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => Future.delayed(const Duration(milliseconds: 150), () {
        if (mounted) setState(() => _isPressed = false);
      }),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: AppDurations.fast,
        transform: Matrix4.identity()..scale(_isPressed ? 0.98 : 1.0, _isPressed ? 0.98 : 1.0),
        child: GradientBorder(
          borderRadius: isSmall ? 16 : 18,
          gradient: _isPressed
              ? AppColors.primaryGradient
              : LinearGradient(colors: [
                  isDark ? AppColors.glassBorderDark : AppColors.primaryRed.withValues(alpha: 0.3),
                  isDark ? AppColors.glassBorderDark : AppColors.primaryRed.withValues(alpha: 0.3),
                ]),
          strokeWidth: 1,
          child: GlassCard(
            borderRadius: isSmall ? 16 : 18,
            blur: 15,
            opacity: _isPressed ? 0.12 : 0.06,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Thumbnail
              ClipRRect(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(isSmall ? 16 : 18)),
                child: SizedBox(
                  height: isSmall ? 140 : 155,
                  width: isSmall ? 105 : 116,
                  child: Stack(fit: StackFit.expand, children: [
                    ImageUtils.buildImage(
                      imageUrl: project.thumbnail,
                      fit: BoxFit.cover,
                      placeholder: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            AppColors.primaryRed.withValues(alpha: 0.2),
                            AppColors.darkRed.withValues(alpha: 0.2),
                          ]),
                        ),
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primaryRed.withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                      errorWidget: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            AppColors.primaryRed.withValues(alpha: 0.2),
                            AppColors.darkRed.withValues(alpha: 0.2),
                          ]),
                        ),
                        child: Center(
                          child: Icon(
                            LucideIcons.code,
                            size: isSmall ? 26 : 30,
                            color: textColor.withValues(alpha: 0.3),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              // Content
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(isSmall ? 10 : 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: isSmall ? 13 : 15,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        project.description,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: textColor.withValues(alpha: 0.7),
                          height: 1.4,
                          fontSize: isSmall ? 11 : 12,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: isSmall ? 8 : 10),
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: project.tags.take(2).map((tag) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppColors.primaryRed.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              color: AppColors.primaryRed,
                              fontSize: 9,
                            ),
                          ),
                        )).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: widget.index * 40), duration: AppDurations.medium)
        .slideY(begin: 0.1, end: 0);
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 🫥 EMPTY STATE
// ═══════════════════════════════════════════════════════════════════════════

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            LucideIcons.folderSearch,
            size: 64,
            color: AppColors.darkTextMuted,
          ),
          const SizedBox(height: 16),
          Text(
            'No projects found',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.darkTextSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your search or filter',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppColors.darkTextMuted,
            ),
          ),
        ],
      ),
    ).animate().fadeIn();
  }
}
