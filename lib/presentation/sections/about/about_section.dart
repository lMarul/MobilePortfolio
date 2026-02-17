import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_durations.dart';
import '../../../data/models/about_content.dart';
import '../../../data/providers/portfolio_providers.dart';
import '../../widgets/common/glass_card.dart';
import '../../widgets/common/gradient_border.dart';
import '../../widgets/common/shimmer_text.dart';

/// About Section - Theme-aware text colors
class AboutSection extends ConsumerWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aboutAsync = ref.watch(aboutContentProvider);
    return aboutAsync.when(
      data: (about) => _AboutContent(about: about),
      loading: () => const _AboutSkeleton(),
      error: (_, __) => _AboutContent(about: AboutContent.fallback),
    );
  }
}

class _AboutContent extends StatelessWidget {
  final AboutContent about;
  const _AboutContent({required this.about});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmall = screenWidth < 360;
    final textColor = theme.colorScheme.onSurface;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 20, vertical: isSmall ? 28 : 36),
      child: Column(children: [
        _SectionHeader(title: about.title ?? 'About Me', subtitle: about.subtitle ?? '', isDark: isDark),
        SizedBox(height: isSmall ? 20 : 28),

        GradientBorder(
          borderRadius: isSmall ? 14 : 16, gradient: AppColors.primaryGradient, strokeWidth: 1.5,
          child: GlassCard(
            borderRadius: isSmall ? 14 : 16, blur: 18, opacity: 0.08,
            padding: EdgeInsets.all(isSmall ? 16 : 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ...about.paragraphs.asMap().entries.map((entry) {
                return Padding(
                  padding: EdgeInsets.only(bottom: entry.key < about.paragraphs.length - 1 ? 16 : 0),
                  child: Text(entry.value,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDark ? textColor.withValues(alpha: 0.85) : textColor.withValues(alpha: 0.8),
                      height: 1.7, letterSpacing: 0.2, fontSize: isSmall ? 12 : 13),
                  ),
                ).animate()
                    .fadeIn(delay: Duration(milliseconds: 200 + (entry.key * AppDurations.staggerDelay.inMilliseconds)),
                      duration: AppDurations.medium)
                    .slideX(begin: -0.03, end: 0);
              }),
              if (about.highlights.isNotEmpty) ...[
                const SizedBox(height: 24),
                Divider(color: isDark ? AppColors.glassBorderDark : Colors.grey.shade200),
                const SizedBox(height: 24),
                Wrap(spacing: 16, runSpacing: 16, children: about.highlights.asMap().entries.map((entry) =>
                    _HighlightCard(highlight: entry.value, index: entry.key, isDark: isDark)).toList()),
              ],
            ]),
          ),
        ).animate().fadeIn(duration: AppDurations.slow)
            .scale(begin: const Offset(0.97, 0.97), end: const Offset(1, 1)),
      ]),
    );
  }
}

class _HighlightCard extends StatelessWidget {
  final AboutHighlight highlight;
  final int index;
  final bool isDark;
  const _HighlightCard({required this.highlight, required this.index, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mutedColor = isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmall = screenWidth < 360;
    final availableWidth = screenWidth - 40 - 40 - 16;
    final cardWidth = (availableWidth / 2).clamp(90.0, 150.0);

    return Container(
      width: cardWidth,
      padding: EdgeInsets.all(isSmall ? 12 : 16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.glassBackgroundDark : AppColors.glassBackgroundLight,
        borderRadius: BorderRadius.circular(isSmall ? 12 : 14),
        border: Border.all(color: AppColors.primaryRed.withValues(alpha: 0.2)),
      ),
      child: Column(children: [
        Text(highlight.icon ?? '', style: TextStyle(fontSize: isSmall ? 24 : 28)),
        SizedBox(height: isSmall ? 8 : 10),
        GradientText(text: highlight.value ?? '', gradient: AppColors.primaryGradient,
          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, fontSize: isSmall ? 16 : 18) ?? const TextStyle()),
        const SizedBox(height: 3),
        Text(highlight.title ?? '',
          style: theme.textTheme.bodySmall?.copyWith(color: mutedColor, fontSize: isSmall ? 9 : 10),
          textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis),
      ]),
    ).animate()
        .fadeIn(delay: Duration(milliseconds: 200 + (index * 40)), duration: AppDurations.medium)
        .scale(begin: const Offset(0.85, 0.85), end: const Offset(1, 1));
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isDark;
  const _SectionHeader({required this.title, required this.subtitle, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSmall = MediaQuery.of(context).size.width < 360;

    final titleStyle = theme.textTheme.displaySmall?.copyWith(
      color: isDark ? null : AppColors.primaryRed,
      fontWeight: FontWeight.bold, fontSize: isSmall ? 22 : 26) ?? const TextStyle();

    return Column(children: [
      Center(
        child: (ShimmerText(text: title, style: titleStyle, textAlign: TextAlign.center) as Widget)
            .animate().fadeIn(duration: AppDurations.medium),
      ),
      const SizedBox(height: 6),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(subtitle,
          style: theme.textTheme.titleMedium?.copyWith(
            color: AppColors.primaryRed, 
            fontSize: isSmall ? 14 : 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
          textAlign: TextAlign.center,
        ).animate().fadeIn(delay: 200.ms, duration: AppDurations.medium),
      ),
    ]);
  }
}

class _AboutSkeleton extends StatelessWidget {
  const _AboutSkeleton();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(children: [
        Container(width: 160, height: 28, decoration: BoxDecoration(color: AppColors.glass, borderRadius: BorderRadius.circular(8))),
        const SizedBox(height: 24),
        GlassCard(borderRadius: 16, child: SizedBox(height: 150,
          child: Center(child: CircularProgressIndicator(color: AppColors.primaryRed.withValues(alpha: 0.5))))),
      ]),
    ).animate(onPlay: (c) => c.repeat()).shimmer(duration: 1500.ms, color: AppColors.primaryRed.withValues(alpha: 0.1));
  }
}