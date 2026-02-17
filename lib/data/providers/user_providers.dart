import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_profile.dart';
import '../models/friend.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 👤 USER PROFILE PROVIDER
/// ═══════════════════════════════════════════════════════════════════════════
/// Manages the user's profile state with CRUD operations.

class UserProfileNotifier extends Notifier<UserProfile> {
  @override
  UserProfile build() {
    return UserProfile.defaultProfile;
  }

  /// Update the entire profile
  void updateProfile(UserProfile profile) {
    state = profile;
  }

  /// Update specific fields
  void updateFields({
    String? fullName,
    String? bio,
    String? email,
    String? phone,
    String? profileImageUrl,
    String? localProfileImagePath,
    List<String>? skills,
    List<String>? hobbies,
    List<String>? interests,
  }) {
    state = state.copyWith(
      fullName: fullName,
      bio: bio,
      email: email,
      phone: phone,
      profileImageUrl: profileImageUrl,
      localProfileImagePath: localProfileImagePath,
      skills: skills,
      hobbies: hobbies,
      interests: interests,
    );
  }

  /// Add a skill
  void addSkill(String skill) {
    if (!state.skills.contains(skill)) {
      state = state.copyWith(skills: [...state.skills, skill]);
    }
  }

  /// Remove a skill
  void removeSkill(String skill) {
    state = state.copyWith(
      skills: state.skills.where((s) => s != skill).toList(),
    );
  }

  /// Reset to default profile
  void resetProfile() {
    state = UserProfile.defaultProfile;
  }
}

final userProfileProvider =
    NotifierProvider<UserProfileNotifier, UserProfile>(UserProfileNotifier.new);

/// ═══════════════════════════════════════════════════════════════════════════
/// 👥 FRIENDS LIST PROVIDER
/// ═══════════════════════════════════════════════════════════════════════════
/// Manages the friends list with CRUD operations.

class FriendsNotifier extends Notifier<List<Friend>> {
  @override
  List<Friend> build() {
    return Friend.sampleFriends;
  }

  /// Add a new friend
  void addFriend(Friend friend) {
    state = [...state, friend];
  }

  /// Update an existing friend
  void updateFriend(Friend updatedFriend) {
    state = state.map((friend) {
      if (friend.id == updatedFriend.id) {
        return updatedFriend;
      }
      return friend;
    }).toList();
  }

  /// Delete a friend by ID
  void deleteFriend(String id) {
    state = state.where((friend) => friend.id != id).toList();
  }

  /// Get a friend by ID
  Friend? getFriendById(String id) {
    try {
      return state.firstWhere((friend) => friend.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Generate a new unique ID
  String generateId() {
    final maxId = state.fold<int>(0, (max, friend) {
      final id = int.tryParse(friend.id) ?? 0;
      return id > max ? id : max;
    });
    return (maxId + 1).toString();
  }

  /// Clear all friends
  void clearAll() {
    state = [];
  }

  /// Reset to sample friends
  void resetToSample() {
    state = Friend.sampleFriends;
  }
}

final friendsProvider =
    NotifierProvider<FriendsNotifier, List<Friend>>(FriendsNotifier.new);
