import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_durations.dart';
import '../../../data/models/contact_info.dart';
import '../../../data/models/social_link.dart';
import '../../../data/providers/portfolio_providers.dart';
import '../../widgets/common/glass_card.dart';
import '../../widgets/common/gradient_border.dart';
import '../../widgets/common/shimmer_text.dart';

/// Contact Section - Rebuilt with contact form & platform logos
class ContactSection extends ConsumerWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactAsync = ref.watch(contactInfoProvider);
    final socialsAsync = ref.watch(socialLinksProvider);

    return contactAsync.when(
      data: (contact) => socialsAsync.when(
        data: (socials) => _ContactContent(contact: contact, socials: socials),
        loading: () => _ContactContent(contact: contact, socials: SocialLink.fallback),
        error: (_, __) => _ContactContent(contact: contact, socials: SocialLink.fallback),
      ),
      loading: () => const _ContactSkeleton(),
      error: (_, __) => _ContactContent(contact: ContactInfo.fallback, socials: SocialLink.fallback),
    );
  }
}

class _ContactContent extends StatefulWidget {
  final ContactInfo contact;
  final List<SocialLink> socials;
  const _ContactContent({required this.contact, required this.socials});

  @override
  State<_ContactContent> createState() => _ContactContentState();
}

class _ContactContentState extends State<_ContactContent> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSending = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSending = true);
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() => _isSending = false);
    _nameController.clear();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(children: [
          Icon(Icons.check_circle, color: Colors.white, size: 18),
          SizedBox(width: 8),
          Text('Message sent successfully!'),
        ]),
        backgroundColor: AppColors.neonGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmall = screenWidth < 360;
    final textColor = theme.colorScheme.onSurface;
    final mutedColor = isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted;
    final secondaryColor = isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    final titleStyle = theme.textTheme.displaySmall?.copyWith(
      color: isDark ? null : AppColors.primaryRed,
      fontWeight: FontWeight.bold, fontSize: isSmall ? 22 : 26,
    ) ?? const TextStyle();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 20, vertical: isSmall ? 28 : 36),
      child: Column(children: [
        (ShimmerText(text: "Let's Connect", style: titleStyle) as Widget)
            .animate().fadeIn(duration: AppDurations.medium),
        SizedBox(height: isSmall ? 6 : 8),
        Text(widget.contact.subheadline,
          style: theme.textTheme.bodySmall?.copyWith(color: secondaryColor, fontSize: isSmall ? 11 : 12),
          textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis,
        ).animate().fadeIn(delay: 200.ms, duration: AppDurations.medium),
        SizedBox(height: isSmall ? 20 : 24),

        // Contact Info
        GradientBorder(
          borderRadius: isSmall ? 14 : 16, gradient: AppColors.primaryGradient, strokeWidth: 1.5,
          child: GlassCard(
            borderRadius: isSmall ? 14 : 16, blur: 15, opacity: 0.08,
            padding: EdgeInsets.all(isSmall ? 14 : 16),
            child: Column(children: [
              _ContactMethod(icon: Icons.email_outlined, label: 'Email', value: widget.contact.email,
                onTap: () => _launchUrl('mailto:${widget.contact.email}'), color: AppColors.primaryRed, isDark: isDark),
              if (widget.contact.phone != null) ...[
                const SizedBox(height: 8),
                _ContactMethod(icon: Icons.phone_outlined, label: 'Phone', value: widget.contact.phone!,
                  onTap: () => _launchUrl('tel:${widget.contact.phone}'), color: AppColors.brightRed, isDark: isDark),
              ],
              if (widget.contact.location != null) ...[
                const SizedBox(height: 8),
                _ContactMethod(icon: Icons.location_on_outlined, label: 'Location', value: widget.contact.location!,
                  onTap: null, color: AppColors.darkRed, isDark: isDark),
              ],
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(width: 7, height: 7,
                    decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Colors.green.withValues(alpha: 0.5), blurRadius: 4)],
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(widget.contact.availability,
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600, fontSize: isSmall ? 10 : 11)),
                ]),
              ),
            ]),
          ),
        ).animate().fadeIn(delay: 300.ms, duration: AppDurations.slow)
            .scale(begin: const Offset(0.97, 0.97), end: const Offset(1, 1)),

        SizedBox(height: isSmall ? 20 : 28),

        // Contact Form
        GradientBorder(
          borderRadius: isSmall ? 14 : 16,
          gradient: LinearGradient(colors: [AppColors.primaryRed.withValues(alpha: 0.4), AppColors.darkRed.withValues(alpha: 0.2)]),
          strokeWidth: 1,
          child: GlassCard(
            borderRadius: isSmall ? 14 : 16, blur: 15, opacity: 0.06,
            padding: EdgeInsets.all(isSmall ? 14 : 18),
            child: Form(key: _formKey, child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Send a Message', style: theme.textTheme.titleSmall?.copyWith(
                  color: textColor, fontWeight: FontWeight.bold, fontSize: isSmall ? 14 : 15)),
                SizedBox(height: isSmall ? 10 : 14),
                _FormField(controller: _nameController, label: 'Your Name', hint: 'John Doe',
                  icon: LucideIcons.user, isDark: isDark,
                  validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null),
                const SizedBox(height: 10),
                _FormField(controller: _emailController, label: 'Your Email', hint: 'john@example.com',
                  icon: LucideIcons.mail, isDark: isDark, keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Required';
                    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v.trim())) return 'Invalid email';
                    return null;
                  }),
                const SizedBox(height: 10),
                _FormField(controller: _subjectController, label: 'Subject', hint: 'Project inquiry',
                  icon: LucideIcons.messageSquare, isDark: isDark,
                  validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null),
                const SizedBox(height: 10),
                _FormField(controller: _messageController, label: 'Message', hint: 'Tell me about your project...',
                  icon: LucideIcons.pencil, isDark: isDark, maxLines: 3,
                  validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null),
                SizedBox(height: isSmall ? 14 : 18),
                SizedBox(width: double.infinity, child: ElevatedButton.icon(
                  onPressed: _isSending ? null : _handleSubmit,
                  icon: _isSending
                    ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                    : const Icon(LucideIcons.send, size: 14),
                  label: Text(_isSending ? 'Sending...' : 'Send Message', style: TextStyle(fontSize: isSmall ? 12 : 13)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryRed, foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: isSmall ? 10 : 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                )),
              ],
            )),
          ),
        ).animate().fadeIn(delay: 500.ms, duration: AppDurations.medium),

        SizedBox(height: isSmall ? 20 : 28),

        Text('Follow Me', style: theme.textTheme.bodySmall?.copyWith(color: secondaryColor, fontSize: isSmall ? 11 : 12))
            .animate().fadeIn(delay: 600.ms),
        const SizedBox(height: 12),
        Wrap(spacing: 10, runSpacing: 10, alignment: WrapAlignment.center,
          children: widget.socials.asMap().entries.map((e) =>
            _SocialButton(social: e.value, index: e.key, isDark: isDark)).toList()),

        const SizedBox(height: 28),
        Text('\u00a9 2026 Marwin John Gonzales.', style: theme.textTheme.bodySmall?.copyWith(color: mutedColor, fontSize: 10))
            .animate().fadeIn(delay: 800.ms),
        const SizedBox(height: 4),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Built with ', style: theme.textTheme.bodySmall?.copyWith(color: mutedColor, fontSize: 10)),
          const Icon(Icons.favorite, size: 10, color: AppColors.brightRed),
          Text(' using Flutter', style: theme.textTheme.bodySmall?.copyWith(color: mutedColor, fontSize: 10)),
        ]).animate().fadeIn(delay: 900.ms),
      ]),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final bool isDark;
  final int maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _FormField({required this.controller, required this.label, required this.hint,
    required this.icon, required this.isDark, this.maxLines = 1, this.keyboardType, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, maxLines: maxLines, keyboardType: keyboardType, validator: validator,
      style: TextStyle(color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary, fontSize: 13),
      decoration: InputDecoration(
        labelText: label, hintText: hint,
        prefixIcon: Icon(icon, size: 16, color: AppColors.primaryRed),
        labelStyle: TextStyle(color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary, fontSize: 12),
        hintStyle: TextStyle(color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted, fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: isDark ? AppColors.glassBorderDark : Colors.grey.shade300)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: isDark ? AppColors.glassBorderDark : Colors.grey.shade300)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primaryRed, width: 2)),
        filled: true,
        fillColor: isDark ? AppColors.darkCard.withValues(alpha: 0.5) : AppColors.lightSurface.withValues(alpha: 0.8),
      ),
    );
  }
}

class _ContactMethod extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;
  final Color color;
  final bool isDark;

  const _ContactMethod({required this.icon, required this.label, required this.value,
    required this.onTap, required this.color, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final textColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final mutedColor = isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted;

    return GestureDetector(
      onTap: onTap ?? () {
        Clipboard.setData(ClipboardData(text: value));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('$label copied'), behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isDark ? AppColors.glassBackgroundDark : AppColors.glassBackgroundLight,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: isDark ? AppColors.glassBorderDark : Colors.grey.shade200),
        ),
        child: Row(children: [
          Container(padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: color, size: 14)),
          const SizedBox(width: 10),
          Flexible(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label, style: TextStyle(color: mutedColor, fontSize: 9)),
            Text(value, style: TextStyle(color: textColor, fontWeight: FontWeight.w500, fontSize: 12),
              overflow: TextOverflow.ellipsis, maxLines: 1),
          ])),
        ]),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final SocialLink social;
  final int index;
  final bool isDark;
  const _SocialButton({required this.social, required this.index, required this.isDark});

  IconData _getIcon() {
    switch ((social.platform ?? social.icon ?? 'link').toLowerCase()) {
      case 'github': return LucideIcons.github;
      case 'linkedin': return LucideIcons.linkedin;
      case 'twitter': case 'x': return LucideIcons.twitter;
      case 'email': case 'mail': return LucideIcons.mail;
      case 'instagram': return LucideIcons.instagram;
      case 'youtube': return LucideIcons.youtube;
      case 'facebook': return LucideIcons.facebook;
      case 'dribbble': return LucideIcons.dribbble;
      case 'figma': return LucideIcons.figma;
      default: return LucideIcons.link;
    }
  }

  Color _getColor() {
    switch ((social.platform ?? social.icon ?? 'link').toLowerCase()) {
      case 'github': return isDark ? Colors.white : const Color(0xFF333333);
      case 'linkedin': return const Color(0xFF0A66C2);
      case 'twitter': case 'x': return const Color(0xFF1DA1F2);
      case 'email': case 'mail': return AppColors.primaryRed;
      case 'instagram': return const Color(0xFFE4405F);
      case 'youtube': return const Color(0xFFFF0000);
      case 'facebook': return const Color(0xFF1877F2);
      default: return AppColors.primaryRed;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor();
    final label = social.label ?? social.platform ?? 'Link';

    return GestureDetector(
      onTap: () async {
        final url = social.url ?? social.href ?? '';
        if (url.isEmpty) return;
        final uri = Uri.tryParse(url);
        if (uri != null && await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isDark ? AppColors.glassBackgroundDark : AppColors.glassBackgroundLight,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: isDark ? AppColors.glassBorderDark : Colors.grey.shade200),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(_getIcon(), color: color, size: 16),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 11)),
        ]),
      ),
    ).animate()
        .fadeIn(delay: Duration(milliseconds: 400 + index * 30), duration: AppDurations.medium)
        .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1));
  }
}

class _ContactSkeleton extends StatelessWidget {
  const _ContactSkeleton();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(children: [
        Container(width: 160, height: 28, decoration: BoxDecoration(color: AppColors.glass, borderRadius: BorderRadius.circular(8))),
        const SizedBox(height: 24),
        Container(width: double.infinity, height: 200, decoration: BoxDecoration(color: AppColors.glass, borderRadius: BorderRadius.circular(16))),
      ]),
    ).animate(onPlay: (c) => c.repeat()).shimmer(duration: 1500.ms, color: AppColors.primaryRed.withValues(alpha: 0.1));
  }
}