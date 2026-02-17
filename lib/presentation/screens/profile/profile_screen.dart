import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/theme_extensions.dart';
import '../../../data/providers/user_providers.dart';
import '../../widgets/common/glass_card.dart';
import '../../widgets/common/profile_avatar.dart';
import '../../widgets/effects/floating_orbs.dart';
import '../../widgets/layout/ultimate_background.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 👤 PROFILE SCREEN
/// ═══════════════════════════════════════════════════════════════════════════
/// Displays user profile with photo, name, bio, contact info, and skills.

IconData _getSocialIcon(String platform) {
  switch (platform.toLowerCase()) {
    case 'linkedin':
      return LucideIcons.linkedin;
    case 'github':
      return LucideIcons.github;
    case 'facebook':
      return LucideIcons.facebook;
    case 'twitter':
    case 'x':
      return LucideIcons.twitter;
    case 'instagram':
      return LucideIcons.instagram;
    case 'email':
    case 'mail':
      return LucideIcons.mail;
    case 'website':
    case 'portfolio':
      return LucideIcons.globe;
    case 'youtube':
      return LucideIcons.youtube;
    default:
      return LucideIcons.link;
  }
}

Color _getSocialColor(String platform, bool isDark) {
  switch (platform.toLowerCase()) {
    case 'github':
      return isDark ? Colors.white : const Color(0xFF333333);
    case 'linkedin':
      return const Color(0xFF0A66C2);
    case 'twitter':
    case 'x':
      return const Color(0xFF1DA1F2);
    case 'email':
    case 'mail':
      return AppColors.primaryRed;
    case 'instagram':
      return const Color(0xFFE4405F);
    case 'youtube':
      return const Color(0xFFFF0000);
    case 'facebook':
      return const Color(0xFF1877F2);
    default:
      return AppColors.primaryRed;
  }
}

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProfileProvider);
    final cyberpunk = context.cyberpunk;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background
          const UltimateBackground(),
          const FloatingOrbs(),

          // Main Content
          SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // App Bar
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  floating: true,
                  leading: IconButton(
                    icon: Icon(
                      LucideIcons.arrowLeft,
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary,
                    ),
                    onPressed: () => context.pop(),
                  ),
                  title: Text(
                    'My Profile',
                    style: TextStyle(
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                  actions: [
                    // Edit Button
                    IconButton(
                      icon: Icon(
                        LucideIcons.edit,
                        color: cyberpunk.neonPrimary,
                      ),
                      onPressed: () {
                        context.push(AppRouter.editProfile);
                      },
                    ),
                  ],
                ),

                // Profile Content
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // Profile Picture & Name Card
                      _buildProfileHeader(context, profile, cyberpunk)
                          .animate()
                          .fadeIn(duration: 600.ms)
                          .slideY(begin: 0.1, end: 0),

                      const SizedBox(height: 24),

                      // Bio Section
                      _buildBioSection(context, profile, cyberpunk)
                          .animate()
                          .fadeIn(duration: 600.ms, delay: 100.ms)
                          .slideY(begin: 0.1, end: 0),

                      const SizedBox(height: 24),

                      // Contact Info Section
                      _buildContactSection(context, profile, cyberpunk)
                          .animate()
                          .fadeIn(duration: 600.ms, delay: 200.ms)
                          .slideY(begin: 0.1, end: 0),

                      const SizedBox(height: 24),

                      // Skills Section
                      _buildSkillsSection(context, profile, cyberpunk)
                          .animate()
                          .fadeIn(duration: 600.ms, delay: 300.ms)
                          .slideY(begin: 0.1, end: 0),

                      const SizedBox(height: 24),

                      // Hobbies & Interests
                      _buildHobbiesInterestsSection(context, profile, cyberpunk)
                          .animate()
                          .fadeIn(duration: 600.ms, delay: 400.ms)
                          .slideY(begin: 0.1, end: 0),

                      const SizedBox(height: 24),

                      // Friends Button
                      _buildFriendsButton(context, cyberpunk)
                          .animate()
                          .fadeIn(duration: 600.ms, delay: 500.ms)
                          .slideY(begin: 0.1, end: 0),

                      const SizedBox(height: 40),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(
      BuildContext context, dynamic profile, CyberpunkTheme cyberpunk) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final avatarSize = screenWidth < 360 ? 100.0 : 120.0;
    // Responsive font size: smaller screens get smaller text
    final nameSize = screenWidth < 340 
        ? 18.0 
        : screenWidth < 360 
            ? 20.0 
            : screenWidth < 400 
                ? 24.0 
                : 28.0;

    return GlassCard(
      padding: const EdgeInsets.all(24),
      borderRadius: 24,
      child: Column(
        children: [
          // Profile Picture — uses shared ProfileAvatar widget
          ProfileAvatar(
            size: avatarSize,
            showGlow: true,
            glowIntensity: 0.4,
          ),

          const SizedBox(height: 16),

          // Full Name
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              profile.fullName,
              style: TextStyle(
                fontSize: nameSize,
                fontWeight: FontWeight.bold,
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const SizedBox(height: 8),

          // Email badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            constraints: BoxConstraints(maxWidth: screenWidth - 80),
            decoration: BoxDecoration(
              color: cyberpunk.neonPrimary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: cyberpunk.neonPrimary.withValues(alpha: 0.3),
              ),
            ),
            child: Text(
              profile.email,
              style: TextStyle(
                fontSize: screenWidth < 360 ? 12 : 14,
                color: cyberpunk.neonPrimary,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBioSection(
      BuildContext context, dynamic profile, CyberpunkTheme cyberpunk) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    return GlassCard(
      padding: const EdgeInsets.all(20),
      borderRadius: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(LucideIcons.fileText, color: cyberpunk.neonPrimary, size: 20),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: screenWidth < 360 ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.lightTextPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            profile.bio,
            style: TextStyle(
              fontSize: screenWidth < 360 ? 14 : 15,
              height: 1.6,
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(
      BuildContext context, dynamic profile, CyberpunkTheme cyberpunk) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    return GlassCard(
      padding: const EdgeInsets.all(20),
      borderRadius: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(LucideIcons.contact, color: cyberpunk.neonPrimary, size: 20),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  'Contact Information',
                  style: TextStyle(
                    fontSize: screenWidth < 360 ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,                  ),                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildContactRow(
            icon: LucideIcons.mail,
            label: 'Email',
            value: profile.email,
            cyberpunk: cyberpunk,
            isDark: isDark,
          ),
          const SizedBox(height: 12),
          _buildContactRow(
            icon: LucideIcons.phone,
            label: 'Phone',
            value: profile.phone,
            cyberpunk: cyberpunk,
            isDark: isDark,
          ),
          if (profile.socialLinks.isNotEmpty) ...[
            const SizedBox(height: 16),
            Divider(color: cyberpunk.glassBorder),
            const SizedBox(height: 16),
            Text(
              'Social Links',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: profile.socialLinks.entries.map<Widget>((entry) {
                return GestureDetector(
                  onTap: () async {
                    final url = entry.value;
                    if (url.isEmpty) return;
                    final uri = Uri.tryParse(url);
                    if (uri != null && await canLaunchUrl(uri)) {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    }
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.glassBackgroundDark
                          : AppColors.glassBackgroundLight,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isDark
                            ? AppColors.glassBorderDark
                            : Colors.grey.shade200,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _getSocialIcon(entry.key),
                          size: 16,
                          color: _getSocialColor(entry.key, isDark),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          entry.key,
                          style: TextStyle(
                            color: _getSocialColor(entry.key, isDark),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildContactRow({
    required IconData icon,
    required String label,
    required String value,
    required CyberpunkTheme cyberpunk,
    required bool isDark,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: cyberpunk.neonPrimary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 18, color: cyberpunk.neonPrimary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: isDark
                      ? AppColors.darkTextMuted
                      : AppColors.lightTextMuted,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsSection(
      BuildContext context, dynamic profile, CyberpunkTheme cyberpunk) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    return GlassCard(
      padding: const EdgeInsets.all(20),
      borderRadius: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(LucideIcons.code2, color: cyberpunk.neonPrimary, size: 20),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  'Skills',
                  style: TextStyle(
                    fontSize: screenWidth < 360 ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.lightTextPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: profile.skills.map<Widget>((skill) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      cyberpunk.neonPrimary.withValues(alpha: 0.2),
                      cyberpunk.neonSecondary.withValues(alpha: 0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: cyberpunk.neonPrimary.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  skill,
                  style: TextStyle(
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.lightTextPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildHobbiesInterestsSection(
      BuildContext context, dynamic profile, CyberpunkTheme cyberpunk) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GlassCard(
      padding: const EdgeInsets.all(20),
      borderRadius: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hobbies
          Row(
            children: [
              Icon(LucideIcons.heart, color: cyberpunk.neonPrimary),
              const SizedBox(width: 12),
              Text(
                'Hobbies',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: profile.hobbies.map<Widget>((hobby) {
              return Chip(
                label: Text(hobby),
                backgroundColor: cyberpunk.surfaceVariant,
                labelStyle: TextStyle(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                  fontSize: 12,
                ),
                side: BorderSide.none,
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          // Interests
          Row(
            children: [
              Icon(LucideIcons.sparkles, color: cyberpunk.neonPrimary),
              const SizedBox(width: 12),
              Text(
                'Interests',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: profile.interests.map<Widget>((interest) {
              return Chip(
                label: Text(interest),
                backgroundColor: cyberpunk.surfaceVariant,
                labelStyle: TextStyle(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                  fontSize: 12,
                ),
                side: BorderSide.none,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFriendsButton(BuildContext context, CyberpunkTheme cyberpunk) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return InkWell(
      onTap: () {
        context.push(AppRouter.friends);
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: cyberpunk.primaryGradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: cyberpunk.neonPrimary.withValues(alpha: 0.3),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(LucideIcons.users, color: isDark ? Colors.white : Colors.white, size: 24),
            const SizedBox(width: 12),
            Text(
              'View Friends List',
              style: TextStyle(
                color: isDark ? Colors.white : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Icon(LucideIcons.chevronRight, color: isDark ? Colors.white : Colors.white),
          ],
        ),
      ),
    );
  }
}
