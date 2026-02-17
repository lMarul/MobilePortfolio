// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Experience {

@JsonKey(name: '_id') String get id;@JsonKey(name: '_creationTime') double get creationTime; String get title; String get organization; String get type; String get location; String get startDate; String? get endDate; bool get isCurrent; String get description; List<String> get responsibilities; List<String> get achievements; String? get logo; String? get color; List<String> get technologies;
/// Create a copy of Experience
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExperienceCopyWith<Experience> get copyWith => _$ExperienceCopyWithImpl<Experience>(this as Experience, _$identity);

  /// Serializes this Experience to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Experience&&(identical(other.id, id) || other.id == id)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&(identical(other.title, title) || other.title == title)&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.type, type) || other.type == type)&&(identical(other.location, location) || other.location == location)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.responsibilities, responsibilities)&&const DeepCollectionEquality().equals(other.achievements, achievements)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other.technologies, technologies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationTime,title,organization,type,location,startDate,endDate,isCurrent,description,const DeepCollectionEquality().hash(responsibilities),const DeepCollectionEquality().hash(achievements),logo,color,const DeepCollectionEquality().hash(technologies));

@override
String toString() {
  return 'Experience(id: $id, creationTime: $creationTime, title: $title, organization: $organization, type: $type, location: $location, startDate: $startDate, endDate: $endDate, isCurrent: $isCurrent, description: $description, responsibilities: $responsibilities, achievements: $achievements, logo: $logo, color: $color, technologies: $technologies)';
}


}

/// @nodoc
abstract mixin class $ExperienceCopyWith<$Res>  {
  factory $ExperienceCopyWith(Experience value, $Res Function(Experience) _then) = _$ExperienceCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id,@JsonKey(name: '_creationTime') double creationTime, String title, String organization, String type, String location, String startDate, String? endDate, bool isCurrent, String description, List<String> responsibilities, List<String> achievements, String? logo, String? color, List<String> technologies
});




}
/// @nodoc
class _$ExperienceCopyWithImpl<$Res>
    implements $ExperienceCopyWith<$Res> {
  _$ExperienceCopyWithImpl(this._self, this._then);

  final Experience _self;
  final $Res Function(Experience) _then;

/// Create a copy of Experience
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creationTime = null,Object? title = null,Object? organization = null,Object? type = null,Object? location = null,Object? startDate = null,Object? endDate = freezed,Object? isCurrent = null,Object? description = null,Object? responsibilities = null,Object? achievements = null,Object? logo = freezed,Object? color = freezed,Object? technologies = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as double,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,organization: null == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,responsibilities: null == responsibilities ? _self.responsibilities : responsibilities // ignore: cast_nullable_to_non_nullable
as List<String>,achievements: null == achievements ? _self.achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<String>,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,technologies: null == technologies ? _self.technologies : technologies // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Experience].
extension ExperiencePatterns on Experience {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Experience value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Experience() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Experience value)  $default,){
final _that = this;
switch (_that) {
case _Experience():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Experience value)?  $default,){
final _that = this;
switch (_that) {
case _Experience() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id, @JsonKey(name: '_creationTime')  double creationTime,  String title,  String organization,  String type,  String location,  String startDate,  String? endDate,  bool isCurrent,  String description,  List<String> responsibilities,  List<String> achievements,  String? logo,  String? color,  List<String> technologies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Experience() when $default != null:
return $default(_that.id,_that.creationTime,_that.title,_that.organization,_that.type,_that.location,_that.startDate,_that.endDate,_that.isCurrent,_that.description,_that.responsibilities,_that.achievements,_that.logo,_that.color,_that.technologies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id, @JsonKey(name: '_creationTime')  double creationTime,  String title,  String organization,  String type,  String location,  String startDate,  String? endDate,  bool isCurrent,  String description,  List<String> responsibilities,  List<String> achievements,  String? logo,  String? color,  List<String> technologies)  $default,) {final _that = this;
switch (_that) {
case _Experience():
return $default(_that.id,_that.creationTime,_that.title,_that.organization,_that.type,_that.location,_that.startDate,_that.endDate,_that.isCurrent,_that.description,_that.responsibilities,_that.achievements,_that.logo,_that.color,_that.technologies);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id, @JsonKey(name: '_creationTime')  double creationTime,  String title,  String organization,  String type,  String location,  String startDate,  String? endDate,  bool isCurrent,  String description,  List<String> responsibilities,  List<String> achievements,  String? logo,  String? color,  List<String> technologies)?  $default,) {final _that = this;
switch (_that) {
case _Experience() when $default != null:
return $default(_that.id,_that.creationTime,_that.title,_that.organization,_that.type,_that.location,_that.startDate,_that.endDate,_that.isCurrent,_that.description,_that.responsibilities,_that.achievements,_that.logo,_that.color,_that.technologies);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Experience implements Experience {
  const _Experience({@JsonKey(name: '_id') required this.id, @JsonKey(name: '_creationTime') required this.creationTime, required this.title, required this.organization, required this.type, required this.location, required this.startDate, this.endDate, this.isCurrent = false, required this.description, final  List<String> responsibilities = const [], final  List<String> achievements = const [], this.logo, this.color, final  List<String> technologies = const []}): _responsibilities = responsibilities,_achievements = achievements,_technologies = technologies;
  factory _Experience.fromJson(Map<String, dynamic> json) => _$ExperienceFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override@JsonKey(name: '_creationTime') final  double creationTime;
@override final  String title;
@override final  String organization;
@override final  String type;
@override final  String location;
@override final  String startDate;
@override final  String? endDate;
@override@JsonKey() final  bool isCurrent;
@override final  String description;
 final  List<String> _responsibilities;
@override@JsonKey() List<String> get responsibilities {
  if (_responsibilities is EqualUnmodifiableListView) return _responsibilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_responsibilities);
}

 final  List<String> _achievements;
@override@JsonKey() List<String> get achievements {
  if (_achievements is EqualUnmodifiableListView) return _achievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_achievements);
}

@override final  String? logo;
@override final  String? color;
 final  List<String> _technologies;
@override@JsonKey() List<String> get technologies {
  if (_technologies is EqualUnmodifiableListView) return _technologies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_technologies);
}


/// Create a copy of Experience
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExperienceCopyWith<_Experience> get copyWith => __$ExperienceCopyWithImpl<_Experience>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExperienceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Experience&&(identical(other.id, id) || other.id == id)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&(identical(other.title, title) || other.title == title)&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.type, type) || other.type == type)&&(identical(other.location, location) || other.location == location)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._responsibilities, _responsibilities)&&const DeepCollectionEquality().equals(other._achievements, _achievements)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other._technologies, _technologies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationTime,title,organization,type,location,startDate,endDate,isCurrent,description,const DeepCollectionEquality().hash(_responsibilities),const DeepCollectionEquality().hash(_achievements),logo,color,const DeepCollectionEquality().hash(_technologies));

@override
String toString() {
  return 'Experience(id: $id, creationTime: $creationTime, title: $title, organization: $organization, type: $type, location: $location, startDate: $startDate, endDate: $endDate, isCurrent: $isCurrent, description: $description, responsibilities: $responsibilities, achievements: $achievements, logo: $logo, color: $color, technologies: $technologies)';
}


}

/// @nodoc
abstract mixin class _$ExperienceCopyWith<$Res> implements $ExperienceCopyWith<$Res> {
  factory _$ExperienceCopyWith(_Experience value, $Res Function(_Experience) _then) = __$ExperienceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id,@JsonKey(name: '_creationTime') double creationTime, String title, String organization, String type, String location, String startDate, String? endDate, bool isCurrent, String description, List<String> responsibilities, List<String> achievements, String? logo, String? color, List<String> technologies
});




}
/// @nodoc
class __$ExperienceCopyWithImpl<$Res>
    implements _$ExperienceCopyWith<$Res> {
  __$ExperienceCopyWithImpl(this._self, this._then);

  final _Experience _self;
  final $Res Function(_Experience) _then;

/// Create a copy of Experience
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creationTime = null,Object? title = null,Object? organization = null,Object? type = null,Object? location = null,Object? startDate = null,Object? endDate = freezed,Object? isCurrent = null,Object? description = null,Object? responsibilities = null,Object? achievements = null,Object? logo = freezed,Object? color = freezed,Object? technologies = null,}) {
  return _then(_Experience(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as double,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,organization: null == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,responsibilities: null == responsibilities ? _self._responsibilities : responsibilities // ignore: cast_nullable_to_non_nullable
as List<String>,achievements: null == achievements ? _self._achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<String>,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,technologies: null == technologies ? _self._technologies : technologies // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
