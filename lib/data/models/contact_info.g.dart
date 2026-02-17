// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) => _ContactInfo(
  id: json['id'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
  location: json['location'] as String?,
  availability: json['availability'] as String,
  headline: json['headline'] as String,
  subheadline: json['subheadline'] as String,
);

Map<String, dynamic> _$ContactInfoToJson(_ContactInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone': instance.phone,
      'location': instance.location,
      'availability': instance.availability,
      'headline': instance.headline,
      'subheadline': instance.subheadline,
    };
