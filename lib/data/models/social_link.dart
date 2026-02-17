import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_link.freezed.dart';
part 'social_link.g.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🔗 SOCIAL LINK MODEL
/// ═══════════════════════════════════════════════════════════════════════════
/// Matches Convex socialLinks table schema
/// 
/// Actual Convex fields: platform, label, url, color, isActive, order

@freezed
sealed class SocialLink with _$SocialLink {
  const factory SocialLink({
    @JsonKey(name: '_id') String? id,
    String? platform,
    String? name,
    String? url,
    String? href,
    String? icon,
    String? username,
    String? label,
    String? color,
    bool? isActive,
    double? order,
    @JsonKey(name: '_creationTime') double? creationTime,
  }) = _SocialLink;

  factory SocialLink.fromJson(Map<String, dynamic> json) =>
      _$SocialLinkFromJson(json);

  static List<SocialLink> get fallback => const [
        SocialLink(
          id: '1',
          platform: 'linkedin',
          label: 'LinkedIn',
          url: 'https://www.linkedin.com/in/marwin-john-gonzales-a38509322/',
          icon: 'linkedin',
          color: '#0077b5',
        ),
        SocialLink(
          id: '2',
          platform: 'github',
          label: 'GitHub',
          url: 'https://github.com/lMarul',
          icon: 'github',
          color: '#333',
        ),
        SocialLink(
          id: '3',
          platform: 'email',
          label: 'Email',
          url: 'mailto:marwinjohngonzales@gmail.com',
          icon: 'email',
          color: '#ea4335',
        ),
        SocialLink(
          id: '4',
          platform: 'facebook',
          label: 'Facebook',
          url: 'https://www.facebook.com/marwin.john.gonzales.2024',
          icon: 'facebook',
          color: '#1877F2',
        ),
        SocialLink(
          id: '5',
          platform: 'instagram',
          label: 'Instagram',
          url: 'https://instagram.com/maruwinu',
          icon: 'instagram',
          color: '#E4405F',
        ),
      ];
}
