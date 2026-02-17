import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🚀 PROJECT MODEL
/// ═══════════════════════════════════════════════════════════════════════════
/// Portfolio project model:
/// - _id: string
/// - _creationTime: number
/// - title: string
/// - category: string
/// - description: string
/// - thumbnail: string
/// - gallery?: string[]
/// - tags: string[]
/// - date: string
/// - links: { github?: string, demo?: string, live?: string }
/// - createdAt: number

@freezed
sealed class ProjectLinks with _$ProjectLinks {
  const factory ProjectLinks({
    String? github,
    String? demo,
    String? live,
  }) = _ProjectLinks;

  factory ProjectLinks.fromJson(Map<String, dynamic> json) =>
      _$ProjectLinksFromJson(json);
}

@freezed
sealed class Project with _$Project {
  const factory Project({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: '_creationTime') required double creationTime,
    required String title,
    required String category,
    required String description,
    required String thumbnail,
    List<String>? gallery,
    @Default([]) List<String> tags,
    required String date,
    required ProjectLinks links,
    int? createdAt,
    // Keep for backwards compatibility with UI
    @Default(false) bool isFeatured,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  static List<Project> get fallback => [
        const Project(
          id: 'project-1',
          creationTime: 0,
          title: 'APC Gym Log System',
          description:
              'A gym management system for tracking gym usage and member progress.',
          thumbnail: 'assets/images/projects/apc_gym_log/dashboard.png',
          tags: ['Flutter', 'Firebase', 'Dart'],
          category: 'Full Stack',
          date: 'January 2024',
          links: ProjectLinks(github: 'https://github.com'),
          isFeatured: true,
        ),
        const Project(
          id: 'project-2',
          creationTime: 0,
          title: 'APC Honors Checker',
          description:
              'Academic management tool for checking honor roll eligibility and GPA calculations.',
          thumbnail: 'assets/images/projects/apc_honors_checker/dashboard.png',
          tags: ['Flutter', 'Dart', 'Mobile'],
          category: 'Mobile App',
          date: 'December 2023',
          links: ProjectLinks(github: 'https://github.com'),
          isFeatured: true,
        ),
        const Project(
          id: 'project-3',
          creationTime: 0,
          title: 'Certificate Generator',
          description:
              'Automated certificate generation system for events and training programs.',
          thumbnail: 'assets/images/projects/certificate_generator/dashboard.png',
          tags: ['Python', 'Automation', 'PDF'],
          category: 'Automation',
          date: 'November 2023',
          links: ProjectLinks(github: 'https://github.com'),
          isFeatured: false,
        ),
        const Project(
          id: 'project-4',
          creationTime: 0,
          title: 'School Portal',
          description:
              'School management portal for students, teachers, and administrators.',
          thumbnail: 'assets/images/projects/school_portal/dashboard.png',
          tags: ['React', 'Node.js', 'MongoDB'],
          category: 'Full Stack',
          date: 'October 2023',
          links: ProjectLinks(github: 'https://github.com'),
          isFeatured: true,
        ),
      ];
}
