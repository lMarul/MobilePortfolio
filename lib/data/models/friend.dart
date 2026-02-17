/// Stores friend information for the friends list feature.
library;

/// ═══════════════════════════════════════════════════════════════════════════
/// 👥 FRIEND MODEL
/// ═══════════════════════════════════════════════════════════════════════════

class Friend {
  String id;
  String name;
  String email;
  String? phone;
  String? avatarUrl;
  String? notes;
  DateTime createdAt;

  Friend({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.avatarUrl,
    this.notes,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  /// Copy with updated values
  Friend copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? avatarUrl,
    String? notes,
    DateTime? createdAt,
  }) {
    return Friend(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  /// Convert to JSON map
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'avatarUrl': avatarUrl,
        'notes': notes,
        'createdAt': createdAt.toIso8601String(),
      };

  /// Create from JSON map
  factory Friend.fromJson(Map<String, dynamic> json) => Friend(
        id: json['id'] as String,
        name: json['name'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String?,
        avatarUrl: json['avatarUrl'] as String?,
        notes: json['notes'] as String?,
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'] as String)
            : DateTime.now(),
      );

  /// Sample friends list for initial data
  static List<Friend> get sampleFriends => [
        Friend(
          id: '1',
          name: 'Juan Dela Cruz',
          email: 'juan@example.com',
          phone: '+63 912 111 2222',
          notes: 'College friend from CS department',
        ),
        Friend(
          id: '2',
          name: 'Maria Santos',
          email: 'maria@example.com',
          phone: '+63 912 333 4444',
          notes: 'Work colleague at tech company',
        ),
        Friend(
          id: '3',
          name: 'Pedro Garcia',
          email: 'pedro@example.com',
          notes: 'Met at a hackathon',
        ),
      ];
}
