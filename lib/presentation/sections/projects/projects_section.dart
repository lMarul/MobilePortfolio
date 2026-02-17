import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/utils/image_utils.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_durations.dart';
import '../../../core/providers/navigation_providers.dart';
import '../../../core/router/app_router.dart';
import '../../../data/models/project.dart';
import '../../../data/providers/portfolio_providers.dart';
import '../../widgets/common/glass_card.dart';
import '../../widgets/common/gradient_border.dart';
import '../../widgets/common/shimmer_text.dart';

class ProjectsSection extends ConsumerWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsAsync = ref.watch(projectsProvider);
    return projectsAsync.when(
      data: (projects) => _ProjectsContent(projects: projects),
      loading: () => const _ProjectsSkeleton(),
      error: (_, __) => _ProjectsContent(projects: Project.fallback),
    );
  }
}

class _ProjectsContent extends ConsumerWidget {
  final List<Project> projects;
  const _ProjectsContent({required this.projects});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isSmall = MediaQuery.of(context).size.width < 360;

    final titleStyle = theme.textTheme.displaySmall?.copyWith(
      color: isDark ? null : AppColors.primaryRed,
      fontWeight: FontWeight.bold, fontSize: isSmall ? 22 : 26,
    ) ?? const TextStyle();

    final displayProjects = projects.take(2).toList();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 20, vertical: isSmall ? 28 : 36),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              (ShimmerText(text: 'Projects', style: titleStyle) as Widget)
                  .animate().fadeIn(duration: AppDurations.medium),
              const SizedBox(height: 6),
              Text('Featured work',
                style: theme.textTheme.bodySmall?.copyWith(color: AppColors.primaryRed, fontSize: isSmall ? 11 : 12),
              ).animate().fadeIn(delay: 200.ms, duration: AppDurations.medium),
            ])),
            _ViewAllButton(
              onTap: () {
                // Get scroll position from the nearest Scrollable
                final scrollController = Scrollable.maybeOf(context)?.position;
                if (scrollController != null) {
                  // Save navigation context with current scroll position
                  ref.read(navigationProvider.notifier).setFromHomeSection(
                    sectionKey: 'projects',
                    scrollPosition: scrollController.pixels,
                  );
                }
                context.push(AppRouter.projects);
              },
              isDark: isDark,
            ),
          ],
        ),
        SizedBox(height: isSmall ? 16 : 24),
        ...displayProjects.asMap().entries.map((entry) => Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: _ProjectCard(project: entry.value, index: entry.key, isDark: isDark),
        )),
      ]),
    );
  }
}

class _ViewAllButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isDark;
  const _ViewAllButton({required this.onTap, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 360;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: isSmall ? 10 : 12, vertical: isSmall ? 6 : 8),
        decoration: BoxDecoration(
          color: isDark ? AppColors.glassBackgroundDark : AppColors.glassBackgroundLight,
          borderRadius: BorderRadius.circular(isSmall ? 14 : 16),
          border: Border.all(color: isDark ? AppColors.glassBorderDark : Colors.grey.shade200),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Text('View All', style: TextStyle(fontSize: isSmall ? 11 : 12, fontWeight: FontWeight.w500, color: AppColors.primaryRed)),
          const SizedBox(width: 4),
          Icon(LucideIcons.arrowRight, size: isSmall ? 11 : 12, color: AppColors.primaryRed),
        ]),
      ),
    ).animate().fadeIn(delay: 300.ms, duration: AppDurations.medium);
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;
  final int index;
  final bool isDark;
  const _ProjectCard({required this.project, required this.index, required this.isDark});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isPressed = false;

  void _showProjectDetails(BuildContext context, Project project) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _ProjectDetailsSheet(project: project),
    );
  }

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
      onTap: () => _showProjectDetails(context, project),
      child: AnimatedContainer(
        duration: AppDurations.fast,
        transform: Matrix4.identity()..scale(_isPressed ? 0.98 : 1.0, _isPressed ? 0.98 : 1.0),
        child: GradientBorder(
          borderRadius: isSmall ? 16 : 18,
          gradient: _isPressed
              ? AppColors.primaryGradient
              : LinearGradient(colors: [
                  isDark ? AppColors.glassBorderDark : Colors.grey.shade200,
                  isDark ? AppColors.glassBorderDark : Colors.grey.shade200,
                ]),
          strokeWidth: 1,
          child: GlassCard(
            borderRadius: isSmall ? 16 : 18,
            blur: 15,
            opacity: _isPressed ? 0.12 : 0.06,
            child: IntrinsicHeight(
              child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                // Thumbnail
                ClipRRect(
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(isSmall ? 16 : 18)),
                  child: SizedBox(
                    width: isSmall ? 105 : 116,
                    child: Stack(fit: StackFit.expand, children: [
                    ImageUtils.buildImage(
                      imageUrl: project.thumbnail, fit: BoxFit.cover,
                      placeholder: Container(
                        decoration: BoxDecoration(gradient: LinearGradient(colors: [
                          AppColors.primaryRed.withValues(alpha: 0.2), AppColors.darkRed.withValues(alpha: 0.2)])),
                        child: Center(child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primaryRed.withValues(alpha: 0.5)))),
                      errorWidget: Container(
                        decoration: BoxDecoration(gradient: LinearGradient(colors: [
                          AppColors.primaryRed.withValues(alpha: 0.2), AppColors.darkRed.withValues(alpha: 0.2)])),
                        child: Center(child: Icon(LucideIcons.code, size: isSmall ? 26 : 30, color: textColor.withValues(alpha: 0.3)))),
                    ),
                  ]),
                ),
              ),
              // Content
              Expanded(child: Padding(
                padding: EdgeInsets.all(isSmall ? 10 : 14),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(project.title,
                    style: theme.textTheme.titleMedium?.copyWith(color: textColor, fontWeight: FontWeight.bold, fontSize: isSmall ? 13 : 15),
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 6),
                  Text(project.description,
                    style: theme.textTheme.bodySmall?.copyWith(color: textColor.withValues(alpha: 0.7), height: 1.4, fontSize: isSmall ? 11 : 12),
                    maxLines: 3, overflow: TextOverflow.ellipsis),
                  SizedBox(height: isSmall ? 8 : 10),
                  Wrap(spacing: 4, runSpacing: 4, children: project.tags.take(2).map((tech) =>
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8)),
                      child: Text(tech, style: const TextStyle(color: AppColors.primaryRed, fontSize: 9)),
                    )).toList()),
                ]),
              )),
            ]),
            ),
          ),
        ),
      ),
    ).animate()
        .fadeIn(delay: Duration(milliseconds: widget.index * 40), duration: AppDurations.medium)
        .slideY(begin: 0.1, end: 0);
  }
}

class _ProjectDetailsSheet extends StatelessWidget {
  final Project project;
  const _ProjectDetailsSheet({required this.project});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = theme.colorScheme.onSurface;

    return DraggableScrollableSheet(
      initialChildSize: 0.7, minChildSize: 0.5, maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.surface : AppColors.lightSurface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            border: Border.all(color: isDark ? AppColors.glassBorderDark : Colors.grey.shade200),
          ),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 12), width: 40, height: 4,
              decoration: BoxDecoration(color: textColor.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(2)),
            ),
            Expanded(child: SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(24),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                GradientText(
                  text: project.title, gradient: AppColors.primaryGradient,
                  style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold) ?? const TextStyle(),
                ),
                const SizedBox(height: 16),

                const SizedBox(height: 24),
                Text(project.description,
                  style: theme.textTheme.bodyLarge?.copyWith(color: textColor.withValues(alpha: 0.8), height: 1.8)),
                const SizedBox(height: 28),
                Text('Technologies Used',
                  style: theme.textTheme.titleMedium?.copyWith(color: AppColors.primaryRed, fontWeight: FontWeight.bold)),
                const SizedBox(height: 14),
                Wrap(spacing: 8, runSpacing: 8, children: project.tags.map((tech) =>
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.glassBackgroundDark : AppColors.glassBackgroundLight,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.primaryRed.withValues(alpha: 0.3)),
                    ),
                    child: Text(tech, style: TextStyle(color: textColor)),
                  )).toList()),
              ]),
            )),
          ]),
        );
      },
    );
  }
}

class _ProjectsSkeleton extends StatelessWidget {
  const _ProjectsSkeleton();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(width: 150, height: 28, decoration: BoxDecoration(color: AppColors.glass, borderRadius: BorderRadius.circular(8))),
        const SizedBox(height: 20),
        ...List.generate(2, (i) => Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: Container(height: 110, decoration: BoxDecoration(color: AppColors.glass, borderRadius: BorderRadius.circular(18))),
        )),
      ]),
    ).animate(onPlay: (c) => c.repeat()).shimmer(duration: 1500.ms, color: AppColors.primaryRed.withValues(alpha: 0.1));
  }
}