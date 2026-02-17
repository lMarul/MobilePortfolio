import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/theme_extensions.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 📦 SECTION CONTAINER
/// ═══════════════════════════════════════════════════════════════════════════
/// Consistent wrapper for all home page sections. Solves the "fighting
/// elements" problem by enforcing uniform horizontal padding, vertical
/// breathing room, and an optional animated section header.
///
/// Design rationale:
///  • 20px horizontal padding keeps content away from screen edges while
///    maximizing usable width on phones (360–428dp range).
///  • 40px top / 24px bottom vertical padding creates a clear visual break
///    between sections, preventing the "wall of content" feeling.
///  • Optional [title] and [subtitle] render a standardized section header
///    with Cinzel font and a small red accent bar—matching the cyberpunk
///    aesthetic without taking up excessive vertical space.

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    this.trailing,
    this.padding,
    this.animate = true,
  });

  /// The section body content.
  final Widget child;

  /// Optional section header title (rendered in Cinzel).
  final String? title;

  /// Optional subtitle shown below the title (rendered in Inter).
  final String? subtitle;

  /// Optional trailing widget shown at the right of the header row
  /// (e.g. "View All" button).
  final Widget? trailing;

  /// Custom padding override. Defaults to consistent mobile spacing.
  final EdgeInsetsGeometry? padding;

  /// Whether to animate the section on first appearance.
  final bool animate;

  @override
  Widget build(BuildContext context) {
    final cyberpunk = context.cyberpunk;
    final theme = Theme.of(context);

    Widget content = Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Section Header ──
          if (title != null) ...[
            Row(
              children: [
                // Red accent bar
                Container(
                  width: 3,
                  height: 22,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    gradient: cyberpunk.primaryGradient,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Expanded(
                  child: Text(
                    title!,
                    style: GoogleFonts.cinzel(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.onSurface,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                ?trailing,
              ],
            ),
            // ignore: use_null_aware_elements
            if (subtitle != null) ...[
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  subtitle!,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: cyberpunk.textMuted,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 20),
          ],

          // ── Section Body ──
          child,
        ],
      ),
    );

    if (animate) {
      content = content
          .animate()
          .fadeIn(duration: 500.ms, delay: 100.ms)
          .slideY(begin: 0.05, end: 0, duration: 500.ms, delay: 100.ms);
    }

    return content;
  }
}
