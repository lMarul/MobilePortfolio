import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/theme_extensions.dart';
import '../../../data/models/friend.dart';
import '../../../data/providers/user_providers.dart';
import '../../widgets/common/glass_card.dart';
import '../../widgets/effects/floating_orbs.dart';
import '../../widgets/layout/ultimate_background.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// ➕ ADD/EDIT FRIEND SCREEN
/// ═══════════════════════════════════════════════════════════════════════════
/// Form to add a new friend or edit an existing one with validation.

class AddEditFriendScreen extends ConsumerStatefulWidget {
  const AddEditFriendScreen({super.key, this.friend});

  /// If provided, we're editing this friend. Otherwise, we're adding a new one.
  final Friend? friend;

  @override
  ConsumerState<AddEditFriendScreen> createState() =>
      _AddEditFriendScreenState();
}

class _AddEditFriendScreenState extends ConsumerState<AddEditFriendScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _notesController;

  bool _hasChanges = false;

  bool get _isEditing => widget.friend != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.friend?.name ?? '');
    _emailController = TextEditingController(text: widget.friend?.email ?? '');
    _phoneController = TextEditingController(text: widget.friend?.phone ?? '');
    _notesController = TextEditingController(text: widget.friend?.notes ?? '');

    // Listen for changes
    _nameController.addListener(_onFieldChanged);
    _emailController.addListener(_onFieldChanged);
    _phoneController.addListener(_onFieldChanged);
    _notesController.addListener(_onFieldChanged);
  }

  void _onFieldChanged() {
    if (!_hasChanges) {
      setState(() => _hasChanges = true);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  /// Show confirmation dialog before saving
  Future<void> _showSaveConfirmation() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => _buildAlertDialog(
        title: _isEditing ? 'Update Friend' : 'Add Friend',
        content: _isEditing
            ? 'Are you sure you want to save the changes to this friend?'
            : 'Are you sure you want to add this friend to your list?',
        confirmText: _isEditing ? 'Update' : 'Add',
        confirmColor: AppColors.neonGreen,
        icon: _isEditing ? LucideIcons.save : LucideIcons.userPlus,
      ),
    );

    if (result == true) {
      _saveFriend();
    }
  }

  /// Save or update friend
  void _saveFriend() {
    final notifier = ref.read(friendsProvider.notifier);

    if (_isEditing) {
      // Update existing friend
      final updatedFriend = widget.friend!.copyWith(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim().isEmpty
            ? null
            : _phoneController.text.trim(),
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
      );
      notifier.updateFriend(updatedFriend);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(LucideIcons.checkCircle, color: Colors.white),
              SizedBox(width: 12),
              Text('Friend updated successfully!'),
            ],
          ),
          backgroundColor: AppColors.neonGreen,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    } else {
      // Add new friend
      final newFriend = Friend(
        id: notifier.generateId(),
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim().isEmpty
            ? null
            : _phoneController.text.trim(),
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
      );
      notifier.addFriend(newFriend);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(LucideIcons.userPlus, color: Colors.white),
              SizedBox(width: 12),
              Text('Friend added successfully!'),
            ],
          ),
          backgroundColor: AppColors.neonGreen,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    }

    // Navigate back using Navigator.pop
    Navigator.pop(context);
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
          Navigator.pop(context);
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
                            Navigator.pop(context);
                          }
                        } else {
                          Navigator.pop(context);
                        }
                      },
                    ),
                    title: Text(
                      _isEditing ? 'Edit Friend' : 'Add Friend',
                      style: TextStyle(
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    centerTitle: true,
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
                            // Avatar Preview
                            Center(
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  gradient: cyberpunk.primaryGradient,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: cyberpunk.neonPrimary
                                          .withValues(alpha: 0.4),
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    _nameController.text.isNotEmpty
                                        ? _nameController.text[0].toUpperCase()
                                        : '?',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ).animate().fadeIn(duration: 400.ms).scale(),

                            const SizedBox(height: 32),

                            // Name Field
                            _buildTextField(
                              controller: _nameController,
                              label: 'Name *',
                              hint: 'Enter friend\'s name',
                              icon: LucideIcons.user,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Name is required';
                                }
                                if (value.trim().length < 2) {
                                  return 'Name must be at least 2 characters';
                                }
                                return null;
                              },
                              cyberpunk: cyberpunk,
                              isDark: isDark,
                              onChanged: (_) => setState(() {}),
                            ).animate().fadeIn(duration: 400.ms, delay: 100.ms),

                            const SizedBox(height: 16),

                            // Email Field
                            _buildTextField(
                              controller: _emailController,
                              label: 'Email *',
                              hint: 'friend@example.com',
                              icon: LucideIcons.mail,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Email is required';
                                }
                                final emailRegex =
                                    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                if (!emailRegex.hasMatch(value.trim())) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              cyberpunk: cyberpunk,
                              isDark: isDark,
                            ).animate().fadeIn(duration: 400.ms, delay: 150.ms),

                            const SizedBox(height: 16),

                            // Phone Field (Optional)
                            _buildTextField(
                              controller: _phoneController,
                              label: 'Phone (Optional)',
                              hint: '+63 912 345 6789',
                              icon: LucideIcons.phone,
                              keyboardType: TextInputType.phone,
                              validator: (value) => null, // Optional field
                              cyberpunk: cyberpunk,
                              isDark: isDark,
                            ).animate().fadeIn(duration: 400.ms, delay: 200.ms),

                            const SizedBox(height: 16),

                            // Notes Field (Optional)
                            _buildTextField(
                              controller: _notesController,
                              label: 'Notes (Optional)',
                              hint: 'How do you know this person?',
                              icon: LucideIcons.stickyNote,
                              maxLines: 3,
                              validator: (value) => null, // Optional field
                              cyberpunk: cyberpunk,
                              isDark: isDark,
                            ).animate().fadeIn(duration: 400.ms, delay: 250.ms),

                            const SizedBox(height: 40),

                            // Save Button
                            _buildSaveButton(cyberpunk)
                                .animate()
                                .fadeIn(duration: 400.ms, delay: 300.ms)
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
    ValueChanged<String>? onChanged,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(4),
      borderRadius: 16,
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        onChanged: onChanged,
        style: TextStyle(
          color:
              isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _isEditing ? LucideIcons.save : LucideIcons.userPlus,
              color: Colors.white,
              size: 22,
            ),
            const SizedBox(width: 12),
            Text(
              _isEditing ? 'Update Friend' : 'Add Friend',
              style: const TextStyle(
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
