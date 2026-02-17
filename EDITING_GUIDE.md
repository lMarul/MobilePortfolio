# 📝 Portfolio Editing Guide

> Complete guide to customizing your Flutter portfolio app

This guide will walk you through editing every aspect of your portfolio, from adding projects and hackathons to updating social media links and contact information.

---

## 📍 Table of Contents

1. [Understanding the Structure](#understanding-the-structure)
2. [Editing Projects](#editing-projects)
3. [Editing Hackathons](#editing-hackathons)
4. [Editing Skills](#editing-skills)
5. [Editing Experiences](#editing-experiences)
6. [Editing Certifications](#editing-certifications)
7. [Editing Hero Section](#editing-hero-section)
8. [Editing About Section](#editing-about-section)
9. [Editing Social Media Links](#editing-social-media-links)
10. [Editing Contact Information](#editing-contact-information)
11. [Managing Images](#managing-images)
12. [Regenerating Code](#regenerating-code)

---

## Understanding the Structure

All portfolio content is stored in **model files** located in `lib/data/models/`. Each model file contains either a `fallback` or `defaultProfile` property that holds your data.

**Why "fallback" and "defaultProfile"?**  
This app is designed to be offline-first. All content loads instantly from local data, ensuring your portfolio works without an internet connection. The app can optionally sync with a Convex database, but will always fall back to local data if unavailable.

**Available Sections:**
- **Projects** - Your portfolio projects with descriptions, tech stack, and links
- **Hackathons** - Hackathon participations and achievements
- **Skills** - Technical skills organized by category (Frontend, Backend, etc.)
- **Experiences** - Work history, internships, OJT, student organizations
- **Certifications** - Professional certifications and courses
- **Hero Section** - Landing page headline and call-to-actions
- **About Section** - Your bio, story, and stats
- **User Profile** - Personal information displayed in the Profile screen
- **Social Links** - Social media platform links
- **Contact Info** - Your contact information and availability

**Home Page Section Order:**
1. Hero Section (landing page with your name and call-to-action buttons)
2. About Me
3. Projects
4. Hackathons
5. Certifications
6. Skills
7. Experience
8. Contact Me

**Navigation Menu (Hamburger) Order:**
1. Profile
2. Friends
3. Projects
4. Hackathons
5. Certifications
6. Experiences

**Where to edit:**
1. Navigate to `lib/data/models/`
2. Open the relevant `.dart` file (see Quick Reference table at the bottom)
3. Find the `static get fallback` or `static get defaultProfile` section
4. Edit the data directly in the code
5. Save and hot reload (press `r` in terminal) or hot restart (press `R`)

**Important Notes:**
- Always use the FULL asset path including `assets/` prefix (e.g., `'assets/images/logo.png'`)
- Never use spaces in asset filenames (use `snake_case` instead)
- After adding images to new subdirectories, update `pubspec.yaml` to register them
- Test on both web (`flutter run -d chrome`) and mobile after changes

---

## Editing Projects

**File:** `lib/data/models/project.dart`

### Adding a New Project

1. Open `lib/data/models/project.dart`
2. Find the `static List<Project> get fallback => [...]` section
3. Add a new project to the list:

```dart
static List<Project> get fallback => [
  // Add your new project here
  const Project(
    id: 'project-5',                    // Unique ID
    creationTime: 0,                    // Keep as 0
    title: 'My New Project',            // Project name
    description:
        'A detailed description of what this project does and why it matters.',
    thumbnail: 'assets/images/projects/my_project/dashboard.png',  // Image path
    tags: ['Flutter', 'Firebase', 'UI/UX'],  // Tech stack tags
    category: 'Mobile App',             // Category (optional, not displayed)
    date: 'February 2024',              // Date completed
    links: ProjectLinks(
      github: 'https://github.com/username/project',
      live: 'https://myproject.com',    // Optional
      demo: 'https://demo.myproject.com', // Optional
    ),
    isFeatured: true,                   // Mark as featured (optional)
  ),
  
  // Existing projects...
  const Project(
    id: 'project-1',
    creationTime: 0,
    title: 'APC Gym Log System',
    // ... rest of the project
  ),
];
```

### Editing Existing Project

Simply modify the values directly in the list:

```dart
const Project(
  id: 'project-1',
  creationTime: 0,
  title: 'Updated Project Name',      // Changed title
  description: 'New description...',   // Changed description
  thumbnail: 'assets/images/projects/new_image.png',  // Changed image
  tags: ['React', 'Node.js'],          // Updated tags
  category: 'Full Stack',
  date: 'March 2024',                  // Updated date
  links: ProjectLinks(
    github: 'https://github.com/new-link',
  ),
  isFeatured: false,                   // Changed featured status
),
```

### Removing a Project

Simply delete the entire `Project(...)` block from the list.

### Project Image Setup

1. **Create a folder** for your project images:
   ```
   assets/images/projects/my_project/
   ```

2. **Add your image** (recommended: `dashboard.png`)

3. **Reference it** in the project:
   ```dart
   thumbnail: 'assets/images/projects/my_project/dashboard.png',
   ```

---

## Editing Hackathons

**File:** `lib/data/models/hackathon.dart`

Hackathons work exactly like projects! The structure is very similar.

### Adding a New Hackathon

1. Open `lib/data/models/hackathon.dart`
2. Find the `static List<Hackathon> get fallback => [...]` section
3. Add your hackathon:

```dart
static List<Hackathon> get fallback => [
  const Hackathon(
    id: 'hackathon-3',                   // Unique ID
    creationTime: 0,                     // Keep as 0
    title: 'My Hackathon Project',       // Project name
    description:
        'Description of the hackathon project, what problem it solves, and what you built.',
    date: 'April 2024',                  // When it happened
    organizer: 'Hackathon Organizer Name', // Who organized it
    thumbnail: 'assets/images/hackathons/my_hackathon/dashboard.png',
    gallery: ['assets/images/hackathons/my_hackathon/dashboard.png'],  // Can add multiple images
    tags: ['IoT', 'Arduino', 'Python'],  // Technologies used
    links: HackathonLinks(
      github: 'https://github.com/username/hackathon-project',
      demo: 'https://demo.com',          // Optional
      social: 'https://devpost.com/...',  // Optional - DevPost, etc.
    ),
  ),
  
  // Existing hackathons...
];
```

### Hackathon Image Setup

Same as projects:
```
assets/images/hackathons/my_hackathon/
  └── dashboard.png
```

---

## Editing Skills

**File:** `lib/data/models/skill.dart`

Skills are organized into **categories** (Frontend, Backend, Tools, etc.).

### Adding a New Skill Category

```dart
static List<SkillCategory> get fallback => [
  const SkillCategory(
    name: 'Frontend',
    icon: '🎨',
    skills: [
      // Skills listed here...
    ],
  ),
  
  // Add new category
  const SkillCategory(
    name: 'DevOps',              // Category name
    icon: '🚀',                  // Emoji icon
    skills: [
      Skill(
        id: 's25',
        creationTime: 0,
        name: 'Docker',
        category: 'devops',
        imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg',
      ),
      Skill(
        id: 's26',
        creationTime: 0,
        name: 'Kubernetes',
        category: 'devops',
        imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/kubernetes/kubernetes-plain.svg',
      ),
    ],
  ),
];
```

### Adding Skills to Existing Category

Find the category and add to its skills list:

```dart
const SkillCategory(
  name: 'Frontend',
  icon: '🎨',
  skills: [
    // Existing skills...
    Skill(
      id: 's3',
      creationTime: 0,
      name: 'TypeScript',
      category: 'frontend',
      imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg',
    ),
    
    // Add your new skill here
    Skill(
      id: 's20',              // Unique ID
      creationTime: 0,
      name: 'Vue.js',         // Technology name
      category: 'frontend',
      imageUrl: 'https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vuejs/vuejs-original.svg',
    ),
  ],
),
```

### Finding Skill Icons

Use the [Devicon CDN](https://devicons.github.io/devicon/):

Format: `https://cdn.jsdelivr.net/gh/devicons/devicon/icons/{technology}/{technology}-original.svg`

Examples:
- React: `https://cdn.jsdelivr.net/gh/devicons/devicon/icons/react/react-original.svg`
- Python: `https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg`
- Flutter: `https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg`

---

## Editing Experiences

**File:** `lib/data/models/experience.dart`

### Adding a New Experience

```dart
static List<Experience> get fallback => [
  const Experience(
    id: 'exp-3',                          // Unique ID
    creationTime: 0,
    title: 'Software Engineer',           // Your position
    organization: 'Tech Company',         // Company name
    description:
        'Brief description of your role and what you did.',
    startDate: 'January 2024',            // When you started
    endDate: 'December 2024',             // When you ended (or null if current)
    location: 'Remote',                   // Work location
    type: 'employment',                   // Type: employment, internship, ojt, student-org, freelance, volunteer
    isCurrent: false,                     // Are you still working here?
    technologies: ['React', 'Node.js', 'AWS'],  // Technologies used
    responsibilities: [                   // What you did
      'Developed and maintained web applications',
      'Collaborated with cross-functional teams',
      'Participated in code reviews',
    ],
    achievements: [                       // What you achieved
      'Reduced loading time by 50%',
      'Implemented new feature that increased engagement by 30%',
    ],
    logo: 'assets/images/companies/company_logo.png',  // Optional
    color: '#4285F4',                     // Optional - for styling
  ),
  
  // Existing experiences...
];
```

### Marking Current Position

For your current job, set:
```dart
endDate: null,        // No end date
isCurrent: true,      // Mark as current
```

### Experience Types

- `employment` - Full-time or part-time job
- `internship` - Internship position
- `ojt` - On-the-job training
- `student-org` - Student organization role
- `freelance` - Freelance work
- `volunteer` - Volunteer position

---

## Editing Certifications

**File:** `lib/data/models/certification.dart`

### Adding a New Certification

```dart
static List<Certification> get fallback => [
  const Certification(
    id: 'cert-3',                         // Unique ID
    creationTime: 0,
    title: 'Professional Certificate',    // Certification name
    issuer: 'Certification Authority',    // Who issued it
    date: '2024-03',                      // When you got it (YYYY-MM format)
    credentialId: 'CERT-123456',          // Credential/License ID
    url: 'https://verify.com/cert',       // Optional - verification URL
    iconType: 'certificate',              // Icon identifier
    color: '#FF9900',                     // Accent color
    glowColor: '#FF990040',               // Glow effect color (add alpha)
    skills: ['Skill 1', 'Skill 2'],       // Related skills
  ),
  
  // Existing certifications...
];
```

---

## Editing Hero Section

**File:** `lib/data/models/hero_content.dart`

The hero section is the first thing visitors see.

### Editing Hero Content

```dart
static HeroContent get fallback => const HeroContent(
  id: 'fallback',
  title: 'MARWIN',                        // Your name (or nickname)
  subtitle: 'Full Stack Developer | UI/UX Designer | Creative Technologist',  // Your tagline
  description:
      'This is the description that appears below your name. Make it compelling!',
  roles: [                                // Rotating text roles
    'Full Stack Developer',
    'Mobile Developer',
    'UI/UX Designer',
    'Creative Technologist',
  ],
  ctaText: 'Explore Projects',           // Primary button text
  ctaLink: '#projects',                   // Where it goes
  secondaryCtaText: 'Contact Me',         // Secondary button text
  secondaryCtaLink: '#contact',           // Where it goes
);
```

### Tips for the Hero Section

- **Title**: Keep it short (usually your name or brand)
- **Subtitle**: One-liner describing what you do
- **Description**: 1-2 sentences about your passion/mission
- **Roles**: 3-5 rotating titles that describe you
- **CTA Buttons**: The "View Work" button scrolls to the Projects section, and the "Contact" button scrolls to the Contact section automatically

---

## Editing About Section

**File:** `lib/data/models/about_content.dart`

### Editing About Content

```dart
static AboutContent get fallback => const AboutContent(
  id: 'fallback',
  title: 'Passionate Web Developer & Tech Enthusiast',  // Section title
  subtitle: 'Your professional tagline here',            // Subtitle
  paragraphs: [                                          // Multiple paragraphs
    'First paragraph about yourself, your background, and what drives you.',
    'Second paragraph about your experience, skills, or interests.',
    'Optional third paragraph about your goals or what you\'re looking for.',
  ],
  imageUrl: 'assets/images/profile.png',  // Your photo
  highlights: [],                         // Optional highlights (usually empty)
  stats: {                                // Fun stats to display
    'projects': '10+',
    'technologies': '15+',
    'years': '3+',
    'coffee': '∞',
  },
);
```

### About Section Tips

- Write in first person ("I am..." not "They are...")
- Be authentic and personable
- Highlight what makes you unique
- Keep paragraphs concise (2-3 sentences each)

---

## Editing User Profile

**File:** `lib/data/models/user_profile.dart`

The User Profile is displayed in the Profile Screen (accessible from the home screen). It contains your personal information, skills, hobbies, interests, and social links.

### ⚠️ Important: Keep Contact Info Synchronized

The User Profile **should be kept in sync** with your Contact Information and Social Links:

- **Email & Phone**: Update these in `user_profile.dart` to match `contact_info.dart`
- **Social Links**: Keep `socialLinks` in sync with `social_link.dart` fallback data
- **Why?** This ensures consistency between the Contact Section (bottom of home page) and the Profile Screen

**Best Practice:** When you update contact information:
1. First edit `contact_info.dart` (for the Contact Section)
2. First edit `social_link.dart` (for Social Links)
3. Then copy those values to `user_profile.dart` (for the Profile Screen)

This keeps all your contact information consistent throughout the app.

---

### Understanding User Profile Structure

Unlike other sections that use `fallback` data, the User Profile uses a `defaultProfile` static getter and is managed through a Riverpod state provider. This means you can edit it in the code, and the app can also update it at runtime (e.g., changing profile pictures, editing bio).

### Editing Profile Information

Open `lib/data/models/user_profile.dart` and find the `defaultProfile` getter:

```dart
static UserProfile get defaultProfile => UserProfile(
  id: 'default_user',                     // Unique identifier
  fullName: 'Marwin John Gonzales',       // Your full name
  bio: 'Full Stack Developer & UI/UX Designer passionate about creating '
       'immersive digital experiences. Specializing in Flutter, React, '
       'and modern web technologies.',     // Your bio (2-3 sentences)
  email: 'marwinjohngonzales@gmail.com',  // Your email address (synced with contact_info.dart)
  phone: '+63 9687002559',                // Your phone number (synced with contact_info.dart)
  profileImageUrl: null,                  // Optional: network URL for profile photo
  skills: [                               // Your top skills (shown in profile)
    'Flutter',
    'Dart',
    'React',
    'TypeScript',
    'Node.js',
    'Python',
    'UI/UX Design',
    'Figma',
  ],
  hobbies: [                              // Your hobbies
    'Coding',
    'Gaming',
    'Photography',
    'Music',
  ],
  interests: [                            // Your professional interests
    'Mobile Development',
    'Web Technologies',
    'AI/ML',
    'Creative Tech',
  ],
  socialLinks: {                          // Social media links (synced with social_link.dart)
    'LinkedIn': 'https://www.linkedin.com/in/marwin-john-gonzales-a38509322/',
    'GitHub': 'https://github.com/lMarul',
    'Email': 'mailto:marwinjohngonzales@gmail.com',
    'Facebook': 'https://www.facebook.com/marwin.john.gonzales.2024',
    'Instagram': 'https://instagram.com/maruwinu',
  },
);
```

### Profile Fields Explained

| Field | Required | Description |
|-------|----------|-------------|
| `id` | Yes | Unique identifier (keep as is) |
| `fullName` | Yes | Your complete name displayed at the top |
| `bio` | Yes | 2-3 sentences about yourself |
| `email` | Yes | Your contact email (**⚠️ Sync with `contact_info.dart`**) |
| `phone` | Yes | Your contact phone number (**⚠️ Sync with `contact_info.dart`**) |
| `profileImageUrl` | No | Network URL for profile picture (or use `localProfileImagePath`) |
| `localProfileImagePath` | No | Local asset path for profile picture |
| `skills` | No | List of your top skills (displayed as chips) |
| `hobbies` | No | Your personal hobbies/interests |
| `interests` | No | Professional areas of interest |
| `socialLinks` | No | Map of social platform name to URL (**⚠️ Sync with `social_link.dart`**) |

### Adding Your Profile Picture

You have two options for profile pictures:

**Option 1: Local Asset (Recommended)**
```dart
profileImageUrl: null,
localProfileImagePath: 'assets/images/profile.png',  // Add this line
```

**Option 2: Network URL**
```dart
profileImageUrl: 'https://example.com/my-photo.jpg',
localProfileImagePath: null,  // Keep this null
```

### Profile Section Tips

- **Bio**: Keep it concise and engaging. Mention what you do, what you're passionate about, and what makes you unique.
- **Skills**: List 6-10 of your strongest technical skills. These appear as colorful chips in the profile.
- **Hobbies**: Show your personality! Include 3-5 things you enjoy outside of work.
- **Interests**: Professional areas you're curious about or want to explore more.
- **Social Links**: Use platform names as keys (e.g., "GitHub", "LinkedIn") and full URLs as values.

### Updating Profile at Runtime

The profile is managed by a state provider, which means the app can update it without code changes. For example, users could change their profile picture through the app's edit functionality (if implemented).

### Common Profile Updates

**Change Email:**
```dart
email: 'newemail@example.com',
```
⚠️ **Remember:** Also update `contact_info.dart` to keep Contact Section in sync!

**Update Bio:**
```dart
bio: 'Mobile App Developer specializing in Flutter and native Android development. '
     'Building beautiful, performant apps that users love.',
```

**Add More Skills:**
```dart
skills: [
  'Flutter',
  'Dart',
  'React Native',
  'Swift',
  'Kotlin',
  'Firebase',
  'GraphQL',
  'Docker',
  'AWS',
  'MongoDB',
],
```

**Update Social Links:**
```dart
socialLinks: {
  'GitHub': 'https://github.com/yourusername',
  'LinkedIn': 'https://linkedin.com/in/yourprofile',
  'Twitter': 'https://twitter.com/yourhandle',
  'Instagram': 'https://instagram.com/yourprofile',
  'Portfolio': 'https://yourwebsite.com',
  'Email': 'mailto:your.email@example.com',
},
```
⚠️ **Remember:** Also update `social_link.dart` to keep social links consistent throughout the app!

---

## Editing Social Media Links

**File:** `lib/data/models/social_link.dart`

### Adding/Editing Social Links

```dart
static List<SocialLink> get fallback => const [
  SocialLink(
    id: '1',
    platform: 'linkedin',                 // Platform identifier
    label: 'LinkedIn',                    // Display name
    url: 'https://linkedin.com/in/your-profile',  // Your profile URL
    icon: 'linkedin',                     // Icon identifier
    color: '#0077b5',                     // Brand color (hex)
  ),
  SocialLink(
    id: '2',
    platform: 'github',
    label: 'GitHub',
    url: 'https://github.com/yourusername',
    icon: 'github',
    color: '#333',
  ),
  SocialLink(
    id: '3',
    platform: 'email',
    label: 'Email',
    url: 'mailto:your.email@example.com',  // Use mailto: for email
    icon: 'email',
    color: '#ea4335',
  ),
  SocialLink(
    id: '4',
    platform: 'twitter',
    label: 'Twitter',
    url: 'https://twitter.com/yourusername',
    icon: 'twitter',
    color: '#1DA1F2',
  ),
  // Add more social links as needed...
];
```

### Supported Platforms

You can add any social platform. Common ones:
- `linkedin` - LinkedIn profile
- `github` - GitHub profile
- `email` - Email address (use `mailto:`)
- `facebook` - Facebook profile
- `instagram` - Instagram profile
- `twitter` - Twitter/X profile
- `youtube` - YouTube channel
- `dribbble` - Dribbble portfolio
- `behance` - Behance portfolio
- `medium` - Medium blog

### Finding Brand Colors

Search for "{platform} brand color hex" to find official colors, or use:
- LinkedIn: `#0077b5`
- GitHub: `#333333` or `#181717`
- Twitter/X: `#1DA1F2`
- Facebook: `#1877F2`
- Instagram: `#E4405F`
- Email: `#ea4335` (Gmail red)

---

## Editing Contact Information

**File:** `lib/data/models/contact_info.dart`

The "Let's Connect" section at the bottom of your portfolio.

### Editing Contact Info

```dart
static ContactInfo get fallback => const ContactInfo(
  id: 'fallback',
  email: 'your.email@example.com',        // Your email
  phone: '+1 (555) 123-4567',             // Your phone (optional)
  location: 'Your City, Country',         // Your location
  availability: 'Available for freelance',  // Your current status
  headline: "Let's Create Something Amazing",  // Section headline
  subheadline:
      'Have a project in mind? Let\'s discuss how we can work together to bring your vision to life.',  // Call to action text
);
```

### Availability Examples

- `'Available for freelance work'`
- `'Open to opportunities'`
- `'Currently employed, open to consulting'`
- `'Available for full-time roles'`
- `'Open to collaborations'`

---

## Managing Images

### ⚠️ CRITICAL: Asset Path Rules

**Before adding or referencing any images, read these rules carefully:**

1. **Always use FULL paths with `assets/` prefix** in your code:
   ```dart
   // ✅ CORRECT
   thumbnail: 'assets/images/projects/my_project/dashboard.png',
   
   // ❌ WRONG - Missing 'assets/' prefix
   thumbnail: 'images/projects/my_project/dashboard.png',
   ```

2. **NEVER use spaces in filenames** - they cause issues on Flutter Web:
   ```bash
   # ✅ CORRECT
   my_project_logo.png
   organization_logo.png
   
   # ❌ WRONG - Spaces cause %2520 encoding errors
   My Project Logo.png
   Organization Logo.png
   ```

3. **Register subdirectories in `pubspec.yaml`**:
   ```yaml
   assets:
     - assets/images/
     - assets/images/org_logos/
     - assets/images/projects/my_project/    # Each subdirectory must be listed!
   ```
   Flutter does NOT recursively include subdirectories.

4. **Test on BOTH web and mobile** before considering it done:
   ```bash
   # Test on web
   flutter run -d chrome
   
   # Build and test on mobile
   flutter build apk
   ```

---

### Image Organization

Organize your images in the `assets/images/` folder:

```
assets/images/
├── logo.png              # App logo
├── icon.png              # App icon
├── profile.png           # Your profile photo
├── projects/             # Project images
│   ├── project1/
│   │   └── dashboard.png
│   ├── project2/
│   │   └── dashboard.png
│   └── ...
└── hackathons/           # Hackathon images
    ├── hackathon1/
    │   └── dashboard.png
    ├── hackathon2/
    │   └── dashboard.png
    └── ...
```

### Adding New Images

1. **Place your image** in the appropriate folder
2. **Reference it** in your model files:
   ```dart
   thumbnail: 'assets/images/projects/my_project/dashboard.png',
   ```

### Image Best Practices

- **Format**: PNG or JPG
- **Size**: Keep under 500KB for fast loading
- **Dimensions**: 
  - Projects/Hackathons: 400-800px wide
  - Profile: 300-500px square
  - Logo: 200-400px wide
- **Naming**: Use lowercase with underscores (e.g., `my_project.png`)

### Updating App Icon & Logo

1. Replace `assets/images/icon.png` with your new icon (1024x1024 recommended)
2. Replace `assets/images/logo.png` with your new logo
3. Run these commands to regenerate:

```bash
flutter pub run flutter_launcher_icons
flutter pub run flutter_native_splash:create
```

---

## Regenerating Code

After editing **Freezed model files**, you need to regenerate the generated code. Note that **User Profile does NOT require regeneration** because it doesn't use Freezed.

### When to Regenerate

Run this command after:
- Adding/removing fields from **Freezed models** (Project, Hackathon, Skill, Experience, Certification, HeroContent, AboutContent, SocialLink, ContactInfo)
- Changing model structure
- First time setup
- If you see "part of" errors

**Models that require regeneration:**
- `project.dart`
- `hackathon.dart`
- `skill.dart`
- `experience.dart`
- `certification.dart`
- `hero_content.dart`
- `about_content.dart`
- `social_link.dart`
- `contact_info.dart`

**Models that do NOT require regeneration:**
- `user_profile.dart` - This is a simple class without Freezed

### How to Regenerate

```bash
# Run build_runner to regenerate code
dart run build_runner build --delete-conflicting-outputs
```

Or use the watch mode for automatic regeneration:

```bash
# Watches for changes and regenerates automatically
dart run build_runner watch --delete-conflicting-outputs
```

### What Gets Generated?

- `*.freezed.dart` - Freezed code (immutable models, copyWith, etc.)
- `*.g.dart` - JSON serialization code

**Note:** These are generated files. Never edit them directly!

---

## Testing Your Changes

After making edits:

1. **Save all files**
2. **Regenerate if needed** (see Regenerating Code section)
3. **Run the app**:
   ```bash
   # For web testing (fastest)
   flutter run -d chrome
   
   # For Android
   flutter run
   
   # For specific device
   flutter run -d <device-id>
   ```
4. **Hot reload** (`r` in terminal) to see changes without restarting
5. **Hot restart** (`R` in terminal) if hot reload doesn't work

### Testing Workflow by Change Type

| What You Changed | Testing Steps |
|------------------|---------------|
| Text content (titles, descriptions) | 1. Hot reload (`r`) <br> 2. Verify text appears correctly |
| Images or assets | 1. Hot restart (`R`) or full restart <br> 2. Test on web (`flutter run -d chrome`) <br> 3. Build APK and test on mobile device |
| Model structure (added/removed fields) | 1. Run `dart run build_runner build --delete-conflicting-outputs` <br> 2. Full restart <br> 3. Check for compilation errors |
| User Profile | 1. Hot reload (`r`) - no regeneration needed <br> 2. Verify in Profile screen |
| Asset paths or pubspec.yaml | 1. Stop app <br> 2. Run `flutter clean` <br> 3. Run `flutter pub get` <br> 4. Full restart <br> 5. Test on BOTH web and mobile |

### Platform-Specific Testing

**Web Testing (Chrome):**
- Fastest for quick iterations
- Good for checking layout and content
- May not catch mobile-specific issues (like external URL links)
- Watch console for `%2520` errors (indicates spaces in asset filenames)

**Mobile Testing (Android/iOS):**
- **Required for:**
  - Testing asset loading (images may load on web but fail on mobile)
  - External link handling (social media links, project URLs)
  - Touch interactions and gestures
  - Performance testing
- **After changes to:**
  - Asset paths or filenames
  - AndroidManifest.xml or Info.plist
  - pubspec.yaml assets section

**Complete Testing Checklist:**
- [ ] Changes work on web (`flutter run -d chrome`)
- [ ] Build APK succeeds (`flutter build apk`)
- [ ] APK installs on physical device
- [ ] All images load correctly on mobile
- [ ] External links open properly on mobile
- [ ] No console errors or warnings
- [ ] Smooth animations and no janky scrolling

---

## Common Issues & Solutions

### Issue: "Part of" Errors

**Cause:** Model structure changed but generated code wasn't regenerated.

**Solution:** Run the build_runner command:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Issue: Images Not Showing (General)

**Possible Causes:**
1. Wrong file path (missing `assets/` prefix)
2. Image file doesn't exist
3. Not registered in pubspec.yaml

**Solutions:**
1. **Check path format:**
   ```dart
   // ✅ CORRECT
   thumbnail: 'assets/images/projects/my_project/dashboard.png',
   
   // ❌ WRONG
   thumbnail: 'images/projects/my_project/dashboard.png',
   ```

2. **Verify file exists:**
   ```bash
   # Windows PowerShell
   Test-Path "assets\images\projects\my_project\dashboard.png"
   ```

3. **Register in pubspec.yaml:**
   ```yaml
   assets:
     - assets/images/
     - assets/images/projects/my_project/
   ```

4. **Clean and rebuild:**
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

### Issue: Images Show on Web but Not on Mobile

**Cause:** This is the #1 most common issue. Usually caused by:
- Missing `assets/` prefix in image paths
- Spaces in filenames causing encoding issues
- Subdirectories not registered in pubspec.yaml

**Solutions:**
1. **Use FULL paths with `assets/` prefix everywhere**
2. **Remove spaces from filenames:**
   ```bash
   # Rename files to use underscores
   Rename-Item "My Logo.png" "my_logo.png"
   ```
3. **Explicitly list subdirectories in pubspec.yaml**
4. **Always test on both platforms:**
   ```bash
   # Test web
   flutter run -d chrome
   
   # Build and test mobile
   flutter build apk
   # Install APK on device and test
   ```

### Issue: `%2520` Errors in Console (Web)

**Cause:** Spaces in asset filenames get double-encoded on Flutter Web.

**Solution:** Rename all asset files to use underscores instead of spaces:
```bash
# Example in PowerShell
Rename-Item "assets\images\org_logos\GG Logo.png" "gg_logo.png"
```

Then update all references in code:
```dart
// Before
return 'assets/images/org_logos/GG Logo.png';

// After
return 'assets/images/org_logos/gg_logo.png';
```

### Issue: Social Media Links Don't Work on Mobile

**Cause:** Android 11+ requires explicit intent queries in AndroidManifest.xml.

**Solution:** Ensure `android/app/src/main/AndroidManifest.xml` includes:
```xml
<queries>
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

### Issue: Asset Not Found After Adding New Image

**Cause:** Subdirectory not registered in pubspec.yaml.

**Solution:** Add the specific subdirectory:
```yaml
# pubspec.yaml
assets:
  - assets/images/
  - assets/images/projects/my_new_project/  # Add this line
```

Then clean and restart:
```bash
flutter clean
flutter pub get
flutter run
```

### Issue: Changes Not Appearing

**Solutions:**
1. Try hot reload (`r` in terminal)
2. Try hot restart (`R` in terminal)
3. Stop and restart the app completely

### Issue: Build Errors After Changes

**Solutions:**
1. Check for syntax errors (missing commas, quotes, etc.)
2. Regenerate code with build_runner
3. Run `flutter clean` then `flutter pub get`

---

## Pro Tips

### 1. Keep Data Consistent

- Use consistent ID formats (`project-1`, `project-2`, etc.)
- Keep dates in the same format (e.g., "February 2024")
- Use similar description lengths for better UI consistency

### 2. Optimize Images

Before adding images:
- Compress them using tools like TinyPNG
- Resize to appropriate dimensions
- Use WebP format for better compression (if supported)

### 3. Test on Multiple Devices

Your portfolio should look good everywhere:
```bash
# Test on different screen sizes in Chrome DevTools
flutter run -d chrome

# Test on Android emulator
flutter run -d emulator

# Test on iOS simulator (macOS only)
flutter run -d simulator
```

### 4. Use Version Control

Track your changes with Git:
```bash
git add .
git commit -m "Updated portfolio content"
git push
```

### 5. Backup Your Content

Keep a backup of your model files before making major changes.

---

## Quick Reference

### File Locations

| What to Edit | File Location |
|--------------|---------------|
| Projects | `lib/data/models/project.dart` |
| Hackathons | `lib/data/models/hackathon.dart` |
| Skills | `lib/data/models/skill.dart` |
| Experiences | `lib/data/models/experience.dart` |
| Certifications | `lib/data/models/certification.dart` |
| Hero Section | `lib/data/models/hero_content.dart` |
| About Section | `lib/data/models/about_content.dart` |
| User Profile | `lib/data/models/user_profile.dart` |
| Social Links | `lib/data/models/social_link.dart` |
| Contact Info | `lib/data/models/contact_info.dart` |

### Common Commands

| Action | Command |
|--------|---------|
| Install dependencies | `flutter pub get` |
| Run app | `flutter run` |
| Build APK | `flutter build apk` |
| Regenerate code | `dart run build_runner build --delete-conflicting-outputs` |
| Clean project | `flutter clean` |
| Update icons | `flutter pub run flutter_launcher_icons` |

---

## Need Help?

If you're stuck or have questions:

1. Check the [Flutter documentation](https://docs.flutter.dev/)
2. Review the [Dart language tour](https://dart.dev/guides/language/language-tour)
3. Check for syntax errors in your code editor
4. Make sure all commas, quotes, and brackets are balanced

---

**Happy customizing! 🚀**

*Remember: Your portfolio is a reflection of you. Make it unique, keep it updated, and let your work speak for itself!*
