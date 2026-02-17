import 'package:freezed_annotation/freezed_annotation.dart';

part 'hackathon.freezed.dart';
part 'hackathon.g.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🏆 HACKATHON MODEL
/// ═══════════════════════════════════════════════════════════════════════════
/// Matches Convex hackathons table schema:
/// - _id: string
/// - _creationTime: number
/// - title: string
/// - organizer: string
/// - description: string
/// - date: string
/// - thumbnail: string
/// - gallery: string[] (min 4 images)
/// - tags: string[]
/// - links: { github?: string, demo?: string, social?: string }

@freezed
sealed class HackathonLinks with _$HackathonLinks {
  const factory HackathonLinks({
    String? github,
    String? demo,
    String? social,
  }) = _HackathonLinks;

  factory HackathonLinks.fromJson(Map<String, dynamic> json) =>
      _$HackathonLinksFromJson(json);
}

@freezed
sealed class Hackathon with _$Hackathon {
  const factory Hackathon({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: '_creationTime') required double creationTime,
    required String title,
    required String organizer,
    required String description,
    required String date,
    required String thumbnail,
    @Default([]) List<String> gallery,
    @Default([]) List<String> tags,
    required HackathonLinks links,
  }) = _Hackathon;

  factory Hackathon.fromJson(Map<String, dynamic> json) =>
      _$HackathonFromJson(json);

  static List<Hackathon> get fallback => [
        const Hackathon(
          id: 'hackathon-1',
          creationTime: 0,
          title: 'Fire Detection System',
          description:
              'An intelligent fire detection and system using IoT sensors and monitoring for enhanced safety.',
          date: 'March 2024',
          organizer: 'Tech Innovation Challenge',
          thumbnail: 'assets/images/hackathons/fire_detection/dashboard.png',
          gallery: ['assets/images/hackathons/fire_detection/dashboard.png'],
          tags: ['IoT', 'Arduino', 'Sensors', 'Real-time'],
          links: HackathonLinks(github: 'https://github.com'),
        ),
        const Hackathon(
          id: 'hackathon-2',
          creationTime: 0,
          title: 'Jypsis',
          description:
              'A comprehensive cinema ticketing system designed to effectively enhance efficiency.',
          date: 'February 2024',
          organizer: 'Innovation Summit',
          thumbnail: 'assets/images/hackathons/jypsis/dashboard.png',
          gallery: ['assets/images/hackathons/jypsis/dashboard.png'],
          tags: ['Web Development', 'Business', 'Innovation'],
          links: HackathonLinks(github: 'https://github.com'),
        ),
      ];
}
