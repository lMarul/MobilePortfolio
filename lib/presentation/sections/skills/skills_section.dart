import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_durations.dart';
import '../../../data/models/skill.dart';
import '../../../data/providers/portfolio_providers.dart';
import '../../widgets/common/shimmer_text.dart';

/// Skills Section - Theme-aware
class SkillsSection extends ConsumerWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillsAsync = ref.watch(skillsProvider);
    return skillsAsync.when(
      data: (categories) => _SkillsContent(categories: categories),
      loading: () => const _SkillsSkeleton(),
      error: (_, __) => _SkillsContent(categories: SkillCategory.fallback),
    );
  }
}

class _SkillsContent extends StatelessWidget {
  final List<SkillCategory> categories;
  const _SkillsContent({required this.categories});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmall = screenWidth < 360;

    final titleStyle = theme.textTheme.displaySmall?.copyWith(
      color: isDark ? null : AppColors.primaryRed,
      fontWeight: FontWeight.bold, fontSize: isSmall ? 22 : 26,
    ) ?? const TextStyle();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 20, vertical: isSmall ? 28 : 36),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        (ShimmerText(text: 'Skills', style: titleStyle) as Widget)
            .animate().fadeIn(duration: AppDurations.medium),
        const SizedBox(height: 6),
        Text('Technologies I work with',
          style: theme.textTheme.bodySmall?.copyWith(color: AppColors.primaryRed, fontSize: isSmall ? 11 : 12),
        ).animate().fadeIn(delay: 200.ms, duration: AppDurations.medium),
        SizedBox(height: isSmall ? 20 : 28),
        ...categories.asMap().entries.map((entry) =>
            _CategorySection(category: entry.value, index: entry.key, isDark: isDark)),
      ]),
    );
  }
}

class _CategorySection extends StatelessWidget {
  final SkillCategory category;
  final int index;
  final bool isDark;
  const _CategorySection({required this.category, required this.index, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final isSmall = MediaQuery.of(context).size.width < 360;

    return Padding(
      padding: EdgeInsets.only(bottom: isSmall ? 20 : 28),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(category.icon, style: TextStyle(fontSize: isSmall ? 16 : 18)),
          const SizedBox(width: 8),
          Flexible(child: Text(category.name,
            style: theme.textTheme.titleMedium?.copyWith(color: textColor, fontWeight: FontWeight.bold, fontSize: isSmall ? 14 : 16),
            maxLines: 1, overflow: TextOverflow.ellipsis)),
        ]).animate()
            .fadeIn(delay: Duration(milliseconds: index * 50), duration: AppDurations.medium)
            .slideX(begin: -0.08, end: 0),
        const SizedBox(height: 12),
        Wrap(spacing: 10, runSpacing: 10, alignment: WrapAlignment.center, children: category.skills.asMap().entries.map((entry) =>
            _SkillCard(skill: entry.value, index: entry.key, isDark: isDark)).toList()),
      ]),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final Skill skill;
  final int index;
  final bool isDark;
  const _SkillCard({required this.skill, required this.index, required this.isDark});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isPressed = false;

  Widget _buildSkillImage(bool isSmall) {
    final url = widget.skill.imageUrl;
    final size = isSmall ? 24.0 : 28.0;
    final fallback = Center(child: Text(
      widget.skill.name.length >= 2 ? widget.skill.name.substring(0, 2).toUpperCase() : widget.skill.name.toUpperCase(),
      style: TextStyle(color: AppColors.primaryRed, fontWeight: FontWeight.bold, fontSize: isSmall ? 10 : 12),
    ));

    // Use SvgPicture for SVG URLs, CachedNetworkImage for raster
    if (url.toLowerCase().endsWith('.svg')) {
      return SvgPicture.network(
        url,
        width: size, height: size,
        fit: BoxFit.contain,
        placeholderBuilder: (context) => Center(child: SizedBox(
          width: 14, height: 14,
          child: CircularProgressIndicator(strokeWidth: 1.5, color: AppColors.primaryRed.withValues(alpha: 0.4)),
        )),
      );
    } else {
      return CachedNetworkImage(
        imageUrl: url,
        width: size, height: size,
        fit: BoxFit.contain,
        placeholder: (context, _) => Center(child: SizedBox(
          width: 14, height: 14,
          child: CircularProgressIndicator(strokeWidth: 1.5, color: AppColors.primaryRed.withValues(alpha: 0.4)),
        )),
        errorWidget: (context, _, __) => fallback,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final isSmall = MediaQuery.of(context).size.width < 360;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => Future.delayed(const Duration(milliseconds: 150), () {
        if (mounted) setState(() => _isPressed = false);
      }),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: AppDurations.fast,
        width: isSmall ? 80 : 90,
        padding: EdgeInsets.all(isSmall ? 8 : 10),
        transform: Matrix4.identity()..scale(_isPressed ? 1.05 : 1.0, _isPressed ? 1.05 : 1.0),
        decoration: BoxDecoration(
          color: widget.isDark ? AppColors.glassBackgroundDark : AppColors.glassBackgroundLight,
          borderRadius: BorderRadius.circular(isSmall ? 12 : 14),
          border: Border.all(
            color: _isPressed
                ? AppColors.primaryRed.withValues(alpha: 0.5)
                : (widget.isDark ? AppColors.glassBorderDark : Colors.grey.shade200),
          ),
          boxShadow: _isPressed ? [
            BoxShadow(color: AppColors.primaryRed.withValues(alpha: 0.15), blurRadius: 16, spreadRadius: -4),
          ] : null,
        ),
        child: Column(children: [
          Container(
            width: isSmall ? 36 : 42, height: isSmall ? 36 : 42,
            decoration: BoxDecoration(
              color: (widget.isDark ? AppColors.darkElevated : AppColors.lightElevated).withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(isSmall ? 8 : 10),
              border: Border.all(color: AppColors.primaryRed.withValues(alpha: 0.15)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isSmall ? 7 : 9),
              child: _buildSkillImage(isSmall),
            ),
          ),
          const SizedBox(height: 6),
          Text(widget.skill.name,
            style: theme.textTheme.bodySmall?.copyWith(color: textColor, fontWeight: FontWeight.w600, fontSize: isSmall ? 9 : 10),
            textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
        ]),
      ),
    ).animate()
        .fadeIn(delay: Duration(milliseconds: widget.index * 40), duration: AppDurations.medium)
        .scale(begin: const Offset(0.85, 0.85), end: const Offset(1, 1));
  }
}

class _SkillsSkeleton extends StatelessWidget {
  const _SkillsSkeleton();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(width: 160, height: 28, decoration: BoxDecoration(color: AppColors.glass, borderRadius: BorderRadius.circular(8))),
        const SizedBox(height: 24),
        Wrap(spacing: 10, runSpacing: 10, children: List.generate(8, (i) =>
          Container(width: 90, height: 85, decoration: BoxDecoration(color: AppColors.glass, borderRadius: BorderRadius.circular(14))))),
      ]),
    ).animate(onPlay: (c) => c.repeat()).shimmer(duration: 1500.ms, color: AppColors.primaryRed.withValues(alpha: 0.1));
  }
}