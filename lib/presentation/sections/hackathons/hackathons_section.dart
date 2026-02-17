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
import '../../../data/models/hackathon.dart';
import '../../../data/providers/portfolio_providers.dart';
import '../../widgets/common/glass_card.dart';
import '../../widgets/common/gradient_border.dart';
import '../../widgets/common/shimmer_text.dart';

class HackathonsSection extends ConsumerWidget {
  const HackathonsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hackathonsAsync = ref.watch(hackathonsProvider);
    return hackathonsAsync.when(
      data: (hackathons) => _HackathonsContent(hackathons: hackathons),
      loading: () => const _HackathonsSkeleton(),
      error: (_, __) => _HackathonsContent(hackathons: Hackathon.fallback),
    );
  }
}

class _HackathonsContent extends ConsumerWidget {
  final List<Hackathon> hackathons;
  const _HackathonsContent({required this.hackathons});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isSmall = MediaQuery.of(context).size.width < 360;

    final titleStyle = theme.textTheme.displaySmall?.copyWith(
      color: isDark ? null : AppColors.primaryRed,
      fontWeight: FontWeight.bold, fontSize: isSmall ? 22 : 26,
    ) ?? const TextStyle();

    final displayHackathons = hackathons.take(2).toList();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 20, vertical: isSmall ? 28 : 36),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              (ShimmerText(text: 'Hackathons', style: titleStyle) as Widget)
                  .animate().fadeIn(duration: AppDurations.medium),
              const SizedBox(height: 6),
              Text('Competitions & achievements',
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
                    sectionKey: 'hackathons',
                    scrollPosition: scrollController.pixels,
                  );
                }
                context.push(AppRouter.hackathons);
              },
              isDark: isDark,
            ),
          ],
        ),
        SizedBox(height: isSmall ? 16 : 24),
        ...displayHackathons.asMap().entries.map((entry) => Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: _HackathonCard(hackathon: entry.value, index: entry.key, isDark: isDark),
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

class _HackathonCard extends StatefulWidget {
  final Hackathon hackathon;
  final int index;
  final bool isDark;
  const _HackathonCard({required this.hackathon, required this.index, required this.isDark});

  @override
  State<_HackathonCard> createState() => _HackathonCardState();
}

class _HackathonCardState extends State<_HackathonCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final hackathon = widget.hackathon;
    final isDark = widget.isDark;
    final isSmall = MediaQuery.of(context).size.width < 360;

    return Padding(
      padding: EdgeInsets.only(bottom: isSmall ? 12 : 16),
      child: GestureDetector(
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
                        imageUrl: hackathon.thumbnail,
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
                              Icons.emoji_events,
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
                          hackathon.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: isSmall ? 13 : 15,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.business_outlined,
                              size: 12,
                              color: AppColors.primaryRed,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                hackathon.organizer,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: AppColors.primaryRed,
                                  fontSize: isSmall ? 11 : 12,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          hackathon.description,
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
                          children: hackathon.tags.take(2).map((tag) => Container(
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
        ),
      ),
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: widget.index * 50), duration: AppDurations.medium)
        .slideY(begin: 0.1, end: 0);
  }
}

class _HackathonsSkeleton extends StatelessWidget {
  const _HackathonsSkeleton();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(children: [
        Container(width: 200, height: 32, decoration: BoxDecoration(color: AppColors.glass, borderRadius: BorderRadius.circular(8))),
        const SizedBox(height: 36),
        ...List.generate(3, (i) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(height: 160, decoration: BoxDecoration(color: AppColors.glass, borderRadius: BorderRadius.circular(20))),
        )),
      ]),
    ).animate(onPlay: (c) => c.repeat()).shimmer(duration: 1500.ms, color: AppColors.primaryRed.withValues(alpha: 0.1));
  }
}