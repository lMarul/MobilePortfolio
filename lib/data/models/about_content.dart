import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_content.freezed.dart';
part 'about_content.g.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 👤 ABOUT CONTENT MODEL
/// ═══════════════════════════════════════════════════════════════════════════
/// Matches Convex aboutContent table schema
/// 
/// Actual Convex fields: title, subtitle, bio (array), stats (object)

@freezed
sealed class AboutContent with _$AboutContent {
  const factory AboutContent({
    @JsonKey(name: '_id') String? id,
    String? title,
    String? subtitle,
    @Default([]) List<String> paragraphs,
    String? imageUrl,
    @Default([]) List<AboutHighlight> highlights,
    /// Stats from Convex is a map like {projects: "10+", technologies: "5+"}
    Map<String, dynamic>? stats,
  }) = _AboutContent;

  factory AboutContent.fromJson(Map<String, dynamic> json) =>
      _$AboutContentFromJson(json);
  
  /// Parse Convex response which has bio as array instead of paragraphs
  static AboutContent fromConvex(Map<String, dynamic> json) {
    // Handle bio as either string or list
    final rawBio = json['bio'];
    List<String> paragraphsList = [];
    if (rawBio is String) {
      paragraphsList = [rawBio];
    } else if (rawBio is List) {
      paragraphsList = rawBio.map((e) => e.toString()).toList();
    }
    
    // Check if paragraphs already exists
    final rawParagraphs = json['paragraphs'];
    if (rawParagraphs is List && rawParagraphs.isNotEmpty) {
      paragraphsList = rawParagraphs.map((e) => e.toString()).toList();
    }
    
    return AboutContent(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      paragraphs: paragraphsList,
      imageUrl: json['imageUrl'] as String?,
      highlights: (json['highlights'] as List?)
          ?.map((e) => AboutHighlight.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
      stats: json['stats'] as Map<String, dynamic>?,
    );
  }

  static AboutContent get fallback => const AboutContent(
        id: 'fallback',
        title: 'Passionate Web Developer & Cybersecurity Enthusiast',
        subtitle: 'A passionate developer on a mission to create extraordinary digital experiences',
        paragraphs: [
          'With rich experiences in web development from various projects, I am still eager to learn more about other languages, frameworks, and technologies that I can use to create more innovative solutions.',
          "I'm passionate about exploring new technologies, especially in web development and cybersecurity, constantly pushing the boundaries of what's possible.",
        ],
        imageUrl: '',
        highlights: [],
        stats: {'projects': '10+', 'technologies': '5+', 'curiosity': '∞'},
      );
}

@freezed
sealed class AboutHighlight with _$AboutHighlight {
  const factory AboutHighlight({
    String? icon,
    String? title,
    String? value,
    String? description,
    String? color,
  }) = _AboutHighlight;

  factory AboutHighlight.fromJson(Map<String, dynamic> json) =>
      _$AboutHighlightFromJson(json);
}

@freezed
sealed class AboutStat with _$AboutStat {
  const factory AboutStat({
    required String label,
    required String value,
  }) = _AboutStat;

  factory AboutStat.fromJson(Map<String, dynamic> json) =>
      _$AboutStatFromJson(json);
}
