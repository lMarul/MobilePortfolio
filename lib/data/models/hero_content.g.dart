// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HeroContent _$HeroContentFromJson(Map<String, dynamic> json) => _HeroContent(
  id: json['_id'] as String?,
  title: json['title'] as String?,
  subtitle: json['subtitle'] as String?,
  description: json['description'] as String?,
  roles:
      (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  ctaText: json['ctaText'] as String?,
  ctaLink: json['ctaLink'] as String?,
  secondaryCtaText: json['secondaryCtaText'] as String?,
  secondaryCtaLink: json['secondaryCtaLink'] as String?,
);

Map<String, dynamic> _$HeroContentToJson(_HeroContent instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'description': instance.description,
      'roles': instance.roles,
      'ctaText': instance.ctaText,
      'ctaLink': instance.ctaLink,
      'secondaryCtaText': instance.secondaryCtaText,
      'secondaryCtaLink': instance.secondaryCtaLink,
    };
