# 🏗️ Marwin's Portfolio - Flutter Mobile App

> **Premium Developer Portfolio** — Cyberpunk-themed mobile portfolio built with Flutter

A stunning, high-performance mobile portfolio application featuring glassmorphism effects, custom animations, and a modern cyberpunk aesthetic. Built with Flutter for cross-platform compatibility (iOS, Android, Web).

---

## ✨ Features

- 🎨 **Cyberpunk Aesthetic** - Glassmorphism, gradient borders, and neon accents
- 🌙 **Dark/Light Themes** - Seamless theme switching with custom color palettes
- ⚡ **Smooth Animations** - 60fps butter-smooth animations using flutter_animate
- 📱 **Responsive Design** - Optimized for all screen sizes
- 🎯 **Offline-First** - All content stored locally for instant loading
- 🚀 **High Performance** - Optimized rendering and efficient state management
- 🔧 **Easy to Customize** - Simple content editing through Dart models
- 📱 **Cross-Platform** - Works on iOS, Android, and Web

---

## 📁 Project Structure

```
lib/
├── main.dart                         # App entry point
├── app.dart                          # MaterialApp + GoRouter + Riverpod
│
├── core/                             # Core infrastructure
│   ├── constants/
│   │   ├── app_colors.dart           # Cyberpunk color palette
│   │   ├── app_typography.dart       # Cinzel + Inter fonts
│   │   ├── app_durations.dart        # Animation timing constants
│   │   └── app_strings.dart          # Static strings & fallbacks
│   │
│   ├── theme/
│   │   ├── app_theme.dart            # ThemeData (light + dark)
│   │   ├── theme_extensions.dart     # Custom ThemeExtension classes
│   │   └── theme_provider.dart       # Riverpod theme state
│   │
│   ├── router/
│   │   ├── app_router.dart           # GoRouter configuration
│   │   └── route_transitions.dart    # Custom page transitions
│   │
│   └── utils/
│       ├── extensions.dart           # Dart extension methods
│       ├── responsive.dart           # Screen breakpoints
│       └── haptics.dart              # Haptic feedback utils
│
├── data/                             # Data layer
│   ├── models/                       # Freezed data classes
│   │   ├── hero_content.dart
│   │   ├── about_content.dart
│   │   ├── social_link.dart
│   │   ├── project.dart
│   │   ├── skill.dart
│   │   ├── experience.dart
│   │   ├── hackathon.dart
│   │   └── certification.dart
│   │
│   └── providers/                    # Riverpod providers (data)
│       ├── portfolio_providers.dart   # All portfolio data providers
│       └── user_providers.dart        # User profile providers
│
├── presentation/                     # UI layer
│   ├── screens/                      # Full pages
│   │   ├── splash/
│   │   │   ├── beyond_loading_screen.dart    # Stunning splash
│   │   │   └── splash_controller.dart
│   │   │
│   │   ├── home/
│   │   │   ├── home_screen.dart              # Main scrollable page
│   │   │   └── home_controller.dart
│   │   │
│   │   ├── projects/
│   │   │   ├── all_projects_screen.dart
│   │   │   └── project_detail_screen.dart
│   │   │
│   │   ├── experiences/
│   │   │   └── all_experiences_screen.dart
│   │   │
│   │   ├── certifications/
│   │   │   └── all_certifications_screen.dart
│   │   │
│   │   └── not_found/
│   │       └── not_found_screen.dart         # 404 page
│   │
│   ├── sections/                     # Home page sections
│   │   ├── hero/
│   │   │   ├── ultimate_hero_section.dart    # Animated hero
│   │   │   ├── hero_title_animator.dart
│   │   │   ├── role_typewriter.dart          # Typewriter effect
│   │   │   └── hero_particles.dart
│   │   │
│   │   ├── about/
│   │   │   ├── epic_about_section.dart
│   │   │   └── stats_counter.dart            # Animated counters
│   │   │
│   │   ├── skills/
│   │   │   ├── epic_skills_section.dart
│   │   │   └── skill_orb.dart                # 3D skill spheres
│   │   │
│   │   ├── experience/
│   │   │   ├── experience_section.dart
│   │   │   └── timeline_card.dart            # Animated timeline
│   │   │
│   │   ├── projects/
│   │   │   ├── projects_section.dart
│   │   │   └── project_card.dart             # Glassmorphic cards
│   │   │
│   │   ├── hackathons/
│   │   │   ├── hackathons_section.dart
│   │   │   └── hackathon_card.dart
│   │   │
│   │   ├── certifications/
│   │   │   ├── certifications_section.dart
│   │   │   └── certifications_section.dart
│   │   │
│   │   └── contact/
│   │       ├── epic_contact_section.dart
│   │       └── social_link_button.dart
│   │
│   └── widgets/                      # Reusable components
│       ├── common/
│       │   ├── glass_card.dart               # Glassmorphism container
│       │   ├── gradient_border.dart          # Animated gradient border
│       │   ├── shimmer_text.dart             # Shimmer effect text
│       │   ├── neon_glow.dart                # Neon glow effect
│       │   └── premium_button.dart           # Custom CTA button
│       │
│       ├── effects/
│       │   ├── glitch_effect.dart            # Glitch shader widget
│       │   ├── liquid_effect.dart            # Liquid shader widget
│       │   ├── particle_field.dart           # Canvas particle system
│       │   ├── floating_orbs.dart            # Animated background orbs
│       │   └── radial_theme_transition.dart  # Theme switch effect
│       │
│       ├── layout/
│       │   ├── ultimate_background.dart      # Animated bg + particles
│       │   ├── navbar.dart                   # Bottom/Top navigation
│       │   ├── section_wrapper.dart          # Scroll-aware section
│       │   └── sliver_section.dart           # Optimized sliver
│       │
│       └── animations/
│           ├── stagger_list.dart             # Staggered list animation
│           ├── fade_slide_in.dart            # Fade + slide entrance
│           ├── scale_on_hover.dart           # Touch feedback scale
│           └── pulse_animation.dart          # Pulsing glow effect
│
├── shaders/                          # GLSL Fragment Shaders
│   ├── glitch.frag                   # Glitch distortion
│   ├── liquid.frag                   # Liquid/fluid effect
│   ├── noise.frag                    # Perlin noise
│   └── chromatic_aberration.frag     # RGB split effect
│
└── assets/                           # Static assets
    ├── images/
    │   ├── profile.png
    │   └── logo.png
    ├── lottie/
    │   ├── loading.json              # Splash animation
    │   ├── particles.json            # Particle effect
    │   └── success.json              # Success feedback
    └── fonts/
        └── (Google Fonts loaded dynamically)
```

---

## 🎨 Theme Architecture

```dart
// Custom extensions for cyberpunk aesthetic
@immutable
class CyberpunkColors extends ThemeExtension<CyberpunkColors> {
  final Color neonPink;
  final Color neonCyan;
  final Color neonPurple;
  final Color glassBackground;
  final Color glowColor;
  
  // ... copyWith, lerp implementations
}
```

---

## 📱 Key Features Mapping

| Web Feature | Flutter Implementation |
|-------------|------------------------|
| GSAP Animations | `flutter_animate` + custom controllers |
| Particles.js | Custom `Canvas` painter |
| Lenis Smooth Scroll | `ScrollController` with physics |
| View Transitions | `Hero` + custom `ShaderMask` radial |
| Glassmorphism | `BackdropFilter` + `ClipRRect` |
| Framer Motion | `flutter_animate` sequences |

---

## 🚀 State Management Flow

```
User Action
    ↓
Riverpod Provider (loads local data)
    ↓
Freezed Model (immutable data class)
    ↓
UI Widget (rebuilds reactively)
```

---

## 🚀 Getting Started

### Prerequisites
- **Flutter SDK** 3.10.x or higher
- **Dart SDK** (comes with Flutter)
- A code editor (VS Code, Android Studio, or IntelliJ IDEA)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd mobile_ver_2
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # Run on connected device/emulator
   flutter run
   
   # Run on Chrome
   flutter run -d chrome
   
   # Run on specific device
   flutter devices  # List available devices
   flutter run -d <device-id>
   ```

### Building for Production

```bash
# Android APK
flutter build apk --release

# iOS (requires macOS)
flutter build ios --release

# Web
flutter build web --release
```

---

## 📝 Customizing Your Portfolio

**All portfolio content is stored locally** for instant loading and offline access. To customize your portfolio, edit the fallback data in the model files located in `lib/data/models/`.

For detailed instructions on editing content, adding projects, updating social links, and more, see the **[EDITING_GUIDE.md](EDITING_GUIDE.md)** file.

**Quick Links:**
- [Edit Projects](EDITING_GUIDE.md#editing-projects)
- [Edit Hackathons](EDITING_GUIDE.md#editing-hackathons)
- [Edit Social Links](EDITING_GUIDE.md#editing-social-media-links)
- [Edit Contact Info](EDITING_GUIDE.md#editing-contact-information)
- [Edit Hero Section](EDITING_GUIDE.md#editing-hero-section)
- [Edit About Section](EDITING_GUIDE.md#editing-about-section)

---

## 🛠️ Tech Stack

**Framework:** Flutter 3.10+  
**State Management:** Riverpod  
**Routing:** GoRouter  
**UI/Animations:** flutter_animate, Lottie  
**Fonts:** Google Fonts (Cinzel + Inter)  
**Icons:** Lucide Icons  
**Effects:** Custom shaders (GLSL)

---

## 📱 Key Features Mapping

| Feature | Implementation |
|---------|----------------|
| Smooth Animations | `flutter_animate` + AnimationController |
| Particles | Custom Canvas painter |
| Smooth Scrolling | ScrollController with BouncingScrollPhysics |
| Glassmorphism | BackdropFilter + ClipRRect |
| Custom Effects | GLSL Fragment Shaders |
| State Management | Riverpod (Provider + AsyncNotifier) |

---

## 📁 Architecture Overview

The app follows a clean architecture pattern with clear separation of concerns:

```
lib/
├── main.dart              # App entry point
├── app.dart               # MaterialApp + routing setup
├── core/                  # Core utilities and constants
│   ├── constants/         # Colors, typography, durations
│   ├── theme/             # Theme configuration
│   ├── router/            # Navigation setup
│   └── utils/             # Helper functions
├── data/                  # Data layer
│   ├── models/            # Freezed data models
│   └── providers/         # Riverpod providers
└── presentation/          # UI layer
    ├── screens/           # Full-page screens
    ├── sections/          # Home page sections
    └── widgets/           # Reusable components
```

### State Management Flow

```
User Interaction
    ↓
Riverpod Provider (reads from models)
    ↓
Data Model (static fallback data)
    ↓
UI Widget (rebuilds reactively)
```

---

## 🎨 Customization

### Changing Colors

Edit `lib/core/constants/app_colors.dart` to change the color scheme:

```dart
class AppColors {
  static const Color primaryRed = Color(0xFFDC2626);  // Change this
  static const Color darkRed = Color(0xFF991B1B);     // Change this
  // ... more colors
}
```

### Changing Fonts

Edit `lib/core/constants/app_typography.dart` or update Google Fonts in the theme:

```dart
// In app_theme.dart
textTheme: GoogleFonts.interTextTheme(baseTextTheme).copyWith(
  headlineLarge: GoogleFonts.cinzel(fontSize: 32, fontWeight: FontWeight.bold),
),
```

### Adding New Sections

1. Create a new section widget in `lib/presentation/sections/`
2. Add it to `home_screen.dart`:
   ```dart
   SliverToBoxAdapter(
     child: const YourNewSection(),
   ),
   ```

---

## 📄 License

This project is personal portfolio software. Feel free to use it as inspiration for your own portfolio.

---

## 👤 Author

**Marwin John Gonzales**
- Portfolio: [Your Website]
- GitHub: [@yourusername]
- LinkedIn: [Your Profile]

---

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Riverpod for elegant state management
- Google Fonts for beautiful typography
- Lucide Icons for the icon set

---

*Built with ❤️ using Flutter*
