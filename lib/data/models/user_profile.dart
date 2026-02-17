/// Stores user profile information for the portfolio app.
library;

/// ═══════════════════════════════════════════════════════════════════════════
/// 👤 USER PROFILE MODEL
/// ═══════════════════════════════════════════════════════════════════════════

class UserProfile {
  String id;
  String fullName;
  String bio;
  String email;
  String phone;
  String? profileImageUrl;
  String? localProfileImagePath;
  List<String> skills;
  List<String> hobbies;
  List<String> interests;
  Map<String, String> socialLinks;

  UserProfile({
    required this.id,
    required this.fullName,
    required this.bio,
    required this.email,
    required this.phone,
    this.profileImageUrl,
    this.localProfileImagePath,
    List<String>? skills,
    List<String>? hobbies,
    List<String>? interests,
    Map<String, String>? socialLinks,
  })  : skills = skills ?? [],
        hobbies = hobbies ?? [],
        interests = interests ?? [],
        socialLinks = socialLinks ?? {};

  /// Returns true if the user has a profile image (either local or network)
  bool get hasProfileImage =>
      (localProfileImagePath != null && localProfileImagePath!.isNotEmpty) ||
      (profileImageUrl != null && profileImageUrl!.isNotEmpty);

  /// Copy with updated values
  UserProfile copyWith({
    String? id,
    String? fullName,
    String? bio,
    String? email,
    String? phone,
    String? profileImageUrl,
    String? localProfileImagePath,
    bool clearLocalImage = false,
    List<String>? skills,
    List<String>? hobbies,
    List<String>? interests,
    Map<String, String>? socialLinks,
  }) {
    return UserProfile(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      localProfileImagePath: clearLocalImage
          ? null
          : (localProfileImagePath ?? this.localProfileImagePath),
      skills: skills ?? List.from(this.skills),
      hobbies: hobbies ?? List.from(this.hobbies),
      interests: interests ?? List.from(this.interests),
      socialLinks: socialLinks ?? Map.from(this.socialLinks),
    );
  }

  /// Default profile data
  static UserProfile get defaultProfile => UserProfile(
        id: 'default_user',
        fullName: 'Marwin John Gonzales',
        bio: 'Full Stack Developer & UI/UX Designer passionate about creating '
            'immersive digital experiences. Specializing in Flutter, React, '
            'and modern web technologies.',
        email: 'marwinjohngonzales@gmail.com',
        phone: '+63 9687002559',
        profileImageUrl: null,
        skills: [
          'Flutter',
          'Dart',
          'React',
          'TypeScript',
          'Node.js',
          'Python',
          'UI/UX Design',
          'Figma',
        ],
        hobbies: [
          'Coding',
          'Gaming',
          'Photography',
          'Music',
        ],
        interests: [
          'Mobile Development',
          'Web Technologies',
          'AI/ML',
          'Creative Tech',
        ],
        socialLinks: {
          'LinkedIn': 'https://www.linkedin.com/in/marwin-john-gonzales-a38509322/',
          'GitHub': 'https://github.com/lMarul',
          'Email': 'mailto:marwinjohngonzales@gmail.com',
          'Facebook': 'https://www.facebook.com/marwin.john.gonzales.2024',
          'Instagram': 'https://instagram.com/maruwinu',
        },
      );

  /// Convert to JSON map
  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'bio': bio,
        'email': email,
        'phone': phone,
        'profileImageUrl': profileImageUrl,
        'localProfileImagePath': localProfileImagePath,
        'skills': skills,
        'hobbies': hobbies,
        'interests': interests,
        'socialLinks': socialLinks,
      };

  /// Create from JSON map
  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json['id'] as String,
        fullName: json['fullName'] as String,
        bio: json['bio'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String,
        profileImageUrl: json['profileImageUrl'] as String?,
        localProfileImagePath: json['localProfileImagePath'] as String?,
        skills: List<String>.from(json['skills'] ?? []),
        hobbies: List<String>.from(json['hobbies'] ?? []),
        interests: List<String>.from(json['interests'] ?? []),
        socialLinks: Map<String, String>.from(json['socialLinks'] ?? {}),
      );
}
