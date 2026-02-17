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
import '../../widgets/effects/floating_orbs.dart';
import '../../widgets/layout/ultimate_background.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🏆 ALL HACKATHONS SCREEN
/// ═══════════════════════════════════════════════════════════════════════════
/// Full archive of all hackathons and competitions.

class AllHackathonsScreen extends ConsumerWidget {
  const AllHackathonsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hackathonsAsync = ref.watch(hackathonsProvider);
    final navState = ref.read(navigationProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const UltimateBackground(),
          const FloatingOrbs(),

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
                  'Hackathons',
                  style: TextStyle(
                    color: isDark ? textColor : AppColors.primaryRed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
              ),

              // Content
              hackathonsAsync.when(
                data: (hackathons) => SliverPadding(
                  padding: const EdgeInsets.all(24),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _HackathonCard(
                          hackathon: hackathons[index],
                          index: index,
                          isDark: isDark,
                        ),
                      ),
                      childCount: hackathons.length,
                    ),
                  ),
                ),
                loading: () => const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.primaryRed),
                  ),
                ),
                error: (_, __) => SliverPadding(
                  padding: const EdgeInsets.all(24),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _HackathonCard(
                          hackathon: Hackathon.fallback[index],
                          index: index,
                          isDark: isDark,
                        ),
                      ),
                      childCount: Hackathon.fallback.length,
                    ),
                  ),
                ),
              ),

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

class _HackathonCard extends StatefulWidget {
  final Hackathon hackathon;
  final int index;
  final bool isDark;

  const _HackathonCard({
    required this.hackathon,
    required this.index,
    required this.isDark,
  });

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
                  height: isSmall ? 180 : 200,
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
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: widget.index * 40), duration: AppDurations.medium)
        .slideY(begin: 0.1, end: 0);
  }
}
