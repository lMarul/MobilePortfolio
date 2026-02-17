# Project Guidelines - Marwin's Portfolio (Mobile)

> **Purpose**: This file serves as a comprehensive reference for AI assistants to understand the Flutter mobile app's context, architecture, and preferences for future sessions.

---

## 📋 Project Information

| Field | Value |
|-------|-------|
| **Project Name** | Marwin Portfolio Mobile |
| **Package Name** | `marwin_portfolio` |
| **Owner** | Marwin John Gonzales |
| **Location** | `c:\Users\Maru\Documents\Portfolios\Mobile\mobile_ver_1` |
| **Type** | Personal Developer Portfolio Mobile App |
| **Framework** | Flutter 3.x |
| **State Management** | Riverpod (with code generation) |
| **Database** | None (100% offline-first with local data) |
| **Navigation** | GoRouter |

---

## 🎯 Project Purpose

This is the **mobile version** of Marwin's developer portfolio, mirroring the web portfolio's structure while optimized for mobile UX. Features include:
- Professional experiences (jobs, internships, OJT, student orgs)
- Projects and hackathon participations
- Skills and certifications
- Personal bio and contact information

The app features **premium, 60fps animations** and **local data storage** for instant loading with zero network dependencies.

---

## ⚙️ Tech Stack

### Core
| Technology | Version | Purpose |
|------------|---------|---------|
| Flutter | ^3.10.x | Cross-platform framework |
| Dart | ^3.10.4 | Language |
| flutter_riverpod | ^2.6.1 | State management |
| riverpod_annotation | ^2.6.1 | Code generation for Riverpod |


### Navigation
| Technology | Version | Purpose |
|------------|---------|---------|
| go_router | ^14.8.1 | Declarative routing with deep linking |

### Animations
| Technology | Version | Purpose |
|------------|---------|---------|
| flutter_animate | ^4.5.2 | Sequencing & complex animations |
| lottie | ^3.3.1 | After Effects JSON animations |
| rive | ^0.14.2 | Interactive animations (optional) |

### Styling
| Technology | Version | Purpose |
|------------|---------|---------|
| google_fonts | ^6.2.1 | Cinzel (headers) + Inter (body) |
| lucide_icons | ^0.257.0 | Lucide icon pack (matches web) |
| flutter_svg | ^2.0.17 | SVG support |
| cached_network_image | ^3.4.1 | Optimized image loading |
| blur | ^3.0.0 | Glassmorphism blur utilities |

### Data Models
| Technology | Version | Purpose |
|------------|---------|---------|
| freezed_annotation | ^3.1.0 | Immutable data classes |
| json_annotation | ^4.9.0 | JSON serialization |

### Utilities
| Technology | Version | Purpose |
|------------|---------|---------|
| url_launcher | ^6.3.1 | Open external links |
| share_plus | ^10.1.4 | Native share sheet |
| vibration | ^2.0.1 | Haptic feedback |

---

## 📁 Project Structure

```
lib/
├── main.dart                         # App entry point
├── app.dart                          # MaterialApp.router with Riverpod
│
├── core/                             # Core infrastructure
│   ├── constants/
│   │   ├── app_colors.dart           # Red & White/Black color palette
│   │   ├── app_typography.dart       # Cinzel + Inter fonts
│   │   ├── app_durations.dart        # Animation timing constants
│   │   └── app_strings.dart          # Static strings & fallbacks
│   │
│   ├── theme/
│   │   ├── app_theme.dart            # ThemeData (light + dark)
│   │   ├── theme_extensions.dart     # CyberpunkColors ThemeExtension
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
│   │   ├── models.dart               # Barrel export
│   │   ├── hero_content.dart
│   │   ├── about_content.dart
│   │   ├── social_link.dart
│   │   ├── project.dart
│   │   ├── skill.dart
│   │   ├── experience.dart
│   │   ├── hackathon.dart
│   │   ├── certification.dart
│   │   └── contact_info.dart
│   │
│   ├── repositories/                 # Data abstraction (future use)
│   │
│   └── providers/                    # Riverpod providers
│       ├── providers.dart            # Barrel export
│       └── portfolio_providers.dart  # All data providers
│
├── presentation/                     # UI layer
│   ├── screens/                      # Full pages
│   │   ├── splash/
│   │   │   └── beyond_loading_screen.dart
│   │   ├── home/
│   │   │   └── home_screen.dart      # Main scrollable page
│   │   ├── projects/
│   │   │   ├── all_projects_screen.dart
│   │   │   └── project_detail_screen.dart
│   │   ├── experiences/
│   │   │   └── all_experiences_screen.dart
│   │   ├── certifications/
│   │   │   └── all_certifications_screen.dart
│   │   └── not_found/
│   │       └── not_found_screen.dart
│   │
│   ├── sections/                     # Home page sections (reusable)
│   │   ├── hero/
│   │   │   └── ultimate_hero_section.dart
│   │   ├── about/
│   │   │   └── about_section.dart
│   │   ├── skills/
│   │   │   └── skills_section.dart
│   │   ├── experience/
│   │   │   └── experience_section.dart
│   │   ├── projects/
│   │   │   └── projects_section.dart
│   │   ├── hackathons/
│   │   │   └── hackathons_section.dart
│   │   ├── certifications/
│   │   │   └── certifications_section.dart
│   │   └── contact/
│   │       └── contact_section.dart
│   │
│   └── widgets/                      # Reusable components
│       ├── common/
│       │   ├── glass_card.dart
│       │   ├── gradient_border.dart
│       │   ├── shimmer_text.dart
│       │   └── theme_toggle.dart
│       ├── effects/
│       │   └── floating_orbs.dart
│       ├── layout/
│       │   └── ultimate_background.dart
│       └── animations/
│           └── (animation utilities)
│
├── shaders/                          # GLSL Fragment Shaders
│   ├── glitch.frag
│   ├── liquid.frag
│   ├── noise.frag
│   └── chromatic_aberration.frag
│
└── assets/                           # Static assets (in project root)
    ├── images/
    └── lottie/
        └── loading.json
```

---

## 🗄️ Data Architecture

### Local-Only Data Models

All portfolio data is stored locally in the app using Freezed models with fallback data. The app works 100% offline.

| Model | Type | Description |
|-------|------|-------------|
| `heroContent` | Single | Hero section title, subtitle, description, roles |
| `aboutContent` | Single | About bio, paragraphs, highlights |
| `socialLinks` | List | Individual social platform links |
| `contactInfo` | Single | Contact email, phone, location, availability |
| `projects` | List | Portfolio projects |
| `skills` | List | Technical skills by category |
| `experiences` | List | Work experience (auto-sorted by date) |
| `hackathons` | List | Hackathon participations |
| `certifications` | List | Professional certifications |
| `userProfile` | Single | Local-only user profile data |

### Key Design Decisions

1. **Offline-First Architecture**: All data stored locally
   - No network calls required
   - Instant loading times
   - Works everywhere, always

2. **User Profile Synchronization**: Profile screen data comes from multiple sources
   - Contact info (email, phone) synced with `contactInfo` model
   - Social links from `socialLinks` models
   - Skills, hobbies, interests stored locally
   - Ensures consistency between Contact Section and Profile Screen

3. **Normalized Social Links**: Each platform is a separate row
   - `isActive` field to show/hide without deleting

4. **Experiences Auto-Sort**: Sorted by `startDate` descending
   - Newest experiences appear first automatically

5. **Local Data Storage**: All data stored in Freezed models with default content
   - App is 100% offline-first with zero network dependencies

### Data Architecture Pattern

```dart
// In portfolio_providers.dart
@riverpod
List<Project> projects(Ref ref) {
  // Returns local Freezed models with fallback data
  return Project.fallback;
}
```

---

## 🎨 Design Patterns & Preferences

### Animation Philosophy
- **60fps butter-smooth animations** are mandatory
- Use `flutter_animate` for complex sequencing
- Particles and floating orbs enhance mobile experience
- Stagger animations with proper delays (100-200ms between items)

### Mobile-First Adaptations
- **Vertical scrolling**: Single-column layout for sections
- **Touch-optimized**: Larger tap targets (min 48x48)
- **Bottom navigation**: Easy thumb reach
- **Swipe gestures**: For card carousels and navigation

### Theme System
```dart
// Access cyberpunk colors via extension
context.cyberpunk.neonPrimary  // Primary red
context.cyberpunk.neonSecondary  // Secondary accent
context.cyberpunk.glassBackground  // Glass effect bg
```

### Component Naming Convention
- `Ultimate*` - Most enhanced version (e.g., `UltimateHeroSection`)
- `Epic*` - Enhanced version with animations
- `Beyond*` - Advanced effects components
- `*Section` - Home page sections
- `*Screen` - Full page screens
- `*Card` - Individual item cards

### Glassmorphism Pattern
```dart
GradientBorder(
  borderRadius: 24,
  gradient: AppColors.primaryGradient,
  strokeWidth: 1.5,
  child: GlassCard(
    borderRadius: 24,
    blur: 20,
    opacity: 0.08,
    child: // content
  ),
)
```

---

## 🔧 Important Commands

### Development
```powershell
# Run app in debug mode
flutter run

# Run with specific device
flutter run -d chrome        # Web
flutter run -d windows       # Windows
flutter run -d <device_id>   # Specific device

# Generate Freezed/Riverpod code
dart run build_runner build --delete-conflicting-outputs

# Watch for code changes
dart run build_runner watch
```

### Testing
```powershell
flutter test                 # Run all tests
flutter test --coverage      # With coverage report
```

### Production
```powershell
flutter build apk --release           # Android APK
flutter build appbundle --release     # Android App Bundle (Play Store)
flutter build ios --release           # iOS (Mac only)
flutter build web --release           # Web deployment
```

---

## 🔄 Typical Development Workflow

1. **Start Development**
   ```powershell
   # Terminal 1: Run app
   flutter run
   
   # Terminal 2: Watch code generation
   dart run build_runner watch
   ```

2. **Adding New Models**
   - Create Freezed class in `lib/data/models/`
   - Export in `models.dart` barrel file
   - Run `dart run build_runner build`

3. **Adding New Providers**
   - Add to `portfolio_providers.dart`
   - Use `@riverpod` annotation
   - Regenerate with build_runner

4. **Adding New Screens**
   - Create screen in `lib/presentation/screens/`
   - Add route in `app_router.dart`
   - Add custom transition in `route_transitions.dart`

5. **Editing Content**
   - Edit model files directly in `lib/data/models/`
   - Update fallback data in each model file
   - Changes take effect after hot restart

---

## ⚠️ Known Gotchas & Solutions

### 1. Freezed Code Not Generating
Run build_runner with delete flag:
```powershell
dart run build_runner build --delete-conflicting-outputs
```

### 2. Hot Reload Not Working with Providers
Riverpod providers require hot restart for changes to take effect. Use `r` in terminal.

### 4. Google Fonts Loading Slowly
First load fetches from network. Consider bundling critical fonts for splash screen.

### 5. Shader Compilation Jank
Fragment shaders may cause jank on first use. Warm them up during splash screen if possible.

---

## 📍 Key Files Quick Reference

| For... | Look at... |
|--------|------------|
| App entry | `lib/main.dart` |
| App configuration | `lib/app.dart` |
| Routes | `lib/core/router/app_router.dart` |
| Color palette | `lib/core/constants/app_colors.dart` |
| Theme data | `lib/core/theme/app_theme.dart` |
| Theme extensions | `lib/core/theme/theme_extensions.dart` |
| All data models | `lib/data/models/models.dart` |
| All providers | `lib/data/providers/portfolio_providers.dart` |
| Home screen | `lib/presentation/screens/home/home_screen.dart` |
| Hero section | `lib/presentation/sections/hero/ultimate_hero_section.dart` |
| Splash screen | `lib/presentation/screens/splash/beyond_loading_screen.dart` |

---

## 🎯 User Preferences

1. **Aesthetics**: Premium, visually stunning, 60fps animations
2. **Performance**: No jank, smooth scrolling, optimized rebuilds
3. **Mobile UX**: Touch-first, thumb-friendly navigation
4. **Offline-First**: 100% local data, instant loading, zero network dependencies
5. **Cross-platform**: Works on Android, iOS, Web (same codebase)
6. **Easy Updates**: Edit model files directly, changes apply with hot restart

---

## 📱 Screen Flow

```
Splash (/)
    │
    └──▶ Home (/home)
              │
              ├──▶ All Projects (/projects)
              │         │
              │         └──▶ Project Detail (/projects/:id)
              │
              ├──▶ All Experiences (/experiences)
              │
              └──▶ All Certifications (/certifications)
```

---

## ⚠️ CRITICAL: Asset Paths & Platform Differences

### Asset Path Rules (MUST FOLLOW)

**The Golden Rule**: When `pubspec.yaml` declares assets with `assets/` prefix, use the FULL path including `assets/` in code.

```yaml
# pubspec.yaml
assets:
  - assets/images/
  - assets/images/org_logos/
```

```dart
// ✅ CORRECT - Full path
Image.asset('assets/images/logo.png')
Image.asset('assets/images/org_logos/gg_logo.png')

// ❌ WRONG - Do NOT strip 'assets/' prefix
Image.asset('images/logo.png')
Image.asset('images/org_logos/gg_logo.png')
```

### File Naming Rules

**NEVER use spaces in asset filenames** - they cause double URL encoding issues on Flutter Web (`%2520`).

```bash
# ✅ CORRECT
gg_logo.png
taguig_sanitation_office.png

# ❌ WRONG
GG Logo.png
Taguig Sanitation Office.png
```

### Mobile vs Web Differences

| Aspect | Mobile (APK) | Web (Browser) | Solution |
|--------|--------------|---------------|----------|
| Asset paths | `Image.asset('assets/...')` | Same | Always use full path with `assets/` |
| Spaces in filenames | Works but avoid | Causes `%2520` errors | Use snake_case |
| Network images | Works | Works | Use `CachedNetworkImage` or `SvgPicture.network` |
| External URLs | Needs Android config | Works | Add queries to AndroidManifest.xml |

### ImageUtils Utility

The `lib/core/utils/image_utils.dart` utility handles both network and asset images:

```dart
// Detects http/https → CachedNetworkImage
// Local paths → Image.asset() with FULL path
ImageUtils.buildImage(
  imageUrl: 'assets/images/projects/dashboard.png',
  fit: BoxFit.cover,
)
```

**IMPORTANT**: ImageUtils does NOT strip the `assets/` prefix. It passes paths as-is to `Image.asset()`.

### URL Launcher Configuration

For social media links and external URLs to work on Android 11+, the `AndroidManifest.xml` MUST include:

```xml
<queries>
  <!-- Required for url_launcher -->
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="https" />
  </intent>
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="http" />
  </intent>
</queries>
```

Without this, `url_launcher` will fail silently on Android devices.

### Asset Registration in pubspec.yaml

When adding new images to subdirectories, you MUST explicitly declare them:

```yaml
assets:
  - assets/images/                              # Parent directory
  - assets/images/org_logos/                    # Explicit subdirectory
  - assets/images/projects/apc_gym_log/         # Each project folder
  - assets/images/projects/apc_honors_checker/  # Must be listed
  - assets/images/hackathons/fire_detection/    # Cannot use wildcards
```

Flutter does NOT recursively include subdirectories. Each must be listed explicitly.

### Testing Checklist

Before marking any image-related feature as complete:

- [ ] Test on Flutter Web (`flutter run -d chrome`)
- [ ] Build APK (`flutter build apk`)
- [ ] Install and test on physical Android device
- [ ] Verify all images load correctly on mobile
- [ ] Test external links (social media, project links)
- [ ] Check for `%2520` errors in web console
- [ ] Confirm no asset loading errors in mobile logs

### Common Issues & Solutions

| Issue | Cause | Solution |
|-------|-------|----------|
| Images show on web but not mobile | Wrong asset path format | Use full path with `assets/` prefix |
| `%2520` errors in console | Spaces in filenames | Rename files to snake_case |
| Links don't open on mobile | Missing Android queries | Add `<queries>` to AndroidManifest.xml |
| Asset not found after adding file | Not declared in pubspec.yaml | Add explicit directory to assets list |

---

## 🤖 AI Assistant Notes

When working on this project:

1. **⚠️ READ "CRITICAL: Asset Paths & Platform Differences" section** - Must-read to avoid regression
2. **Check guidelines.md first** for Flutter-specific context
3. **Always test on BOTH web and mobile** before marking image/link features complete
4. **Use Riverpod** for all state management
5. **Use Freezed** for all data models
6. **Premium animations** are expected (flutter_animate)
7. **Performance matters** - use const constructors, avoid rebuilds
8. **Local data models** in `lib/data/models/` contain all portfolio content
9. **User runs Windows** - PowerShell commands
10. **Follow existing patterns** - check similar files before creating new ones
11. **Never use spaces in asset filenames** - use snake_case
12. **Asset paths must include `assets/` prefix** - don't strip it
13. **User Profile syncs with Contact Info and Social Links** - Keep `user_profile.dart` defaultProfile in sync with `contact_info.dart` and `social_link.dart` fallback data for consistency

---

## 📝 Version History

### v1.0.1 (Current - Feb 18, 2026)
- **CRITICAL FIX**: Corrected asset path handling for mobile platform
  - ImageUtils no longer strips `assets/` prefix
  - Organization logo paths updated to include `assets/` prefix
  - All asset paths now use full path format
- **FIXED**: File naming issues (removed spaces from org logo filenames)
- **FIXED**: Social media links on Android (added required queries to AndroidManifest.xml)
- **FIXED**: Hero section CTA buttons now scroll to their respective sections
  - "View Work" button scrolls to Projects section
  - "Contact" button scrolls to Contact section
- **UPDATED**: User Profile now synced with Contact Info and Social Links
  - Email, phone, and social media links now consistent across Contact Section and Profile Screen
  - Real contact information copied from contact_info.dart and social_link.dart
- **UPDATED**: Social media links UI unified across main page and profile page
  - Profile page now uses same design as Contact section
  - Color-coded icons with platform labels
  - Consistent glass-morphic styling
- **UPDATED**: Section order on home page reorganized
  - New order: About → Projects → Hackathons → Certifications → Skills → Experience → Contact
  - Previously: About → Skills → Experience → Projects → Hackathons → Certifications → Contact
- **UPDATED**: Hamburger menu (drawer) navigation reorganized
  - Removed redundant "Home" item
  - Added "Hackathons" to navigation
  - New order: Profile → Friends → Projects → Hackathons → Certifications → Experiences
- **UPDATED**: Profile page name display improved
  - Name now fits on single line (maxLines: 1)
  - Responsive font sizing for different screen sizes (18px to 28px)
  - FittedBox wrapper ensures name scales down if needed on very small screens
- **UPDATED**: App branding
  - App name changed to "Marwin's Portfolio" across all platforms (Android, iOS, web)
  - App logo "M" changed from red to black for better contrast against red background
  - Regenerated all app icons with new design
- **REMOVED**: Convex backend integration (fully offline-first now)
  - Deleted convex/ directory and TypeScript schemas
  - Removed convex_client_provider.dart
  - Updated all model comments to reflect local-only architecture
  - App is now 100% offline with no backend dependencies
- **ADDED**: Comprehensive asset handling guidelines to prevent regression
- **ADDED**: Complete User Profile editing section to EDITING_GUIDE.md
- **TESTED**: All fixes verified on both web and mobile platforms

### v1.0.0
- Initial Flutter port of web portfolio
- Full Convex integration with fallbacks
- All main sections implemented
- GoRouter with custom transitions
- Light/Dark theme support
- 60fps animation targets

---

*Last Updated: 2026-02-18*
