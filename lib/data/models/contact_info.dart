import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_info.freezed.dart';
part 'contact_info.g.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 📧 CONTACT INFO MODEL
/// ═══════════════════════════════════════════════════════════════════════════

@freezed
sealed class ContactInfo with _$ContactInfo {
  const factory ContactInfo({
    required String id,
    required String email,
    String? phone,
    String? location,
    required String availability,
    required String headline,
    required String subheadline,
  }) = _ContactInfo;

  factory ContactInfo.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoFromJson(json);

  static ContactInfo get fallback => const ContactInfo(
        id: 'fallback',
        email: 'marwinjohngonzales@gmail.com',
        phone: '09687002559',
        location: 'Taguig City',
        availability: 'Available for freelance',
        headline: "Let's Create Something Amazing",
        subheadline:
            "Have a project in mind? Let's discuss how we can work together to bring your vision to life.",
      );
}
