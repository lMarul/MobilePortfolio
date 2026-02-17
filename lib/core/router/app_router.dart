import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/friend.dart';
import '../../presentation/screens/certifications/all_certifications_screen.dart';
import '../../presentation/screens/experiences/all_experiences_screen.dart';
import '../../presentation/screens/friends/add_edit_friend_screen.dart';
import '../../presentation/screens/friends/friends_list_screen.dart';
import '../../presentation/screens/hackathons/all_hackathons_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/profile/edit_profile_screen.dart';
import '../../presentation/screens/profile/profile_screen.dart';
import '../../presentation/screens/projects/all_projects_screen.dart';
import '../../presentation/screens/auth/login_screen.dart';
import '../../presentation/screens/splash/beyond_loading_screen.dart';
import '../../presentation/screens/not_found/not_found_screen.dart';
import 'route_transitions.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🧭 APP ROUTER CONFIGURATION
/// ═══════════════════════════════════════════════════════════════════════════
/// GoRouter setup with deep linking and custom page transitions.

abstract final class AppRouter {
  // ═══════════════════════════════════════════════════════════════════════════
  // 📍 ROUTE PATHS
  // ═══════════════════════════════════════════════════════════════════════════

  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String editProfile = '/profile/edit';
  static const String friends = '/friends';
  static const String addFriend = '/friends/add';
  static const String projects = '/projects';
  static const String projectDetail = '/projects/:id';
  static const String experiences = '/experiences';
  static const String certifications = '/certifications';
  static const String hackathons = '/hackathons';

  // ═══════════════════════════════════════════════════════════════════════════
  // 🚀 ROUTER INSTANCE
  // ═══════════════════════════════════════════════════════════════════════════

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    debugLogDiagnostics: true,

    // Error handling
    errorBuilder: (context, state) => const NotFoundScreen(),

    // Routes
    routes: [
      // Splash Screen
      GoRoute(
        path: splash,
        name: 'splash',
        pageBuilder: (context, state) => RouteTransitions.fade(
          key: state.pageKey,
          child: const BeyondLoadingScreen(),
        ),
      ),

      // Login Screen
      GoRoute(
        path: login,
        name: 'login',
        pageBuilder: (context, state) => RouteTransitions.fade(
          key: state.pageKey,
          // TODO: Import LoginScreen
          child: const LoginScreen(), 
        ),
      ),

      // Home Screen
      GoRoute(
        path: home,
        name: 'home',
        pageBuilder: (context, state) => RouteTransitions.slideUp(
          key: state.pageKey,
          child: const HomeScreen(),
        ),
      ),

      // ... rest of routes ...
      // Profile Screen
      GoRoute(
        path: profile,
        name: 'profile',
        pageBuilder: (context, state) => RouteTransitions.slideLeft(
          key: state.pageKey,
          child: const ProfileScreen(),
        ),
        routes: [
          // Edit Profile
          GoRoute(
            path: 'edit',
            name: 'editProfile',
            pageBuilder: (context, state) => RouteTransitions.slideLeft(
              key: state.pageKey,
              child: const EditProfileScreen(),
            ),
          ),
        ],
      ),

      // Friends List
      GoRoute(
        path: friends,
        name: 'friends',
        pageBuilder: (context, state) => RouteTransitions.slideLeft(
          key: state.pageKey,
          child: const FriendsListScreen(),
        ),
        routes: [
          // Add / Edit Friend
          GoRoute(
            path: 'add',
            name: 'addFriend',
            pageBuilder: (context, state) => RouteTransitions.slideLeft(
              key: state.pageKey,
              child: AddEditFriendScreen(
                friend: state.extra as Friend?,
              ),
            ),
          ),
        ],
      ),

      // All Projects
      GoRoute(
        path: projects,
        name: 'projects',
        pageBuilder: (context, state) => RouteTransitions.slideLeft(
          key: state.pageKey,
          child: const AllProjectsScreen(),
        ),
        routes: [
          // Project Detail
          GoRoute(
            path: ':id',
            name: 'projectDetail',
            pageBuilder: (context, state) {
              final projectId = state.pathParameters['id'] ?? '';
              return RouteTransitions.scale(
                key: state.pageKey,
                // TODO: Replace with ProjectDetailScreen when implemented
                child: Scaffold(
                  body: Center(child: Text('Project: $projectId')),
                ),
              );
            },
          ),
        ],
      ),

      // All Experiences
      GoRoute(
        path: experiences,
        name: 'experiences',
        pageBuilder: (context, state) => RouteTransitions.slideLeft(
          key: state.pageKey,
          child: const AllExperiencesScreen(),
        ),
      ),

      // All Certifications
      GoRoute(
        path: certifications,
        name: 'certifications',
        pageBuilder: (context, state) => RouteTransitions.slideLeft(
          key: state.pageKey,
          child: const AllCertificationsScreen(),
        ),
      ),

      // All Hackathons
      GoRoute(
        path: hackathons,
        name: 'hackathons',
        pageBuilder: (context, state) => RouteTransitions.slideLeft(
          key: state.pageKey,
          child: const AllHackathonsScreen(),
        ),
      ),
    ],
  );
}
