/// ═══════════════════════════════════════════════════════════════════════════
/// 📝 APP STRINGS & FALLBACK CONTENT
/// ═══════════════════════════════════════════════════════════════════════════
/// Static strings and fallback content when database is unavailable.
/// Matches the web portfolio's default content.
library;

abstract final class AppStrings {
  // ═══════════════════════════════════════════════════════════════════════════
  // 🏠 APP INFO
  // ═══════════════════════════════════════════════════════════════════════════

  static const String appName = "Marwin's Portfolio";
  static const String appTagline = 'Developer Portfolio';

  // ═══════════════════════════════════════════════════════════════════════════
  // 🦸 HERO SECTION (Fallback)
  // ═══════════════════════════════════════════════════════════════════════════

  static const String heroGreeting = 'Hello, I am';
  static const String heroName = 'Marwin John Gonzales';
  static const String heroTitle = 'Full-Stack Developer';
  static const String heroDescription =
      'Crafting digital experiences that push the boundaries of what\'s possible. '
      'Specializing in modern web technologies and creative coding.';

  static const List<String> heroRoles = [
    'Full-Stack Developer',
    'UI/UX Enthusiast',
    'Creative Technologist',
    'Problem Solver',
  ];

  // ═══════════════════════════════════════════════════════════════════════════
  // 👤 ABOUT SECTION (Fallback)
  // ═══════════════════════════════════════════════════════════════════════════

  static const String aboutTitle = 'About Me';
  static const String aboutBio =
      'I\'m a passionate developer with a love for creating beautiful, '
      'functional, and user-centered digital experiences. With expertise in '
      'both frontend and backend technologies, I bring ideas to life through '
      'clean code and thoughtful design.';

  // ═══════════════════════════════════════════════════════════════════════════
  // 📧 CONTACT SECTION
  // ═══════════════════════════════════════════════════════════════════════════

  static const String contactTitle = 'Get In Touch';
  static const String contactSubtitle = 'Let\'s build something amazing together';
  static const String contactCTA = 'Say Hello';

  // ═══════════════════════════════════════════════════════════════════════════
  // 🧭 NAVIGATION
  // ═══════════════════════════════════════════════════════════════════════════

  static const String navHome = 'Home';
  static const String navAbout = 'About';
  static const String navSkills = 'Skills';
  static const String navExperience = 'Experience';
  static const String navProjects = 'Projects';
  static const String navHackathons = 'Hackathons';
  static const String navCertifications = 'Certifications';
  static const String navContact = 'Contact';

  // ═══════════════════════════════════════════════════════════════════════════
  // 🔘 BUTTONS
  // ═══════════════════════════════════════════════════════════════════════════

  static const String viewAll = 'View All';
  static const String viewMore = 'View More';
  static const String viewProject = 'View Project';
  static const String viewLive = 'Live Demo';
  static const String viewCode = 'Source Code';
  static const String downloadResume = 'Download Resume';
  static const String sendMessage = 'Send Message';

  // ═══════════════════════════════════════════════════════════════════════════
  // ⏳ LOADING STATES
  // ═══════════════════════════════════════════════════════════════════════════

  static const String loading = 'Loading...';
  static const String loadingContent = 'Fetching content...';
  static const String loadingProjects = 'Loading projects...';

  // ═══════════════════════════════════════════════════════════════════════════
  // ❌ ERROR STATES
  // ═══════════════════════════════════════════════════════════════════════════

  static const String errorGeneric = 'Something went wrong';
  static const String errorNetwork = 'Please check your connection';
  static const String errorNotFound = 'Page not found';
  static const String errorRetry = 'Tap to retry';

  // ═══════════════════════════════════════════════════════════════════════════
  // 🏷️ SECTION TITLES
  // ═══════════════════════════════════════════════════════════════════════════

  static const String sectionSkills = 'Skills & Technologies';
  static const String sectionExperience = 'Experience';
  static const String sectionProjects = 'Featured Projects';
  static const String sectionHackathons = 'Hackathons';
  static const String sectionCertifications = 'Certifications';

  // ═══════════════════════════════════════════════════════════════════════════
  // 🔗 URLS (Fallback social links)
  // ═══════════════════════════════════════════════════════════════════════════

  static const String urlGitHub = 'https://github.com';
  static const String urlLinkedIn = 'https://linkedin.com';
  static const String urlTwitter = 'https://twitter.com';
  static const String urlEmail = 'mailto:hello@example.com';
}
