// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Experience _$ExperienceFromJson(Map<String, dynamic> json) => _Experience(
  id: json['_id'] as String,
  creationTime: (json['_creationTime'] as num).toDouble(),
  title: json['title'] as String,
  organization: json['organization'] as String,
  type: json['type'] as String,
  location: json['location'] as String,
  startDate: json['startDate'] as String,
  endDate: json['endDate'] as String?,
  isCurrent: json['isCurrent'] as bool? ?? false,
  description: json['description'] as String,
  responsibilities:
      (json['responsibilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  achievements:
      (json['achievements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  logo: json['logo'] as String?,
  color: json['color'] as String?,
  technologies:
      (json['technologies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$ExperienceToJson(_Experience instance) =>
    <String, dynamic>{
      '_id': instance.id,
      '_creationTime': instance.creationTime,
      'title': instance.title,
      'organization': instance.organization,
      'type': instance.type,
      'location': instance.location,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'isCurrent': instance.isCurrent,
      'description': instance.description,
      'responsibilities': instance.responsibilities,
      'achievements': instance.achievements,
      'logo': instance.logo,
      'color': instance.color,
      'technologies': instance.technologies,
    };
