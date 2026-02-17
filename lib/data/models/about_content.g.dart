// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AboutContent _$AboutContentFromJson(Map<String, dynamic> json) =>
    _AboutContent(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      paragraphs:
          (json['paragraphs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      imageUrl: json['imageUrl'] as String?,
      highlights:
          (json['highlights'] as List<dynamic>?)
              ?.map((e) => AboutHighlight.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      stats: json['stats'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AboutContentToJson(_AboutContent instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'paragraphs': instance.paragraphs,
      'imageUrl': instance.imageUrl,
      'highlights': instance.highlights,
      'stats': instance.stats,
    };

_AboutHighlight _$AboutHighlightFromJson(Map<String, dynamic> json) =>
    _AboutHighlight(
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      value: json['value'] as String?,
      description: json['description'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$AboutHighlightToJson(_AboutHighlight instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'title': instance.title,
      'value': instance.value,
      'description': instance.description,
      'color': instance.color,
    };

_AboutStat _$AboutStatFromJson(Map<String, dynamic> json) =>
    _AboutStat(label: json['label'] as String, value: json['value'] as String);

Map<String, dynamic> _$AboutStatToJson(_AboutStat instance) =>
    <String, dynamic>{'label': instance.label, 'value': instance.value};
