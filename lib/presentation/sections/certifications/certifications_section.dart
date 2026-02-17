import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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
import '../../widgets/common/shimmer_text.dart';

/// Certifications Section - Card-based layout matching projects pattern
class CertificationsSection extends ConsumerWidget {
  const CertificationsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final certificationsAsync = ref.watch(certificationsProvider);
    return certificationsAsync.when(
      data: (certs) => _CertificationsContent(certifications: certs),
      loading: () => const _CertificationsSkeleton(),
      error: (_, __) => _CertificationsContent(certifications: Certification.fallback),
    );
  }
}

class _CertificationsContent extends ConsumerWidget {
  final List<Certification> certifications;
  const _CertificationsContent({required this.certifications});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isSmall = MediaQuery.of(context).size.width < 360;

    final titleStyle = theme.textTheme.displaySmall?.copyWith(
      color: isDark ? null : AppColors.primaryRed,
      fontWeight: FontWeight.bold, fontSize: isSmall ? 22 : 26,
    ) ?? const TextStyle();

    // Sort by date descending (latest first) and take top 2
    final sorted = List<Certification>.from(certifications)
      ..sort((a, b) => b.date.compareTo(a.date));
    final displayCerts = sorted.take(2).toList();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 20, vertical: isSmall ? 28 : 36),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              (ShimmerText(text: 'Certifications', style: titleStyle) as Widget)
                  .animate().fadeIn(duration: AppDurations.medium),
              const SizedBox(height: 6),
              Text('Credentials & achievements',
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
                    sectionKey: 'certifications',
                    scrollPosition: scrollController.pixels,
                  );
                }
                context.push(AppRouter.certifications);
              },
              isDark: isDark,
            ),
          ],
        ),
        SizedBox(height: isSmall ? 16 : 24),
        ...displayCerts.asMap().entries.map((entry) => Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: _CertCard(cert: entry.value, index: entry.key, isDark: isDark),
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


class _CertCard extends StatefulWidget {
  final Certification cert;
  final int index;
  final bool isDark;
  const _CertCard({required this.cert, required this.index, required this.isDark});

  @override
  State<_CertCard> createState() => _CertCardState();
}

class _CertCardState extends State<_CertCard> {
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
    final cert = widget.cert;
    final isDark = widget.isDark;
    final isSmall = MediaQuery.of(context).size.width < 360;
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
                // Issuer Badge Section
                Container(
                  width: isSmall ? 105 : 116,
                  padding: EdgeInsets.all(isSmall ? 16 : 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        issuerColor.withValues(alpha: 0.15),
                        issuerColor.withValues(alpha: 0.05),
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
                          color: issuerColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: issuerColor.withValues(alpha: 0.4), width: 2),
                        ),
                        child: Center(
                          child: CertificationLogoUtils.isPythonCertification(cert.title)
                            ? SvgPicture.network(
                                'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg',
                                width: isSmall ? 24 : 28,
                                height: isSmall ? 24 : 28,
                                colorFilter: ColorFilter.mode(issuerColor, BlendMode.srcIn),
                                placeholderBuilder: (context) => Icon(
                                  Icons.code_rounded,
                                  color: issuerColor,
                                  size: isSmall ? 24 : 28,
                                ),
                              )
                            : Icon(
                                CertificationLogoUtils.getCertificationIcon(
                                  title: cert.title,
                                  issuer: cert.issuer,
                                  iconType: cert.iconType,
                                ),
                                color: issuerColor,
                                size: isSmall ? 24 : 28,
                              ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Icon(
                        Icons.verified,
                        color: issuerColor,
                        size: isSmall ? 18 : 20,
                      ),
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
                          cert.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: isSmall ? 13 : 15,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          cert.issuer,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: issuerColor,
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
                                cert.date,
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
                        if (cert.skills.isNotEmpty) ...[
                          SizedBox(height: isSmall ? 8 : 10),
                          Wrap(
                            spacing: 4,
                            runSpacing: 4,
                            children: cert.skills.take(2).map((skill) => Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: issuerColor.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                skill,
                                style: TextStyle(
                                  color: issuerColor,
                                  fontSize: 9,
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

class _CertificationsSkeleton extends StatelessWidget {
  const _CertificationsSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
      child: Column(
        children: [
          Container(
            width: 220,
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
                height: 120,
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