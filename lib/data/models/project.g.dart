// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectLinks _$ProjectLinksFromJson(Map<String, dynamic> json) =>
    _ProjectLinks(
      github: json['github'] as String?,
      demo: json['demo'] as String?,
      live: json['live'] as String?,
    );

Map<String, dynamic> _$ProjectLinksToJson(_ProjectLinks instance) =>
    <String, dynamic>{
      'github': instance.github,
      'demo': instance.demo,
      'live': instance.live,
    };

_Project _$ProjectFromJson(Map<String, dynamic> json) => _Project(
  id: json['_id'] as String,
  creationTime: (json['_creationTime'] as num).toDouble(),
  title: json['title'] as String,
  category: json['category'] as String,
  description: json['description'] as String,
  thumbnail: json['thumbnail'] as String,
  gallery: (json['gallery'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  date: json['date'] as String,
  links: ProjectLinks.fromJson(json['links'] as Map<String, dynamic>),
  createdAt: (json['createdAt'] as num?)?.toInt(),
  isFeatured: json['isFeatured'] as bool? ?? false,
);

Map<String, dynamic> _$ProjectToJson(_Project instance) => <String, dynamic>{
  '_id': instance.id,
  '_creationTime': instance.creationTime,
  'title': instance.title,
  'category': instance.category,
  'description': instance.description,
  'thumbnail': instance.thumbnail,
  'gallery': instance.gallery,
  'tags': instance.tags,
  'date': instance.date,
  'links': instance.links,
  'createdAt': instance.createdAt,
  'isFeatured': instance.isFeatured,
};
