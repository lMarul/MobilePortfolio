// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Certification {

@JsonKey(name: '_id') String get id;@JsonKey(name: '_creationTime') double get creationTime; String get title; String get issuer; String get date; String get credentialId; String? get url; String get iconType; String get color; String get glowColor; List<String> get skills;
/// Create a copy of Certification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CertificationCopyWith<Certification> get copyWith => _$CertificationCopyWithImpl<Certification>(this as Certification, _$identity);

  /// Serializes this Certification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Certification&&(identical(other.id, id) || other.id == id)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&(identical(other.title, title) || other.title == title)&&(identical(other.issuer, issuer) || other.issuer == issuer)&&(identical(other.date, date) || other.date == date)&&(identical(other.credentialId, credentialId) || other.credentialId == credentialId)&&(identical(other.url, url) || other.url == url)&&(identical(other.iconType, iconType) || other.iconType == iconType)&&(identical(other.color, color) || other.color == color)&&(identical(other.glowColor, glowColor) || other.glowColor == glowColor)&&const DeepCollectionEquality().equals(other.skills, skills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationTime,title,issuer,date,credentialId,url,iconType,color,glowColor,const DeepCollectionEquality().hash(skills));

@override
String toString() {
  return 'Certification(id: $id, creationTime: $creationTime, title: $title, issuer: $issuer, date: $date, credentialId: $credentialId, url: $url, iconType: $iconType, color: $color, glowColor: $glowColor, skills: $skills)';
}


}

/// @nodoc
abstract mixin class $CertificationCopyWith<$Res>  {
  factory $CertificationCopyWith(Certification value, $Res Function(Certification) _then) = _$CertificationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id,@JsonKey(name: '_creationTime') double creationTime, String title, String issuer, String date, String credentialId, String? url, String iconType, String color, String glowColor, List<String> skills
});




}
/// @nodoc
class _$CertificationCopyWithImpl<$Res>
    implements $CertificationCopyWith<$Res> {
  _$CertificationCopyWithImpl(this._self, this._then);

  final Certification _self;
  final $Res Function(Certification) _then;

/// Create a copy of Certification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creationTime = null,Object? title = null,Object? issuer = null,Object? date = null,Object? credentialId = null,Object? url = freezed,Object? iconType = null,Object? color = null,Object? glowColor = null,Object? skills = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as double,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,issuer: null == issuer ? _self.issuer : issuer // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,credentialId: null == credentialId ? _self.credentialId : credentialId // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,iconType: null == iconType ? _self.iconType : iconType // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,glowColor: null == glowColor ? _self.glowColor : glowColor // ignore: cast_nullable_to_non_nullable
as String,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Certification].
extension CertificationPatterns on Certification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Certification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Certification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Certification value)  $default,){
final _that = this;
switch (_that) {
case _Certification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Certification value)?  $default,){
final _that = this;
switch (_that) {
case _Certification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id, @JsonKey(name: '_creationTime')  double creationTime,  String title,  String issuer,  String date,  String credentialId,  String? url,  String iconType,  String color,  String glowColor,  List<String> skills)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Certification() when $default != null:
return $default(_that.id,_that.creationTime,_that.title,_that.issuer,_that.date,_that.credentialId,_that.url,_that.iconType,_that.color,_that.glowColor,_that.skills);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id, @JsonKey(name: '_creationTime')  double creationTime,  String title,  String issuer,  String date,  String credentialId,  String? url,  String iconType,  String color,  String glowColor,  List<String> skills)  $default,) {final _that = this;
switch (_that) {
case _Certification():
return $default(_that.id,_that.creationTime,_that.title,_that.issuer,_that.date,_that.credentialId,_that.url,_that.iconType,_that.color,_that.glowColor,_that.skills);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id, @JsonKey(name: '_creationTime')  double creationTime,  String title,  String issuer,  String date,  String credentialId,  String? url,  String iconType,  String color,  String glowColor,  List<String> skills)?  $default,) {final _that = this;
switch (_that) {
case _Certification() when $default != null:
return $default(_that.id,_that.creationTime,_that.title,_that.issuer,_that.date,_that.credentialId,_that.url,_that.iconType,_that.color,_that.glowColor,_that.skills);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Certification implements Certification {
  const _Certification({@JsonKey(name: '_id') required this.id, @JsonKey(name: '_creationTime') required this.creationTime, required this.title, required this.issuer, required this.date, required this.credentialId, this.url, required this.iconType, required this.color, required this.glowColor, final  List<String> skills = const []}): _skills = skills;
  factory _Certification.fromJson(Map<String, dynamic> json) => _$CertificationFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override@JsonKey(name: '_creationTime') final  double creationTime;
@override final  String title;
@override final  String issuer;
@override final  String date;
@override final  String credentialId;
@override final  String? url;
@override final  String iconType;
@override final  String color;
@override final  String glowColor;
 final  List<String> _skills;
@override@JsonKey() List<String> get skills {
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skills);
}


/// Create a copy of Certification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CertificationCopyWith<_Certification> get copyWith => __$CertificationCopyWithImpl<_Certification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CertificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Certification&&(identical(other.id, id) || other.id == id)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&(identical(other.title, title) || other.title == title)&&(identical(other.issuer, issuer) || other.issuer == issuer)&&(identical(other.date, date) || other.date == date)&&(identical(other.credentialId, credentialId) || other.credentialId == credentialId)&&(identical(other.url, url) || other.url == url)&&(identical(other.iconType, iconType) || other.iconType == iconType)&&(identical(other.color, color) || other.color == color)&&(identical(other.glowColor, glowColor) || other.glowColor == glowColor)&&const DeepCollectionEquality().equals(other._skills, _skills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationTime,title,issuer,date,credentialId,url,iconType,color,glowColor,const DeepCollectionEquality().hash(_skills));

@override
String toString() {
  return 'Certification(id: $id, creationTime: $creationTime, title: $title, issuer: $issuer, date: $date, credentialId: $credentialId, url: $url, iconType: $iconType, color: $color, glowColor: $glowColor, skills: $skills)';
}


}

/// @nodoc
abstract mixin class _$CertificationCopyWith<$Res> implements $CertificationCopyWith<$Res> {
  factory _$CertificationCopyWith(_Certification value, $Res Function(_Certification) _then) = __$CertificationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id,@JsonKey(name: '_creationTime') double creationTime, String title, String issuer, String date, String credentialId, String? url, String iconType, String color, String glowColor, List<String> skills
});




}
/// @nodoc
class __$CertificationCopyWithImpl<$Res>
    implements _$CertificationCopyWith<$Res> {
  __$CertificationCopyWithImpl(this._self, this._then);

  final _Certification _self;
  final $Res Function(_Certification) _then;

/// Create a copy of Certification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creationTime = null,Object? title = null,Object? issuer = null,Object? date = null,Object? credentialId = null,Object? url = freezed,Object? iconType = null,Object? color = null,Object? glowColor = null,Object? skills = null,}) {
  return _then(_Certification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as double,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,issuer: null == issuer ? _self.issuer : issuer // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,credentialId: null == credentialId ? _self.credentialId : credentialId // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,iconType: null == iconType ? _self.iconType : iconType // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,glowColor: null == glowColor ? _self.glowColor : glowColor // ignore: cast_nullable_to_non_nullable
as String,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
