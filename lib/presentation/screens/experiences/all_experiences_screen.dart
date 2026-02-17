import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_durations.dart';
import '../../../core/providers/navigation_providers.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/theme_extensions.dart';
import '../../../core/utils/organization_logo_utils.dart';
import '../../../data/models/experience.dart';
import '../../../data/providers/portfolio_providers.dart';
import '../../widgets/common/glass_card.dart';
import '../../widgets/common/gradient_border.dart';
import '../../widgets/effects/floating_orbs.dart';
import '../../widgets/layout/ultimate_background.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 💼 ALL EXPERIENCES SCREEN
/// ═══════════════════════════════════════════════════════════════════════════
/// Full archive of all work experiences with timeline view.
/// Now grouped by organization like LinkedIn.

/// Groups experiences by organization name, maintaining order by most recent
Map<String, List<Experience>> _groupByOrganization(List<Experience> experiences) {
  final grouped = <String, List<Experience>>{};
  for (final exp in experiences) {
    if (!grouped.containsKey(exp.organization)) {
      grouped[exp.organization] = [];
    }
    grouped[exp.organization]!.add(exp);
  }
  return grouped;
}

class AllExperiencesScreen extends ConsumerStatefulWidget {
  const AllExperiencesScreen({super.key});

  @override
  ConsumerState<AllExperiencesScreen> createState() => _AllExperiencesScreenState();
}

class _AllExperiencesScreenState extends ConsumerState<AllExperiencesScreen> {

  @override
  Widget build(BuildContext context) {
    final experiencesAsync = ref.watch(experiencesProvider);
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
                  'Experience',
                  style: TextStyle(
                    color: isDark ? textColor : AppColors.primaryRed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
              ),

              // Experiences List
              experiencesAsync.when(
                data: (experiences) {
                  if (experiences.isEmpty) {
                    return const SliverFillRemaining(
                      child: _EmptyState(),
                    );
                  }
                  // Group experiences by organization
                  final groupedExperiences = _groupByOrganization(experiences);
                  final orgNames = groupedExperiences.keys.toList();
                  
                  return SliverPadding(
                    padding: const EdgeInsets.all(24),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final orgName = orgNames[index];
                          final orgExperiences = groupedExperiences[orgName]!;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: _OrganizationCard(
                              organizationName: orgName,
                              experiences: orgExperiences,
                              index: index,
                              isLast: index == orgNames.length - 1,
                              isDark: isDark,
                            ),
                          );
                        },
                        childCount: orgNames.length,
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
                error: (_, __) {
                  final groupedExperiences = _groupByOrganization(Experience.fallback);
                  final orgNames = groupedExperiences.keys.toList();
                  return SliverPadding(
                    padding: const EdgeInsets.all(24),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final orgName = orgNames[index];
                          final orgExperiences = groupedExperiences[orgName]!;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: _OrganizationCard(
                              organizationName: orgName,
                              experiences: orgExperiences,
                              index: index,
                              isLast: index == orgNames.length - 1,
                              isDark: isDark,
                            ),
                          );
                        },
                        childCount: orgNames.length,
                      ),
                    ),
                  );
                },
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
// � ORGANIZATION CARD (LinkedIn-style grouped)
// ═══════════════════════════════════════════════════════════════════════════

class _OrganizationCard extends StatefulWidget {
  final String organizationName;
  final List<Experience> experiences;
  final int index;
  final bool isLast;
  final bool isDark;

  const _OrganizationCard({
    required this.organizationName,
    required this.experiences,
    required this.index,
    required this.isLast,
    required this.isDark,
  });

  @override
  State<_OrganizationCard> createState() => _OrganizationCardState();
}

class _OrganizationCardState extends State<_OrganizationCard> {
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
        return LucideIcons.building2;
    }
  }

  Widget _buildLogoOrIcon(String organization, String type, {double size = 40}) {
    final logoPath = OrganizationLogoUtils.getOrganizationLogo(organization);
    
    if (logoPath != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          logoPath,
          width: size,
          height: size,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              _getTypeIcon(type),
              color: AppColors.primaryRed,
              size: size * 0.7,
            );
          },
        ),
      );
    } else {
      return Icon(
        _getTypeIcon(type),
        color: AppColors.primaryRed,
        size: size * 0.7,
      );
    }
  }

  String _formatType(String type) {
    switch (type) {
      case 'employment':
        return 'Employment';
      case 'internship':
        return 'Internship';
      case 'ojt':
        return 'OJT';
      case 'student-org':
        return 'Student Org';
      case 'freelance':
        return 'Freelance';
      case 'volunteer':
        return 'Volunteer';
      default:
        return type;
    }
  }

  String _calculateTotalDuration(List<Experience> experiences) {
    // Get the earliest start date and latest end date
    // For simplicity, just show the time span
    final firstExp = experiences.last; // Oldest
    final latestExp = experiences.first; // Most recent
    final endDate = latestExp.endDate ?? 'Present';
    return '${firstExp.startDate} - $endDate';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDark;
    final experiences = widget.experiences;
    final hasCurrent = experiences.any((e) => e.isCurrent);
    final firstExp = experiences.first;

    return Padding(
      padding: EdgeInsets.only(bottom: widget.isLast ? 0 : 20),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline Line & Dot
            SizedBox(
              width: 50,
              child: Column(
                children: [
                  // Dot
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      gradient: hasCurrent ? AppColors.primaryGradient : null,
                      color: hasCurrent ? null : AppColors.glass,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: hasCurrent
                            ? AppColors.primaryRed
                            : AppColors.glassBorder,
                        width: 2,
                      ),
                      boxShadow: hasCurrent
                          ? [
                              BoxShadow(
                                color: AppColors.primaryRed.withOpacity(0.5),
                                blurRadius: 12,
                                spreadRadius: -2,
                              ),
                            ]
                          : null,
                    ),
                  ),
                  // Line
                  if (!widget.isLast)
                    Expanded(
                      child: Container(
                        width: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.primaryRed.withOpacity(0.5),
                              AppColors.glassBorder,
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Card Content
            Expanded(
              child: GradientBorder(
                borderRadius: 20,
                gradient: hasCurrent
                    ? AppColors.primaryGradient
                    : LinearGradient(
                        colors: [
                          isDark ? AppColors.glassBorder : AppColors.primaryRed.withValues(alpha: 0.3),
                          isDark ? AppColors.glassBorder.withOpacity(0.3) : AppColors.primaryRed.withValues(alpha: 0.2),
                        ],
                      ),
                strokeWidth: hasCurrent ? 1.5 : 1,
                child: GlassCard(
                  borderRadius: 20,
                  blur: 15,
                  opacity: 0.08,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Organization Header
                      Row(
                        children: [
                          // Logo
                          Container(
                            width: 52,
                            height: 52,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.primaryRed.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: _buildLogoOrIcon(widget.organizationName, firstExp.type, size: 44),
                          ),
                          const SizedBox(width: 12),
                          // Organization Name & Duration
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.organizationName,
                                  style: GoogleFonts.cinzel(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryRed,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _calculateTotalDuration(experiences),
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: AppColors.darkTextMuted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Roles List
                      ...experiences.asMap().entries.map((entry) {
                        final idx = entry.key;
                        final exp = entry.value;
                        final isLastRole = idx == experiences.length - 1;
                        
                        return _RoleItem(
                          experience: exp,
                          isLast: isLastRole,
                          isDark: isDark,
                          formatType: _formatType,
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: 100 * widget.index),
          duration: AppDurations.medium,
        )
        .slideX(begin: 0.05, end: 0);
  }
}

// Individual role item within an organization
class _RoleItem extends StatefulWidget {
  final Experience experience;
  final bool isLast;
  final bool isDark;
  final String Function(String) formatType;

  const _RoleItem({
    required this.experience,
    required this.isLast,
    required this.isDark,
    required this.formatType,
  });

  @override
  State<_RoleItem> createState() => _RoleItemState();
}

class _RoleItemState extends State<_RoleItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final exp = widget.experience;
    final isDark = widget.isDark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Role header with bullet point
        GestureDetector(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bullet/Timeline dot for role
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: exp.isCurrent ? AppColors.primaryRed : AppColors.glassBorder,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Role content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      exp.title,
                      style: GoogleFonts.cinzel(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Date & badges
                    Row(
                      children: [
                        // Badge
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.glass,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            widget.formatType(exp.type),
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkTextSecondary,
                            ),
                          ),
                        ),
                        if (exp.isCurrent) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              gradient: AppColors.primaryGradient,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Current',
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                        const SizedBox(width: 8),
                        Icon(
                          LucideIcons.mapPin,
                          size: 10,
                          color: AppColors.darkTextMuted,
                        ),
                        const SizedBox(width: 2),
                        Flexible(
                          child: Text(
                            exp.location,
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              color: AppColors.darkTextMuted,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    // Date range
                    Row(
                      children: [
                        Icon(
                          LucideIcons.calendar,
                          size: 10,
                          color: AppColors.darkTextMuted,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${exp.startDate} - ${exp.endDate ?? 'Present'}',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            color: AppColors.darkTextMuted,
                          ),
                        ),
                        const Spacer(),
                        // Expand icon
                        Icon(
                          _isExpanded ? LucideIcons.chevronUp : LucideIcons.chevronDown,
                          size: 16,
                          color: AppColors.darkTextMuted,
                        ),
                      ],
                    ),

                    // Expanded details
                    AnimatedCrossFade(
                      firstChild: const SizedBox.shrink(),
                      secondChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12),
                          // Description
                          Text(
                            exp.description,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppColors.darkTextSecondary,
                              height: 1.5,
                            ),
                          ),
                          // Technologies
                          if (exp.technologies.isNotEmpty) ...[
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: exp.technologies.map((tech) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryRed.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: AppColors.primaryRed.withOpacity(0.3),
                                    ),
                                  ),
                                  child: Text(
                                    tech,
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryRed,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ],
                      ),
                      crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                      duration: AppDurations.medium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Divider between roles
        if (!widget.isLast) ...[
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Divider(
              color: AppColors.glassBorder.withOpacity(0.5),
              height: 1,
            ),
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// �🃏 EXPERIENCE CARD
// ═══════════════════════════════════════════════════════════════════════════

class _ExperienceCard extends StatefulWidget {
  final Experience experience;
  final int index;
  final bool isLast;
  final bool isDark;

  const _ExperienceCard({
    required this.experience,
    required this.index,
    required this.isLast,
    required this.isDark,
  });

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _isExpanded = false;

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
        return LucideIcons.building2;
    }
  }

  Widget _buildLogoOrIcon(String organization, String type, {double size = 32}) {
    final logoPath = OrganizationLogoUtils.getOrganizationLogo(organization);
    
    if (logoPath != null) {
      // Show organization logo - fill the container
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          logoPath,
          width: size,
          height: size,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            // Fallback to icon if logo fails to load
            return Icon(
              _getTypeIcon(type),
              color: AppColors.primaryRed,
              size: size * 0.7,
            );
          },
        ),
      );
    } else {
      // Show type icon as fallback
      return Icon(
        _getTypeIcon(type),
        color: AppColors.primaryRed,
        size: size * 0.7,
      );
    }
  }

  String _formatType(String type) {
    switch (type) {
      case 'employment':
        return 'Employment';
      case 'internship':
        return 'Internship';
      case 'ojt':
        return 'OJT';
      case 'student-org':
        return 'Student Org';
      case 'freelance':
        return 'Freelance';
      case 'volunteer':
        return 'Volunteer';
      default:
        return type;
    }
  }

  @override
  Widget build(BuildContext context) {
    final exp = widget.experience;
    final isDark = widget.isDark;

    return Padding(
      padding: EdgeInsets.only(bottom: widget.isLast ? 0 : 20),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline Line & Dot
            SizedBox(
              width: 50,
              child: Column(
                children: [
                  // Dot
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      gradient: exp.isCurrent ? AppColors.primaryGradient : null,
                      color: exp.isCurrent ? null : AppColors.glass,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: exp.isCurrent
                            ? AppColors.primaryRed
                            : AppColors.glassBorder,
                        width: 2,
                      ),
                      boxShadow: exp.isCurrent
                          ? [
                              BoxShadow(
                                color: AppColors.primaryRed.withOpacity(0.5),
                                blurRadius: 12,
                                spreadRadius: -2,
                              ),
                            ]
                          : null,
                    ),
                  ),
                  // Line
                  if (!widget.isLast)
                    Expanded(
                      child: Container(
                        width: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.primaryRed.withOpacity(0.5),
                              AppColors.glassBorder,
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Card Content
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _isExpanded = !_isExpanded),
                child: GradientBorder(
                  borderRadius: 20,
                  gradient: exp.isCurrent
                      ? AppColors.primaryGradient
                      : LinearGradient(
                          colors: [
                            isDark ? AppColors.glassBorder : AppColors.primaryRed.withValues(alpha: 0.3),
                            isDark ? AppColors.glassBorder.withOpacity(0.3) : AppColors.primaryRed.withValues(alpha: 0.2),
                          ],
                        ),
                  strokeWidth: exp.isCurrent ? 1.5 : 1,
                  child: GlassCard(
                    borderRadius: 20,
                    blur: 15,
                    opacity: 0.08,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        Row(
                          children: [
                            // Icon/Logo
                            Container(
                              width: 48,
                              height: 48,
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppColors.primaryRed.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: _buildLogoOrIcon(exp.organization, exp.type, size: 36),
                            ),
                            const SizedBox(width: 12),
                            // Title & Org
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    exp.title,
                                    style: GoogleFonts.cinzel(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: context.cyberpunk.neonPrimary,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    exp.organization,
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: AppColors.primaryRed,
                                    ),
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            // Expand Icon
                            Icon(
                              _isExpanded
                                  ? LucideIcons.chevronUp
                                  : LucideIcons.chevronDown,
                              color: AppColors.darkTextMuted,
                              size: 20,
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // Meta Info
                        Row(
                          children: [
                            // Type Badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.glass,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                _formatType(exp.type),
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkTextSecondary,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Current Badge
                            if (exp.isCurrent)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  gradient: AppColors.primaryGradient,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Current',
                                  style: GoogleFonts.inter(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            const SizedBox(width: 8),
                            // Location
                            Flexible(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    LucideIcons.mapPin,
                                    size: 12,
                                    color: AppColors.darkTextMuted,
                                  ),
                                  const SizedBox(width: 4),
                                  Flexible(
                                    child: Text(
                                      exp.location,
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: AppColors.darkTextMuted,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        // Date Range
                        Row(
                          children: [
                            Icon(
                              LucideIcons.calendar,
                              size: 12,
                              color: AppColors.darkTextMuted,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${exp.startDate} - ${exp.endDate ?? 'Present'}',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: AppColors.darkTextMuted,
                              ),
                            ),
                          ],
                        ),

                        // Expanded Content
                        AnimatedCrossFade(
                          firstChild: const SizedBox.shrink(),
                          secondChild: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              const Divider(color: AppColors.glassBorder),
                              const SizedBox(height: 16),

                              // Description
                              Text(
                                exp.description,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: AppColors.darkTextSecondary,
                                  height: 1.6,
                                ),
                              ),

                              // Responsibilities
                              if (exp.responsibilities.isNotEmpty) ...[
                                const SizedBox(height: 16),
                                Text(
                                  'Responsibilities',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryRed,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                ...exp.responsibilities.map((r) => Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(top: 6),
                                            width: 6,
                                            height: 6,
                                            decoration: const BoxDecoration(
                                              color: AppColors.primaryRed,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              r,
                                              style: GoogleFonts.inter(
                                                fontSize: 13,
                                                color: AppColors.darkTextSecondary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],

                              // Technologies
                              if (exp.technologies.isNotEmpty) ...[
                                const SizedBox(height: 16),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: exp.technologies.map((tech) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            AppColors.primaryRed.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: AppColors.primaryRed
                                              .withOpacity(0.3),
                                        ),
                                      ),
                                      child: Text(
                                        tech,
                                        style: GoogleFonts.inter(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.primaryRed,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ],
                          ),
                          crossFadeState: _isExpanded
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: AppDurations.medium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: 100 * widget.index),
          duration: AppDurations.medium,
        )
        .slideX(begin: 0.05, end: 0);
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
            LucideIcons.briefcase,
            size: 64,
            color: AppColors.darkTextMuted,
          ),
          const SizedBox(height: 16),
          Text(
            'No experiences found',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.darkTextSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try selecting a different filter',
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
