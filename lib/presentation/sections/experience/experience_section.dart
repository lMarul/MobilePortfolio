import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_durations.dart';
import '../../../core/providers/navigation_providers.dart';
import '../../../core/router/app_router.dart';
import '../../../core/utils/organization_logo_utils.dart';
import '../../../data/models/experience.dart';
import '../../../data/providers/portfolio_providers.dart';
import '../../widgets/common/glass_card.dart';
import '../../widgets/common/gradient_border.dart';
import '../../widgets/common/shimmer_text.dart';

class ExperienceSection extends ConsumerWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experiencesAsync = ref.watch(experiencesProvider);
    return experiencesAsync.when(
      data: (experiences) => _ExperienceContent(experiences: experiences),
      loading: () => const _ExperienceSkeleton(),
      error: (_, __) => _ExperienceContent(experiences: Experience.fallback),
    );
  }
}

class _ExperienceContent extends ConsumerWidget {
  final List<Experience> experiences;
  const _ExperienceContent({required this.experiences});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isSmall = MediaQuery.of(context).size.width < 360;

    final titleStyle = theme.textTheme.displaySmall?.copyWith(
      color: isDark ? null : AppColors.primaryRed,
      fontWeight: FontWeight.bold, fontSize: isSmall ? 22 : 26,
    ) ?? const TextStyle();

    final displayExperiences = experiences.take(2).toList();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 20, vertical: isSmall ? 28 : 36),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              (ShimmerText(text: 'Experience', style: titleStyle) as Widget)
                  .animate().fadeIn(duration: AppDurations.medium),
              const SizedBox(height: 6),
              Text('My professional journey',
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
                    sectionKey: 'experience',
                    scrollPosition: scrollController.pixels,
                  );
                }
                context.push(AppRouter.experiences);
              },
              isDark: isDark,
            ),
          ],
        ),
        SizedBox(height: isSmall ? 16 : 24),
        ...displayExperiences.asMap().entries.map((entry) => Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: _ExperienceCard(experience: entry.value, index: entry.key, isDark: isDark),
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

class _ExperienceCard extends StatefulWidget {
  final Experience experience;
  final int index;
  final bool isDark;
  const _ExperienceCard({required this.experience, required this.index, required this.isDark});

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _isPressed = false;

  IconData _getTypeIcon(String type) {
    switch (type) {
      case 'employment':
        return LucideIcons.briefcase;
      case 'internship':
        return LucideIcons.graduationCap;
      case 'ojt':
        return LucideIcons.bookOpen;
      case 'student-org':
        return LucideIcons.users;
      case 'freelance':
        return LucideIcons.laptop;
      case 'volunteer':
        return LucideIcons.heart;
      default:
        return LucideIcons.briefcase;
    }
  }

  Widget _buildLogoOrIcon(Experience exp, bool isSmall) {
    final logoPath = OrganizationLogoUtils.getOrganizationLogo(exp.organization);
    
    if (logoPath != null) {
      // Show organization logo - fill the container
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          logoPath,
          width: isSmall ? 40 : 48,
          height: isSmall ? 40 : 48,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            // Fallback to icon if logo fails to load
            return Icon(
              _getTypeIcon(exp.type),
              size: isSmall ? 24 : 28,
              color: AppColors.primaryRed,
            );
          },
        ),
      );
    } else {
      // Show type icon as fallback
      return Icon(
        _getTypeIcon(exp.type),
        size: isSmall ? 24 : 28,
        color: AppColors.primaryRed,
      );
    }
  }

  void _showExperienceDetails(BuildContext context, Experience experience) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _ExperienceDetailsSheet(experience: experience),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final exp = widget.experience;
    final isDark = widget.isDark;
    final isSmall = MediaQuery.of(context).size.width < 360;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => Future.delayed(const Duration(milliseconds: 150), () {
        if (mounted) setState(() => _isPressed = false);
      }),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () => _showExperienceDetails(context, exp),
      child: AnimatedContainer(
        duration: AppDurations.fast,
        transform: Matrix4.identity()..scale(_isPressed ? 0.98 : 1.0, _isPressed ? 0.98 : 1.0),
        child: GradientBorder(
          borderRadius: isSmall ? 16 : 18,
          gradient: _isPressed || exp.isCurrent
              ? AppColors.primaryGradient
              : LinearGradient(colors: [
                  isDark ? AppColors.glassBorderDark : Colors.grey.shade200,
                  isDark ? AppColors.glassBorderDark : Colors.grey.shade200,
                ]),
          strokeWidth: exp.isCurrent ? 2 : 1,
          child: GlassCard(
            borderRadius: isSmall ? 16 : 18,
            blur: 15,
            opacity: _isPressed || exp.isCurrent ? 0.12 : 0.06,
            child: IntrinsicHeight(
              child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                // Logo/Icon Section
                Container(
                  width: isSmall ? 105 : 116,
                  padding: EdgeInsets.all(isSmall ? 16 : 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primaryRed.withValues(alpha: 0.15),
                        AppColors.darkRed.withValues(alpha: 0.08),
                      ],
                    ),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(isSmall ? 16 : 18)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: isSmall ? 48 : 56,
                        height: isSmall ? 48 : 56,
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.surfaceLight : AppColors.lightElevated,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.primaryRed.withValues(alpha: 0.4), width: 2),
                           boxShadow: exp.isCurrent ? [
                            BoxShadow(
                              color: AppColors.primaryRed.withValues(alpha: 0.3),
                              blurRadius: 12,
                              spreadRadius: 0,
                            ),
                          ] : null,
                        ),
                        child: _buildLogoOrIcon(exp, isSmall),
                      ),
                      if (exp.isCurrent) ...[
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Current',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isSmall ? 9 : 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                // Content
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(isSmall ? 10 : 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          exp.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: isDark ? textColor : AppColors.primaryRed,
                            fontWeight: FontWeight.bold,
                            fontSize: isSmall ? 13 : 15,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          exp.organization,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.primaryRed,
                            fontWeight: FontWeight.w600,
                            fontSize: isSmall ? 11 : 12,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 11,
                              color: textColor.withValues(alpha: 0.5),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                '${exp.startDate} - ${exp.endDate ?? "Present"}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: textColor.withValues(alpha: 0.5),
                                  fontSize: isSmall ? 10 : 11,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isSmall ? 8 : 10),
                        Wrap(
                          spacing: 4,
                          runSpacing: 4,
                          children: exp.technologies.take(2).map((tech) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.primaryRed.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              tech,
                              style: const TextStyle(color: AppColors.primaryRed, fontSize: 9),
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
      ),
    ).animate()
        .fadeIn(delay: Duration(milliseconds: widget.index * 40), duration: AppDurations.medium)
        .slideY(begin: 0.1, end: 0);
  }
}

class _ExperienceDetailsSheet extends StatelessWidget {
  final Experience experience;
  const _ExperienceDetailsSheet({required this.experience});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = theme.colorScheme.onSurface;

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.surface : AppColors.lightSurface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            border: Border.all(color: isDark ? AppColors.glassBorderDark : Colors.grey.shade200),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: textColor.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  experience.title,
                                  style: theme.textTheme.headlineSmall?.copyWith(
                                    color: isDark ? textColor : AppColors.primaryRed,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  experience.organization,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: AppColors.primaryRed,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (experience.isCurrent)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                gradient: AppColors.primaryGradient,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Current',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(Icons.calendar_today_outlined, size: 16, color: textColor.withValues(alpha: 0.5)),
                          const SizedBox(width: 8),
                          Text(
                            '${experience.startDate} - ${experience.endDate ?? "Present"}',
                            style: theme.textTheme.bodyMedium?.copyWith(color: textColor.withValues(alpha: 0.7)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: 16, color: textColor.withValues(alpha: 0.5)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              experience.location,
                              style: theme.textTheme.bodyMedium?.copyWith(color: textColor.withValues(alpha: 0.7)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'About',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: AppColors.primaryRed,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        experience.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: textColor.withValues(alpha: 0.8),
                          height: 1.6,
                        ),
                      ),
                      if (experience.responsibilities.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        Text(
                          'Responsibilities',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: AppColors.primaryRed,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...experience.responsibilities.map((resp) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('• ', style: TextStyle(color: AppColors.primaryRed, fontSize: 16)),
                              Expanded(
                                child: Text(
                                  resp,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: textColor.withValues(alpha: 0.8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                      if (experience.achievements.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        Text(
                          'Key Achievements',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: AppColors.primaryRed,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...experience.achievements.map((achievement) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('✓ ', style: TextStyle(color: AppColors.primaryRed, fontSize: 16)),
                              Expanded(
                                child: Text(
                                  achievement,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: textColor.withValues(alpha: 0.8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                      if (experience.technologies.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        Text(
                          'Skills & Technologies',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: AppColors.primaryRed,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: experience.technologies.map((tech) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: AppColors.primaryRed.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.primaryRed.withValues(alpha: 0.3)),
                            ),
                            child: Text(
                              tech,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.primaryRed,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )).toList(),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ExperienceSkeleton extends StatelessWidget {
  const _ExperienceSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
      child: Column(
        children: [
          Container(
            width: 200,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.glass,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 24),
          ...List.generate(
            2,
            (i) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  color: AppColors.glass,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
        ],
      ),
    ).animate(onPlay: (c) => c.repeat()).shimmer(
      duration: 1500.ms,
      color: AppColors.primaryRed.withValues(alpha: 0.1),
    );
  }
}
