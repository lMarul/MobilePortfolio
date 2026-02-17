import 'package:freezed_annotation/freezed_annotation.dart';

part 'hero_content.freezed.dart';
part 'hero_content.g.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🦸 HERO CONTENT MODEL
/// ═══════════════════════════════════════════════════════════════════════════
/// Hero section content for the landing page

@freezed
sealed class HeroContent with _$HeroContent {
  const factory HeroContent({
    @JsonKey(name: '_id') String? id,
    String? title,
    String? subtitle,
    String? description,
    @Default([]) List<String> roles,
    String? ctaText,
    String? ctaLink,
    String? secondaryCtaText,
    String? secondaryCtaLink,
  }) = _HeroContent;

  factory HeroContent.fromJson(Map<String, dynamic> json) =>
      _$HeroContentFromJson(json);

  /// Default hero content
  static HeroContent get fallback => const HeroContent(
        id: 'fallback',
        title: 'MARWIN',
        subtitle: 'Full Stack Developer | UI/UX Designer | Creative Technologist',
        description:
            'Forging immersive digital realities where code meets chaos. Pushing the boundaries of web interaction.',
        roles: [
          'Full Stack Developer',
          'UI/UX Designer',
          'Creative Technologist',
        ],
        ctaText: 'Explore Projects',
        ctaLink: '#projects',
        secondaryCtaText: 'Contact Me',
        secondaryCtaLink: '#contact',
      );
}
