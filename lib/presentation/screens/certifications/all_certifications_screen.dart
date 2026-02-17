import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_durations.dart';
import '../../../core/providers/navigation_providers.dart';
import '../../../core/router/app_router.dart';
import '../../../core/utils/certification_logo_utils.dart';
import '../../../data/models/certification.dart';
import '../../../data/providers/portfolio_providers.dart';
import '../../widgets/common/glass_card.dart';
import '../../widgets/common/gradient_border.dart';
import '../../widgets/effects/floating_orbs.dart';
import '../../widgets/layout/ultimate_background.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 📜 ALL CERTIFICATIONS SCREEN
/// ═══════════════════════════════════════════════════════════════════════════
/// Full archive of all professional certifications grouped by category.

class AllCertificationsScreen extends ConsumerStatefulWidget {
  const AllCertificationsScreen({super.key});

  @override
  ConsumerState<AllCertificationsScreen> createState() =>
      _AllCertificationsScreenState();
}

class _AllCertificationsScreenState
    extends ConsumerState<AllCertificationsScreen> {

  @override
  Widget build(BuildContext context) {
    final certificationsAsync = ref.watch(certificationsProvider);
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
                  'Certifications',
                  style: TextStyle(
                    color: isDark ? textColor : AppColors.primaryRed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
              ),

              // Certifications List
              certificationsAsync.when(
                data: (certs) {
                  if (certs.isEmpty) {
                    return const SliverFillRemaining(
                      child: _EmptyState(),
                    );
                  }
                  // Sort by date descending (latest first)
                  final sorted = List<Certification>.from(certs)
                    ..sort((a, b) => b.date.compareTo(a.date));
                  
                  return SliverPadding(
                    padding: const EdgeInsets.all(24),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _CertificationCard(
                            certification: sorted[index],
                            index: index,
                            isDark: isDark,
                          ),
                        ),
                        childCount: sorted.length,
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
                  final sorted = List<Certification>.from(Certification.fallback)
                    ..sort((a, b) => b.date.compareTo(a.date));
                  
                  return SliverPadding(
                    padding: const EdgeInsets.all(24),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _CertificationCard(
                            certification: sorted[index],
                            index: index,
                            isDark: isDark,
                          ),
                        ),
                        childCount: sorted.length,
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
// 🃏 CERTIFICATION CARD
// ═══════════════════════════════════════════════════════════════════════════

class _CertificationCard extends StatefulWidget {
  final Certification certification;
  final int index;
  final bool isDark;

  const _CertificationCard({
    required this.certification,
    required this.index,
    required this.isDark,
  });

  @override
  State<_CertificationCard> createState() => _CertificationCardState();
}

class _CertificationCardState extends State<_CertificationCard> {
  bool _isPressed = false;

  Color _parseColor(String hex) {
    try {
      final h = hex.replaceFirst('#', '');
      if (h.length == 6) return Color(int.parse('FF$h', radix: 16));
      if (h.length == 8) return Color(int.parse(h, radix: 16));
    } catch (_) {}
    return AppColors.primaryRed;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final cert = widget.certification;
    final isDark = widget.isDark;
    final issuerColor = _parseColor(cert.color);

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
          borderRadius: 18,
          gradient: _isPressed
              ? AppColors.primaryGradient
              : LinearGradient(colors: [
                  isDark ? AppColors.glassBorderDark : Colors.grey.shade200,
                  isDark ? AppColors.glassBorderDark : Colors.grey.shade200,
                ]),
          strokeWidth: 1,
          child: GlassCard(
            borderRadius: 18,
            blur: 15,
            opacity: _isPressed ? 0.12 : 0.06,
            child: IntrinsicHeight(
              child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                // Issuer Badge Section
                Container(
                  width: 116,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        issuerColor.withValues(alpha: 0.15),
                        issuerColor.withValues(alpha: 0.05),
                      ],
                    ),
                    borderRadius: const BorderRadius.horizontal(left: Radius.circular(18)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: issuerColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: issuerColor.withValues(alpha: 0.4), width: 2),
                        ),
                        child: Center(
                          child: CertificationLogoUtils.isPythonCertification(cert.title)
                            ? SvgPicture.network(
                                'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg',
                                width: 28,
                                height: 28,
                                colorFilter: ColorFilter.mode(issuerColor, BlendMode.srcIn),
                                placeholderBuilder: (context) => Icon(
                                  Icons.code_rounded,
                                  color: issuerColor,
                                  size: 28,
                                ),
                              )
                            : Icon(
                                CertificationLogoUtils.getCertificationIcon(
                                  title: cert.title,
                                  issuer: cert.issuer,
                                  iconType: cert.iconType,
                                ),
                                color: issuerColor,
                                size: 28,
                              ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Icon(
                        Icons.verified,
                        color: issuerColor,
                        size: 22,
                      ),
                    ],
                  ),
                ),
                // Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cert.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          cert.issuer,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: issuerColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 12,
                              color: textColor.withValues(alpha: 0.5),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                cert.date,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: textColor.withValues(alpha: 0.5),
                                  fontSize: 12,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        if (cert.credentialId.isNotEmpty) ...[
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(
                                LucideIcons.hash,
                                size: 12,
                                color: textColor.withValues(alpha: 0.5),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  cert.credentialId,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: textColor.withValues(alpha: 0.5),
                                    fontSize: 11,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: cert.skills.take(3).map((skill) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: issuerColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: issuerColor.withValues(alpha: 0.3)),
                            ),
                            child: Text(
                              skill,
                              style: TextStyle(
                                color: issuerColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
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
    ).animate()
        .fadeIn(delay: Duration(milliseconds: widget.index * 30), duration: AppDurations.medium)
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
            LucideIcons.award,
            size: 64,
            color: AppColors.darkTextMuted,
          ),
          const SizedBox(height: 16),
          Text(
            'No certifications found',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.darkTextSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try selecting a different category',
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
