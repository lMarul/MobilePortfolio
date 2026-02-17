import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/theme_extensions.dart';
import '../../../data/providers/user_providers.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 👤 PROFILE AVATAR — Reusable Profile Picture Widget
/// ═══════════════════════════════════════════════════════════════════════════
/// Displays the user's profile image from local file, network URL, or
/// falls back to showing initials. Used consistently across the entire app:
///   • Hero section (main page)
///   • Glass drawer (sidebar)
///   • Profile screen
///   • Edit profile screen
///
/// This widget watches the userProfileProvider so it automatically updates
/// everywhere when the profile image changes.

class ProfileAvatar extends ConsumerWidget {
  const ProfileAvatar({
    super.key,
    required this.size,
    this.showGlow = true,
    this.glowIntensity = 0.35,
    this.borderWidth = 2.5,
    this.fontSize,
    this.useGradientBorder = true,
    this.overrideImageFile,
    this.overrideInitials,
  });

  /// Diameter of the avatar circle
  final double size;

  /// Whether to show the neon glow effect
  final bool showGlow;

  /// Intensity of the glow (0.0 - 1.0)
  final double glowIntensity;

  /// Border width around the avatar
  final double borderWidth;

  /// Font size for initials (auto-sized if null)
  final double? fontSize;

  /// Whether to use gradient border (true) or solid border (false)
  final bool useGradientBorder;

  /// Optional override image file (e.g., from image picker before saving)
  final File? overrideImageFile;

  /// Optional override initials text
  final String? overrideInitials;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProfileProvider);
    final cyberpunk = context.cyberpunk;

    // Determine the image to display
    final File? localFile = overrideImageFile ??
        (profile.localProfileImagePath != null &&
                profile.localProfileImagePath!.isNotEmpty
            ? File(profile.localProfileImagePath!)
            : null);

    final String? networkUrl = profile.profileImageUrl;
    final bool hasLocalImage = localFile != null && !kIsWeb;
    final bool hasNetworkImage =
        networkUrl != null && networkUrl.isNotEmpty;

    // Determine initials
    final String initials = overrideInitials ??
        _getInitials(profile.fullName);

    final double effectiveFontSize = fontSize ?? (size * 0.32);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: useGradientBorder ? cyberpunk.primaryGradient : null,
        color: useGradientBorder ? null : AppColors.primaryRed,
        boxShadow: showGlow
            ? [
                BoxShadow(
                  color: cyberpunk.neonPrimary
                      .withValues(alpha: glowIntensity),
                  blurRadius: size * 0.2,
                  spreadRadius: -2,
                ),
              ]
            : null,
      ),
      child: hasLocalImage
          ? ClipOval(
              child: Image.file(
                localFile,
                fit: BoxFit.cover,
                width: size,
                height: size,
                errorBuilder: (_, __, err) =>
                    _buildInitials(initials, effectiveFontSize),
              ),
            )
          : hasNetworkImage
              ? ClipOval(
                  child: Image.network(
                    networkUrl,
                    fit: BoxFit.cover,
                    width: size,
                    height: size,
                    errorBuilder: (_, __, err) =>
                        _buildInitials(initials, effectiveFontSize),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return _buildInitials(initials, effectiveFontSize);
                    },
                  ),
                )
              : _buildInitials(initials, effectiveFontSize),
    );
  }

  Widget _buildInitials(String initials, double textSize) {
    return Center(
      child: Text(
        initials,
        style: GoogleFonts.cinzel(
          fontSize: textSize,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  /// Extract up to 2 initials from a full name
  static String _getInitials(String fullName) {
    if (fullName.isEmpty) return '?';
    final parts = fullName.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return fullName.substring(0, fullName.length >= 2 ? 2 : 1).toUpperCase();
  }
}
