// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Skill _$SkillFromJson(Map<String, dynamic> json) => _Skill(
  id: json['_id'] as String,
  creationTime: (json['_creationTime'] as num).toDouble(),
  name: json['name'] as String,
  category: json['category'] as String,
  imageUrl: json['img'] as String,
);

Map<String, dynamic> _$SkillToJson(_Skill instance) => <String, dynamic>{
  '_id': instance.id,
  '_creationTime': instance.creationTime,
  'name': instance.name,
  'category': instance.category,
  'img': instance.imageUrl,
};

_SkillCategory _$SkillCategoryFromJson(Map<String, dynamic> json) =>
    _SkillCategory(
      name: json['name'] as String,
      icon: json['icon'] as String,
      skills:
          (json['skills'] as List<dynamic>?)
              ?.map((e) => Skill.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SkillCategoryToJson(_SkillCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'skills': instance.skills,
    };
