// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hero_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HeroContent {

@JsonKey(name: '_id') String? get id; String? get title; String? get subtitle; String? get description; List<String> get roles; String? get ctaText; String? get ctaLink; String? get secondaryCtaText; String? get secondaryCtaLink;
/// Create a copy of HeroContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeroContentCopyWith<HeroContent> get copyWith => _$HeroContentCopyWithImpl<HeroContent>(this as HeroContent, _$identity);

  /// Serializes this HeroContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HeroContent&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.roles, roles)&&(identical(other.ctaText, ctaText) || other.ctaText == ctaText)&&(identical(other.ctaLink, ctaLink) || other.ctaLink == ctaLink)&&(identical(other.secondaryCtaText, secondaryCtaText) || other.secondaryCtaText == secondaryCtaText)&&(identical(other.secondaryCtaLink, secondaryCtaLink) || other.secondaryCtaLink == secondaryCtaLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,description,const DeepCollectionEquality().hash(roles),ctaText,ctaLink,secondaryCtaText,secondaryCtaLink);

@override
String toString() {
  return 'HeroContent(id: $id, title: $title, subtitle: $subtitle, description: $description, roles: $roles, ctaText: $ctaText, ctaLink: $ctaLink, secondaryCtaText: $secondaryCtaText, secondaryCtaLink: $secondaryCtaLink)';
}


}

/// @nodoc
abstract mixin class $HeroContentCopyWith<$Res>  {
  factory $HeroContentCopyWith(HeroContent value, $Res Function(HeroContent) _then) = _$HeroContentCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? title, String? subtitle, String? description, List<String> roles, String? ctaText, String? ctaLink, String? secondaryCtaText, String? secondaryCtaLink
});




}
/// @nodoc
class _$HeroContentCopyWithImpl<$Res>
    implements $HeroContentCopyWith<$Res> {
  _$HeroContentCopyWithImpl(this._self, this._then);

  final HeroContent _self;
  final $Res Function(HeroContent) _then;

/// Create a copy of HeroContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? subtitle = freezed,Object? description = freezed,Object? roles = null,Object? ctaText = freezed,Object? ctaLink = freezed,Object? secondaryCtaText = freezed,Object? secondaryCtaLink = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,ctaText: freezed == ctaText ? _self.ctaText : ctaText // ignore: cast_nullable_to_non_nullable
as String?,ctaLink: freezed == ctaLink ? _self.ctaLink : ctaLink // ignore: cast_nullable_to_non_nullable
as String?,secondaryCtaText: freezed == secondaryCtaText ? _self.secondaryCtaText : secondaryCtaText // ignore: cast_nullable_to_non_nullable
as String?,secondaryCtaLink: freezed == secondaryCtaLink ? _self.secondaryCtaLink : secondaryCtaLink // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HeroContent].
extension HeroContentPatterns on HeroContent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HeroContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HeroContent() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HeroContent value)  $default,){
final _that = this;
switch (_that) {
case _HeroContent():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HeroContent value)?  $default,){
final _that = this;
switch (_that) {
case _HeroContent() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? title,  String? subtitle,  String? description,  List<String> roles,  String? ctaText,  String? ctaLink,  String? secondaryCtaText,  String? secondaryCtaLink)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HeroContent() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.description,_that.roles,_that.ctaText,_that.ctaLink,_that.secondaryCtaText,_that.secondaryCtaLink);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? title,  String? subtitle,  String? description,  List<String> roles,  String? ctaText,  String? ctaLink,  String? secondaryCtaText,  String? secondaryCtaLink)  $default,) {final _that = this;
switch (_that) {
case _HeroContent():
return $default(_that.id,_that.title,_that.subtitle,_that.description,_that.roles,_that.ctaText,_that.ctaLink,_that.secondaryCtaText,_that.secondaryCtaLink);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? title,  String? subtitle,  String? description,  List<String> roles,  String? ctaText,  String? ctaLink,  String? secondaryCtaText,  String? secondaryCtaLink)?  $default,) {final _that = this;
switch (_that) {
case _HeroContent() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.description,_that.roles,_that.ctaText,_that.ctaLink,_that.secondaryCtaText,_that.secondaryCtaLink);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HeroContent implements HeroContent {
  const _HeroContent({@JsonKey(name: '_id') this.id, this.title, this.subtitle, this.description, final  List<String> roles = const [], this.ctaText, this.ctaLink, this.secondaryCtaText, this.secondaryCtaLink}): _roles = roles;
  factory _HeroContent.fromJson(Map<String, dynamic> json) => _$HeroContentFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? title;
@override final  String? subtitle;
@override final  String? description;
 final  List<String> _roles;
@override@JsonKey() List<String> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

@override final  String? ctaText;
@override final  String? ctaLink;
@override final  String? secondaryCtaText;
@override final  String? secondaryCtaLink;

/// Create a copy of HeroContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeroContentCopyWith<_HeroContent> get copyWith => __$HeroContentCopyWithImpl<_HeroContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HeroContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HeroContent&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._roles, _roles)&&(identical(other.ctaText, ctaText) || other.ctaText == ctaText)&&(identical(other.ctaLink, ctaLink) || other.ctaLink == ctaLink)&&(identical(other.secondaryCtaText, secondaryCtaText) || other.secondaryCtaText == secondaryCtaText)&&(identical(other.secondaryCtaLink, secondaryCtaLink) || other.secondaryCtaLink == secondaryCtaLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,description,const DeepCollectionEquality().hash(_roles),ctaText,ctaLink,secondaryCtaText,secondaryCtaLink);

@override
String toString() {
  return 'HeroContent(id: $id, title: $title, subtitle: $subtitle, description: $description, roles: $roles, ctaText: $ctaText, ctaLink: $ctaLink, secondaryCtaText: $secondaryCtaText, secondaryCtaLink: $secondaryCtaLink)';
}


}

/// @nodoc
abstract mixin class _$HeroContentCopyWith<$Res> implements $HeroContentCopyWith<$Res> {
  factory _$HeroContentCopyWith(_HeroContent value, $Res Function(_HeroContent) _then) = __$HeroContentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? title, String? subtitle, String? description, List<String> roles, String? ctaText, String? ctaLink, String? secondaryCtaText, String? secondaryCtaLink
});




}
/// @nodoc
class __$HeroContentCopyWithImpl<$Res>
    implements _$HeroContentCopyWith<$Res> {
  __$HeroContentCopyWithImpl(this._self, this._then);

  final _HeroContent _self;
  final $Res Function(_HeroContent) _then;

/// Create a copy of HeroContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? subtitle = freezed,Object? description = freezed,Object? roles = null,Object? ctaText = freezed,Object? ctaLink = freezed,Object? secondaryCtaText = freezed,Object? secondaryCtaLink = freezed,}) {
  return _then(_HeroContent(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,ctaText: freezed == ctaText ? _self.ctaText : ctaText // ignore: cast_nullable_to_non_nullable
as String?,ctaLink: freezed == ctaLink ? _self.ctaLink : ctaLink // ignore: cast_nullable_to_non_nullable
as String?,secondaryCtaText: freezed == secondaryCtaText ? _self.secondaryCtaText : secondaryCtaText // ignore: cast_nullable_to_non_nullable
as String?,secondaryCtaLink: freezed == secondaryCtaLink ? _self.secondaryCtaLink : secondaryCtaLink // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
