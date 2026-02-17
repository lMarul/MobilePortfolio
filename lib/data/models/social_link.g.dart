// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialLink _$SocialLinkFromJson(Map<String, dynamic> json) => _SocialLink(
  id: json['_id'] as String?,
  platform: json['platform'] as String?,
  name: json['name'] as String?,
  url: json['url'] as String?,
  href: json['href'] as String?,
  icon: json['icon'] as String?,
  username: json['username'] as String?,
  label: json['label'] as String?,
  color: json['color'] as String?,
  isActive: json['isActive'] as bool?,
  order: (json['order'] as num?)?.toDouble(),
  creationTime: (json['_creationTime'] as num?)?.toDouble(),
);

Map<String, dynamic> _$SocialLinkToJson(_SocialLink instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'platform': instance.platform,
      'name': instance.name,
      'url': instance.url,
      'href': instance.href,
      'icon': instance.icon,
      'username': instance.username,
      'label': instance.label,
      'color': instance.color,
      'isActive': instance.isActive,
      'order': instance.order,
      '_creationTime': instance.creationTime,
    };
