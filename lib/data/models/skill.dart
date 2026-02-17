import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill.freezed.dart';
part 'skill.g.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🛠️ SKILL MODEL
/// ═══════════════════════════════════════════════════════════════════════════
/// Skills displayed in the portfolio.
/// Edit the fallback data below to update your skills.

@freezed
sealed class Skill with _$Skill {
  const factory Skill({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: '_creationTime') required double creationTime,
    required String name,
    required String category,
    @JsonKey(name: 'img') required String imageUrl,
  }) = _Skill;

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);
}

@freezed
sealed class SkillCategory with _$SkillCategory {
  const factory SkillCategory({
    required String name,
    required String icon,
    @Default([]) List<Skill> skills,
  }) = _SkillCategory;

  factory SkillCategory.fromJson(Map<String, dynamic> json) =>
      _$SkillCategoryFromJson(json);

  /// ═════════════════════════════════════════════════════════════════════════
  /// 📝 EDIT YOUR SKILLS HERE
  /// ═════════════════════════════════════════════════════════════════════════
  /// To add/remove skills, just edit this list.
  /// imageUrl can use devicon CDN: https://cdn.jsdelivr.net/gh/devicons/devicon/icons/{name}/{name}-original.svg
  
  static List<SkillCategory> get fallback => [
        const SkillCategory(
          name: 'Frontend',
          icon: '🎨',
          skills: [
            Skill(id: 's1', creationTime: 0, name: 'React', category: 'frontend',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/react/react-original.svg'),
            Skill(id: 's2', creationTime: 0, name: 'Next.js', category: 'frontend',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nextjs/nextjs-original.svg'),
            Skill(id: 's3', creationTime: 0, name: 'TypeScript', category: 'frontend',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg'),
            Skill(id: 's4', creationTime: 0, name: 'JavaScript', category: 'frontend',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg'),
            Skill(id: 's5', creationTime: 0, name: 'HTML5', category: 'frontend',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg'),
            Skill(id: 's6', creationTime: 0, name: 'CSS3', category: 'frontend',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/css3/css3-original.svg'),
            Skill(id: 's7', creationTime: 0, name: 'Tailwind', category: 'frontend',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/tailwindcss/tailwindcss-original.svg'),
          ],
        ),
        const SkillCategory(
          name: 'Backend',
          icon: '⚙️',
          skills: [
            Skill(id: 's8', creationTime: 0, name: 'Node.js', category: 'backend',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg'),
            Skill(id: 's9', creationTime: 0, name: 'Python', category: 'backend',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg'),
            Skill(id: 's10', creationTime: 0, name: 'Express', category: 'backend',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/express/express-original.svg'),
            Skill(id: 's11', creationTime: 0, name: 'MongoDB', category: 'backend',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mongodb/mongodb-original.svg'),
            Skill(id: 's12', creationTime: 0, name: 'PostgreSQL', category: 'backend',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postgresql/postgresql-original.svg'),
            Skill(id: 's13', creationTime: 0, name: 'Firebase', category: 'backend',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/firebase/firebase-plain.svg'),
          ],
        ),
        const SkillCategory(
          name: 'Frameworks',
          icon: '📦',
          skills: [
            Skill(id: 's14', creationTime: 0, name: 'Flutter', category: 'frameworks',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg'),
            Skill(id: 's15', creationTime: 0, name: 'Dart', category: 'frameworks',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/dart/dart-original.svg'),
            Skill(id: 's16', creationTime: 0, name: 'Vite', category: 'frameworks',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/vitejs/vitejs-original.svg'),
          ],
        ),
        const SkillCategory(
          name: 'Tools',
          icon: '🔧',
          skills: [
            Skill(id: 's17', creationTime: 0, name: 'Git', category: 'tools',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg'),
            Skill(id: 's18', creationTime: 0, name: 'GitHub', category: 'tools',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg'),
            Skill(id: 's19', creationTime: 0, name: 'VS Code', category: 'tools',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg'),
            Skill(id: 's20', creationTime: 0, name: 'Figma', category: 'tools',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/figma/figma-original.svg'),
            Skill(id: 's21', creationTime: 0, name: 'Linux', category: 'tools',
                imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg'),
          ],
        ),
      ];
}
