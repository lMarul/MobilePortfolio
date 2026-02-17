import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/theme_extensions.dart';
import '../../../data/providers/user_providers.dart';
import '../../widgets/common/glass_card.dart';
import '../../widgets/common/profile_avatar.dart';
import '../../widgets/layout/ultimate_background.dart';
import '../../widgets/effects/floating_orbs.dart';
import 'custom_crop_screen.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// ✏️ EDIT PROFILE SCREEN
/// ═══════════════════════════════════════════════════════════════════════════
/// Form to edit user profile with validation and alert dialogs.

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _bioController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _skillsController;
  late TextEditingController _hobbiesController;
  late TextEditingController _interestsController;

  bool _hasChanges = false;
  File? _pickedImage;
  final _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    final profile = ref.read(userProfileProvider);
    _nameController = TextEditingController(text: profile.fullName);
    _bioController = TextEditingController(text: profile.bio);
    _emailController = TextEditingController(text: profile.email);
    _phoneController = TextEditingController(text: profile.phone);
    _skillsController =
        TextEditingController(text: profile.skills.join(', '));
    _hobbiesController =
        TextEditingController(text: profile.hobbies.join(', '));
    _interestsController =
        TextEditingController(text: profile.interests.join(', '));

    // Restore previously saved profile image
    if (!kIsWeb &&
        profile.localProfileImagePath != null &&
        profile.localProfileImagePath!.isNotEmpty) {
      final savedFile = File(profile.localProfileImagePath!);
      if (savedFile.existsSync()) {
        _pickedImage = savedFile;
      }
    }

    // Listen for changes
    _nameController.addListener(_onFieldChanged);
    _bioController.addListener(_onFieldChanged);
    _emailController.addListener(_onFieldChanged);
    _phoneController.addListener(_onFieldChanged);
    _skillsController.addListener(_onFieldChanged);
    _hobbiesController.addListener(_onFieldChanged);
    _interestsController.addListener(_onFieldChanged);
  }

  void _onFieldChanged() {
    if (!_hasChanges) {
      setState(() => _hasChanges = true);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _skillsController.dispose();
    _hobbiesController.dispose();
    _interestsController.dispose();
    super.dispose();
  }

  /// Show image source picker (camera or gallery)
  Future<void> _pickProfileImage() async {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      backgroundColor: isDark ? AppColors.darkCard : AppColors.lightCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choose Photo Source',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryRed.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(LucideIcons.camera, color: AppColors.primaryRed),
                ),
                title: Text('Camera', style: TextStyle(
                  color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary)),
                subtitle: Text('Take a new photo', style: TextStyle(
                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary)),
                onTap: () => Navigator.pop(ctx, ImageSource.camera),
              ),
              const SizedBox(height: 8),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primaryRed.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(LucideIcons.image, color: AppColors.primaryRed),
                ),
                title: Text('Gallery', style: TextStyle(
                  color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary)),
                subtitle: Text('Choose from gallery', style: TextStyle(
                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary)),
                onTap: () => Navigator.pop(ctx, ImageSource.gallery),
              ),
            ],
          ),
        ),
      ),
    );

    if (source == null) return;

    final picked = await _imagePicker.pickImage(
      source: source,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 95,
    );

    if (picked != null) {
      // On web, image cropper doesn't work reliably, so use the picked image directly
      if (kIsWeb) {
        setState(() {
          _pickedImage = File(picked.path);
          _hasChanges = true;
        });
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Image cropping is not available on web. Image uploaded as-is.'),
            backgroundColor: AppColors.primaryRed,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
      } else {
        // Use Custom Crop Screen for better control over UI and button placement
        final File? croppedFile = await Navigator.push<File?>(
          context,
          MaterialPageRoute(
            builder: (context) => CustomCropScreen(imageFile: File(picked.path)),
          ),
        );

        if (croppedFile != null) {
          setState(() {
            _pickedImage = croppedFile;
            _hasChanges = true;
          });
        }
      }
    }
  }

  /// Show confirmation dialog before saving
  Future<void> _showSaveConfirmation() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => _buildAlertDialog(
        title: 'Save Changes',
        content: 'Are you sure you want to save these changes to your profile?',
        confirmText: 'Save',
        confirmColor: AppColors.neonGreen,
        icon: LucideIcons.save,
      ),
    );

    if (result == true) {
      _saveProfile();
    }
  }

  /// Save profile to provider
  void _saveProfile() {
    final profile = ref.read(userProfileProvider);

    final updatedProfile = profile.copyWith(
      fullName: _nameController.text.trim(),
      bio: _bioController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      skills: _parseCommaSeparated(_skillsController.text),
      hobbies: _parseCommaSeparated(_hobbiesController.text),
      interests: _parseCommaSeparated(_interestsController.text),
      // Save the picked image path so it persists across screens
      localProfileImagePath: _pickedImage?.path ?? profile.localProfileImagePath,
    );

    ref.read(userProfileProvider.notifier).updateProfile(updatedProfile);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(LucideIcons.checkCircle, color: Colors.white),
            SizedBox(width: 12),
            Text('Profile saved successfully!'),
          ],
        ),
        backgroundColor: AppColors.neonGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );

    // Navigate back
    if (mounted) context.pop();
  }

  /// Parse comma-separated string to list
  List<String> _parseCommaSeparated(String text) {
    return text
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();
  }

  /// Show delete confirmation dialog
  Future<void> _showDeleteConfirmation() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => _buildAlertDialog(
        title: 'Reset Profile',
        content:
            'Are you sure you want to reset your profile to default? This action cannot be undone.',
        confirmText: 'Reset',
        confirmColor: AppColors.primaryRed,
        icon: LucideIcons.trash2,
      ),
    );

    if (result == true) {
      ref.read(userProfileProvider.notifier).resetProfile();

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(LucideIcons.refreshCw, color: Colors.white),
              SizedBox(width: 12),
              Text('Profile reset to default'),
            ],
          ),
          backgroundColor: AppColors.primaryRed,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );

      if (!mounted) return;
      context.pop();
    }
  }

  /// Handle back navigation with unsaved changes
  Future<bool> _onWillPop() async {
    if (!_hasChanges) return true;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => _buildAlertDialog(
        title: 'Discard Changes',
        content:
            'You have unsaved changes. Are you sure you want to discard them?',
        confirmText: 'Discard',
        confirmColor: AppColors.primaryRed,
        icon: LucideIcons.alertTriangle,
      ),
    );

    return result ?? false;
  }

  Widget _buildAlertDialog({
    required String title,
    required String content,
    required String confirmText,
    required Color confirmColor,
    required IconData icon,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AlertDialog(
      backgroundColor: isDark ? AppColors.darkCard : AppColors.lightCard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: confirmColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: confirmColor, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      content: Text(
        content,
        style: TextStyle(
          color: isDark
              ? AppColors.darkTextSecondary
              : AppColors.lightTextSecondary,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(
            'Cancel',
            style: TextStyle(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          style: ElevatedButton.styleFrom(
            backgroundColor: confirmColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(confirmText),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final cyberpunk = context.cyberpunk;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return PopScope(
      canPop: !_hasChanges,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldPop = await _onWillPop();
        if (shouldPop && context.mounted) {
          context.pop();
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            const UltimateBackground(),
            const FloatingOrbs(),
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
                      onPressed: () async {
                        if (_hasChanges) {
                          final shouldPop = await _onWillPop();
                          if (shouldPop && context.mounted) {
                            context.pop();
                          }
                        } else {
                          context.pop();
                        }
                      },
                    ),
                    title: Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    centerTitle: true,
                    actions: [
                      // Delete/Reset Button
                      IconButton(
                        icon: Icon(
                          LucideIcons.trash2,
                          color: AppColors.primaryRed,
                        ),
                        onPressed: _showDeleteConfirmation,
                      ),
                    ],
                  ),

                  // Form Content
                  SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverToBoxAdapter(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Profile Picture Picker
                            Center(
                              child: GestureDetector(
                                onTap: _pickProfileImage,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    ProfileAvatar(
                                      size: 110,
                                      showGlow: true,
                                      glowIntensity: 0.4,
                                      overrideImageFile: _pickedImage,
                                      overrideInitials: _nameController.text.isNotEmpty
                                          ? null
                                          : '?',
                                    ),
                                    Positioned(
                                      bottom: 2,
                                      right: 2,
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          gradient: AppColors.primaryGradient,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: isDark ? AppColors.surface : AppColors.lightSurface,
                                            width: 2.5,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.primaryRed.withValues(alpha: 0.4),
                                              blurRadius: 8,
                                              spreadRadius: -2,
                                            ),
                                          ],
                                        ),
                                        child: const Icon(
                                          LucideIcons.camera,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).animate().fadeIn(duration: 400.ms).scale(
                              begin: const Offset(0.8, 0.8),
                              end: const Offset(1, 1),
                            ),

                            const SizedBox(height: 10),
                            Center(
                              child: Text(
                                'Tap to change photo',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                                ),
                              ),
                            ),

                            const SizedBox(height: 28),

                            // Personal Info Section
                            _buildSectionTitle('Personal Information',
                                LucideIcons.user, cyberpunk, isDark)
                                .animate()
                                .fadeIn(duration: 400.ms),

                            const SizedBox(height: 16),

                            _buildTextField(
                              controller: _nameController,
                              label: 'Full Name',
                              hint: 'Enter your full name',
                              icon: LucideIcons.user,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Full name is required';
                                }
                                if (value.trim().length < 2) {
                                  return 'Name must be at least 2 characters';
                                }
                                return null;
                              },
                              cyberpunk: cyberpunk,
                              isDark: isDark,
                            ).animate().fadeIn(duration: 400.ms, delay: 50.ms),

                            const SizedBox(height: 16),

                            _buildTextField(
                              controller: _bioController,
                              label: 'Bio',
                              hint: 'Tell us about yourself',
                              icon: LucideIcons.fileText,
                              maxLines: 4,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Bio is required';
                                }
                                return null;
                              },
                              cyberpunk: cyberpunk,
                              isDark: isDark,
                            ).animate().fadeIn(duration: 400.ms, delay: 100.ms),

                            const SizedBox(height: 32),

                            // Contact Info Section
                            _buildSectionTitle('Contact Information',
                                LucideIcons.contact, cyberpunk, isDark)
                                .animate()
                                .fadeIn(duration: 400.ms, delay: 150.ms),

                            const SizedBox(height: 16),

                            _buildTextField(
                              controller: _emailController,
                              label: 'Email',
                              hint: 'your.email@example.com',
                              icon: LucideIcons.mail,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Email is required';
                                }
                                final emailRegex = RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                if (!emailRegex.hasMatch(value.trim())) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              cyberpunk: cyberpunk,
                              isDark: isDark,
                            ).animate().fadeIn(duration: 400.ms, delay: 200.ms),

                            const SizedBox(height: 16),

                            _buildTextField(
                              controller: _phoneController,
                              label: 'Phone',
                              hint: '+63 912 345 6789',
                              icon: LucideIcons.phone,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Phone number is required';
                                }
                                return null;
                              },
                              cyberpunk: cyberpunk,
                              isDark: isDark,
                            ).animate().fadeIn(duration: 400.ms, delay: 250.ms),

                            const SizedBox(height: 32),

                            // Skills Section
                            _buildSectionTitle('Skills & Interests',
                                LucideIcons.code2, cyberpunk, isDark)
                                .animate()
                                .fadeIn(duration: 400.ms, delay: 300.ms),

                            const SizedBox(height: 16),

                            _buildTextField(
                              controller: _skillsController,
                              label: 'Skills',
                              hint: 'Flutter, Dart, React (comma-separated)',
                              icon: LucideIcons.code2,
                              validator: (value) => null,
                              cyberpunk: cyberpunk,
                              isDark: isDark,
                            ).animate().fadeIn(duration: 400.ms, delay: 350.ms),

                            const SizedBox(height: 16),

                            _buildTextField(
                              controller: _hobbiesController,
                              label: 'Hobbies',
                              hint: 'Coding, Gaming, Music (comma-separated)',
                              icon: LucideIcons.heart,
                              validator: (value) => null,
                              cyberpunk: cyberpunk,
                              isDark: isDark,
                            ).animate().fadeIn(duration: 400.ms, delay: 400.ms),

                            const SizedBox(height: 16),

                            _buildTextField(
                              controller: _interestsController,
                              label: 'Interests',
                              hint: 'AI/ML, Web Dev (comma-separated)',
                              icon: LucideIcons.sparkles,
                              validator: (value) => null,
                              cyberpunk: cyberpunk,
                              isDark: isDark,
                            ).animate().fadeIn(duration: 400.ms, delay: 450.ms),

                            const SizedBox(height: 40),

                            // Save Button
                            _buildSaveButton(cyberpunk)
                                .animate()
                                .fadeIn(duration: 400.ms, delay: 500.ms)
                                .slideY(begin: 0.2, end: 0),

                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
      String title, IconData icon, CyberpunkTheme cyberpunk, bool isDark) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: cyberpunk.neonPrimary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: cyberpunk.neonPrimary, size: 20),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color:
                isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required String? Function(String?) validator,
    required CyberpunkTheme cyberpunk,
    required bool isDark,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(4),
      borderRadius: 16,
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: TextStyle(
          color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
        ),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon, color: cyberpunk.neonPrimary),
          labelStyle: TextStyle(
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ),
          hintStyle: TextStyle(
            color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: cyberpunk.neonPrimary, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primaryRed, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primaryRed, width: 2),
          ),
          filled: true,
          fillColor: (isDark ? AppColors.darkSurface : AppColors.lightSurface)
              .withValues(alpha: 0.5),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildSaveButton(CyberpunkTheme cyberpunk) {
    return InkWell(
      onTap: _showSaveConfirmation,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          gradient: cyberpunk.primaryGradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: cyberpunk.neonPrimary.withValues(alpha: 0.4),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(LucideIcons.save, color: Colors.white, size: 22),
            SizedBox(width: 12),
            Text(
              'Save Changes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
