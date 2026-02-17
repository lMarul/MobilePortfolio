// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hackathon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HackathonLinks _$HackathonLinksFromJson(Map<String, dynamic> json) =>
    _HackathonLinks(
      github: json['github'] as String?,
      demo: json['demo'] as String?,
      social: json['social'] as String?,
    );

Map<String, dynamic> _$HackathonLinksToJson(_HackathonLinks instance) =>
    <String, dynamic>{
      'github': instance.github,
      'demo': instance.demo,
      'social': instance.social,
    };

_Hackathon _$HackathonFromJson(Map<String, dynamic> json) => _Hackathon(
  id: json['_id'] as String,
  creationTime: (json['_creationTime'] as num).toDouble(),
  title: json['title'] as String,
  organizer: json['organizer'] as String,
  description: json['description'] as String,
  date: json['date'] as String,
  thumbnail: json['thumbnail'] as String,
  gallery:
      (json['gallery'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  links: HackathonLinks.fromJson(json['links'] as Map<String, dynamic>),
);

Map<String, dynamic> _$HackathonToJson(_Hackathon instance) =>
    <String, dynamic>{
      '_id': instance.id,
      '_creationTime': instance.creationTime,
      'title': instance.title,
      'organizer': instance.organizer,
      'description': instance.description,
      'date': instance.date,
      'thumbnail': instance.thumbnail,
      'gallery': instance.gallery,
      'tags': instance.tags,
      'links': instance.links,
    };
