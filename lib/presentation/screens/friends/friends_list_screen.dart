import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/theme_extensions.dart';
import '../../../data/models/friend.dart';
import '../../../data/providers/user_providers.dart';
import '../../widgets/common/glass_card.dart';
import '../../widgets/effects/floating_orbs.dart';
import '../../widgets/layout/ultimate_background.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 👥 FRIENDS LIST SCREEN
/// ═══════════════════════════════════════════════════════════════════════════
/// Displays list of friends with options to add, edit, and delete.

class FriendsListScreen extends ConsumerWidget {
  const FriendsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friends = ref.watch(friendsProvider);
    final cyberpunk = context.cyberpunk;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
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
                    onPressed: () => context.pop(),
                  ),
                  title: Text(
                    'Friends List',
                    style: TextStyle(
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                ),

                // Friends Count Header
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                  sliver: SliverToBoxAdapter(
                    child: GlassCard(
                      padding: const EdgeInsets.all(16),
                      borderRadius: 16,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color:
                                  cyberpunk.neonPrimary.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              LucideIcons.users,
                              color: cyberpunk.neonPrimary,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Friends',
                                style: TextStyle(
                                  color: isDark
                                      ? AppColors.darkTextSecondary
                                      : AppColors.lightTextSecondary,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '${friends.length}',
                                style: TextStyle(
                                  color: isDark
                                      ? AppColors.darkTextPrimary
                                      : AppColors.lightTextPrimary,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ).animate().fadeIn(duration: 500.ms),
                  ),
                ),

                // Friends List
                if (friends.isEmpty)
                  SliverFillRemaining(
                    child: _buildEmptyState(context, cyberpunk, isDark),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final friend = friends[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _buildFriendCard(
                              context,
                              ref,
                              friend,
                              cyberpunk,
                              isDark,
                            )
                                .animate()
                                .fadeIn(
                                  duration: 250.ms,
                                  delay: Duration(milliseconds: 40 * index),
                                )
                                .slideX(begin: 0.1, end: 0),
                          );
                        },
                        childCount: friends.length,
                      ),
                    ),
                  ),

                // Bottom Padding
                const SliverToBoxAdapter(
                  child: SizedBox(height: 100),
                ),
              ],
            ),
          ),
        ],
      ),
      // Floating Action Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push(AppRouter.addFriend);
        },
        backgroundColor: cyberpunk.neonPrimary,
        icon: const Icon(LucideIcons.userPlus, color: Colors.white),
        label: const Text(
          'Add Friend',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(
      BuildContext context, CyberpunkTheme cyberpunk, bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: cyberpunk.neonPrimary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              LucideIcons.userPlus,
              size: 64,
              color: cyberpunk.neonPrimary,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'No friends yet',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap the button below to add your first friend!',
            style: TextStyle(
              fontSize: 16,
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFriendCard(
    BuildContext context,
    WidgetRef ref,
    Friend friend,
    CyberpunkTheme cyberpunk,
    bool isDark,
  ) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      borderRadius: 20,
      child: Row(
        children: [
          // Avatar
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              gradient: cyberpunk.primaryGradient,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: cyberpunk.neonPrimary.withValues(alpha: 0.3),
                  blurRadius: 12,
                ),
              ],
            ),
            child: friend.avatarUrl != null
                ? ClipOval(
                    child: Image.network(
                      friend.avatarUrl!,
                      fit: BoxFit.cover,
                    ),
                  )
                : Center(
                    child: Text(
                      friend.name.isNotEmpty
                          ? friend.name[0].toUpperCase()
                          : '?',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),

          const SizedBox(width: 16),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  friend.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.lightTextPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      LucideIcons.mail,
                      size: 14,
                      color: cyberpunk.neonPrimary,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        friend.email,
                        style: TextStyle(
                          fontSize: 13,
                          color: isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.lightTextSecondary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                if (friend.phone != null && friend.phone!.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(
                        LucideIcons.phone,
                        size: 14,
                        color: cyberpunk.neonPrimary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        friend.phone!,
                        style: TextStyle(
                          fontSize: 13,
                          color: isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.lightTextSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          // Actions
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Edit Button
              IconButton(
                icon: Icon(
                  LucideIcons.edit,
                  color: cyberpunk.neonPrimary,
                  size: 20,
                ),
                onPressed: () {
                  context.push(AppRouter.addFriend, extra: friend);
                },
              ),
              // Delete Button
              IconButton(
                icon: const Icon(
                  LucideIcons.trash2,
                  color: AppColors.primaryRed,
                  size: 20,
                ),
                onPressed: () => _showDeleteConfirmation(context, ref, friend),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(
      BuildContext context, WidgetRef ref, Friend friend) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? AppColors.darkCard : AppColors.lightCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primaryRed.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                LucideIcons.alertTriangle,
                color: AppColors.primaryRed,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Delete Friend',
              style: TextStyle(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Text(
          'Are you sure you want to remove ${friend.name} from your friends list?',
          style: TextStyle(
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.lightTextSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
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
            onPressed: () {
              ref.read(friendsProvider.notifier).deleteFriend(friend.id);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(LucideIcons.trash2, color: Colors.white),
                      const SizedBox(width: 12),
                      Text('${friend.name} removed from friends'),
                    ],
                  ),
                  backgroundColor: AppColors.primaryRed,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryRed,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
