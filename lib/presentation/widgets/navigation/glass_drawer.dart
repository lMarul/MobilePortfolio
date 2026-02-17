import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/providers/navigation_providers.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/theme_extensions.dart';
import '../../../core/theme/theme_provider.dart';
import '../../../data/providers/user_providers.dart';
import '../common/profile_avatar.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🪟 GLASS DRAWER — Cyberpunk-style Navigation Sidebar
/// ═══════════════════════════════════════════════════════════════════════════
/// A glassmorphic drawer with:
///  • Profile summary at the top
///  • In-app navigation items (Home, Projects, Experience, Certifications)
///  • Dark / Light mode toggle in a clearly labeled settings section
///
/// Design rationale:
///  • Drawer width is 280dp — wide enough for comfortable tap targets
///    (48dp min per Material guidelines) without covering the full screen,
///    so the user retains spatial context.
///  • BackdropFilter blur gives the signature glassmorphism look while
///    keeping the drawer lightweight (no heavy images).
///  • The red accent border on the right edge ties it to the cyberpunk
///    palette without feeling "loud."

class GlassDrawer extends ConsumerWidget {
  const GlassDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cyberpunk = context.cyberpunk;
    final isDark = context.isDarkMode;
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.sizeOf(context).height;

    return SizedBox(
      width: 280,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            height: screenHeight,
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.darkBackground.withValues(alpha: 0.85)
                  : AppColors.lightBackground.withValues(alpha: 0.88),
              border: Border(
                right: BorderSide(
                  color: cyberpunk.neonPrimary.withValues(alpha: 0.25),
                  width: 1.5,
                ),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  // ── Profile Summary ──
                  _ProfileHeader(cyberpunk: cyberpunk, theme: theme),

                  Divider(
                    color: cyberpunk.glassBorder,
                    height: 1,
                    indent: 20,
                    endIndent: 20,
                  ),

                  const SizedBox(height: 12),

                  // ── Navigation Items ──
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      children: [
                        _DrawerNavItem(
                          icon: LucideIcons.user,
                          label: 'Profile',
                          routePath: AppRouter.profile,
                        ),
                        _DrawerNavItem(
                          icon: LucideIcons.users,
                          label: 'Friends',
                          routePath: AppRouter.friends,
                        ),
                        _DrawerNavItem(
                          icon: LucideIcons.rocket,
                          label: AppStrings.navProjects,
                          routePath: AppRouter.projects,
                        ),
                        _DrawerNavItem(
                          icon: LucideIcons.trophy,
                          label: 'Hackathons',
                          routePath: AppRouter.hackathons,
                        ),
                        _DrawerNavItem(
                          icon: LucideIcons.award,
                          label: AppStrings.navCertifications,
                          routePath: AppRouter.certifications,
                        ),
                        _DrawerNavItem(
                          icon: LucideIcons.briefcase,
                          label: AppStrings.navExperience,
                          routePath: AppRouter.experiences,
                        ),
                      ],
                    ),
                  ),

                  // ── Settings Section ──
                  Divider(
                    color: cyberpunk.glassBorder,
                    height: 1,
                    indent: 20,
                    endIndent: 20,
                  ),

                  _SettingsSection(ref: ref),

                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// 👤 Profile Header
// ─────────────────────────────────────────────────────────────────────────────

class _ProfileHeader extends ConsumerWidget {
  const _ProfileHeader({required this.cyberpunk, required this.theme});

  final CyberpunkTheme cyberpunk;
  final ThemeData theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProfileProvider);

    return Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          child: Row(
            children: [
              // Avatar — uses shared ProfileAvatar widget
              ProfileAvatar(
                size: 52,
                showGlow: true,
                glowIntensity: 0.35,
                fontSize: 16,
              ),

              const SizedBox(width: 14),

              // Name + role
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile.fullName,
                      style: GoogleFonts.cinzel(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.onSurface,
                        letterSpacing: 0.3,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      AppStrings.heroTitle,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: cyberpunk.neonPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 400.ms, delay: 100.ms)
        .slideX(begin: -0.1, end: 0);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// 🗂️ Navigation Item
// ─────────────────────────────────────────────────────────────────────────────

class _DrawerNavItem extends ConsumerWidget {
  const _DrawerNavItem({
    required this.icon,
    required this.label,
    required this.routePath,
  });

  final IconData icon;
  final String label;
  final String routePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cyberpunk = context.cyberpunk;
    final theme = Theme.of(context);

    // Determine if this route is currently active
    final currentLocation = GoRouterState.of(context).uri.toString();
    final isActive = currentLocation == routePath;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Material(
        color: isActive
            ? cyberpunk.neonPrimary.withValues(alpha: 0.12)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            // Reset navigation state when navigating from sidebar
            ref.read(navigationProvider.notifier).setFromSidebar();
            Navigator.of(context).pop(); // Close drawer
            if (!isActive) {
              context.push(routePath);
            }
          },
          borderRadius: BorderRadius.circular(12),
          splashColor: cyberpunk.neonPrimary.withValues(alpha: 0.15),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: isActive
                      ? cyberpunk.neonPrimary
                      : theme.colorScheme.onSurface.withValues(alpha: 0.65),
                ),
                const SizedBox(width: 14),
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                    color: isActive
                        ? cyberpunk.neonPrimary
                        : theme.colorScheme.onSurface,
                  ),
                ),
                const Spacer(),
                if (isActive)
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: cyberpunk.neonPrimary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: cyberpunk.neonPrimary.withValues(alpha: 0.5),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ⚙️ Settings Section (Theme Toggle)
// ─────────────────────────────────────────────────────────────────────────────

/// Helper — checks effective brightness.
bool _isEffectivelyDark(ThemeModeOption mode) {
  switch (mode) {
    case ThemeModeOption.dark:
      return true;
    case ThemeModeOption.light:
      return false;
    case ThemeModeOption.system:
      return SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;
  }
}

class _SettingsSection extends ConsumerWidget {
  const _SettingsSection({required this.ref});

  // We accept the ref so that this widget can be a plain ConsumerWidget.
  // ignore: unused_field  (used implicitly via build's ref parameter)
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);
    final isDark = _isEffectivelyDark(themeMode);
    final cyberpunk = context.cyberpunk;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SETTINGS',
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: cyberpunk.textMuted,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                size: 20,
                color: cyberpunk.neonPrimary,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  isDark ? 'Dark Mode' : 'Light Mode',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              Switch.adaptive(
                value: isDark,
                onChanged: (_) {
                  ref.read(themeControllerProvider.notifier).toggle();
                },
                activeThumbColor: cyberpunk.neonPrimary,
                activeTrackColor: cyberpunk.neonPrimary.withValues(alpha: 0.3),
                inactiveThumbColor: cyberpunk.neonPrimary,
                inactiveTrackColor: cyberpunk.neonPrimary.withValues(alpha: 0.15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
