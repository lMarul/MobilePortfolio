// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Certification _$CertificationFromJson(Map<String, dynamic> json) =>
    _Certification(
      id: json['_id'] as String,
      creationTime: (json['_creationTime'] as num).toDouble(),
      title: json['title'] as String,
      issuer: json['issuer'] as String,
      date: json['date'] as String,
      credentialId: json['credentialId'] as String,
      url: json['url'] as String?,
      iconType: json['iconType'] as String,
      color: json['color'] as String,
      glowColor: json['glowColor'] as String,
      skills:
          (json['skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CertificationToJson(_Certification instance) =>
    <String, dynamic>{
      '_id': instance.id,
      '_creationTime': instance.creationTime,
      'title': instance.title,
      'issuer': instance.issuer,
      'date': instance.date,
      'credentialId': instance.credentialId,
      'url': instance.url,
      'iconType': instance.iconType,
      'color': instance.color,
      'glowColor': instance.glowColor,
      'skills': instance.skills,
    };
