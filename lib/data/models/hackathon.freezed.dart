// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hackathon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HackathonLinks {

 String? get github; String? get demo; String? get social;
/// Create a copy of HackathonLinks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HackathonLinksCopyWith<HackathonLinks> get copyWith => _$HackathonLinksCopyWithImpl<HackathonLinks>(this as HackathonLinks, _$identity);

  /// Serializes this HackathonLinks to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HackathonLinks&&(identical(other.github, github) || other.github == github)&&(identical(other.demo, demo) || other.demo == demo)&&(identical(other.social, social) || other.social == social));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,github,demo,social);

@override
String toString() {
  return 'HackathonLinks(github: $github, demo: $demo, social: $social)';
}


}

/// @nodoc
abstract mixin class $HackathonLinksCopyWith<$Res>  {
  factory $HackathonLinksCopyWith(HackathonLinks value, $Res Function(HackathonLinks) _then) = _$HackathonLinksCopyWithImpl;
@useResult
$Res call({
 String? github, String? demo, String? social
});




}
/// @nodoc
class _$HackathonLinksCopyWithImpl<$Res>
    implements $HackathonLinksCopyWith<$Res> {
  _$HackathonLinksCopyWithImpl(this._self, this._then);

  final HackathonLinks _self;
  final $Res Function(HackathonLinks) _then;

/// Create a copy of HackathonLinks
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? github = freezed,Object? demo = freezed,Object? social = freezed,}) {
  return _then(_self.copyWith(
github: freezed == github ? _self.github : github // ignore: cast_nullable_to_non_nullable
as String?,demo: freezed == demo ? _self.demo : demo // ignore: cast_nullable_to_non_nullable
as String?,social: freezed == social ? _self.social : social // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HackathonLinks].
extension HackathonLinksPatterns on HackathonLinks {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HackathonLinks value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HackathonLinks() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HackathonLinks value)  $default,){
final _that = this;
switch (_that) {
case _HackathonLinks():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HackathonLinks value)?  $default,){
final _that = this;
switch (_that) {
case _HackathonLinks() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? github,  String? demo,  String? social)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HackathonLinks() when $default != null:
return $default(_that.github,_that.demo,_that.social);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? github,  String? demo,  String? social)  $default,) {final _that = this;
switch (_that) {
case _HackathonLinks():
return $default(_that.github,_that.demo,_that.social);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? github,  String? demo,  String? social)?  $default,) {final _that = this;
switch (_that) {
case _HackathonLinks() when $default != null:
return $default(_that.github,_that.demo,_that.social);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HackathonLinks implements HackathonLinks {
  const _HackathonLinks({this.github, this.demo, this.social});
  factory _HackathonLinks.fromJson(Map<String, dynamic> json) => _$HackathonLinksFromJson(json);

@override final  String? github;
@override final  String? demo;
@override final  String? social;

/// Create a copy of HackathonLinks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HackathonLinksCopyWith<_HackathonLinks> get copyWith => __$HackathonLinksCopyWithImpl<_HackathonLinks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HackathonLinksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HackathonLinks&&(identical(other.github, github) || other.github == github)&&(identical(other.demo, demo) || other.demo == demo)&&(identical(other.social, social) || other.social == social));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,github,demo,social);

@override
String toString() {
  return 'HackathonLinks(github: $github, demo: $demo, social: $social)';
}


}

/// @nodoc
abstract mixin class _$HackathonLinksCopyWith<$Res> implements $HackathonLinksCopyWith<$Res> {
  factory _$HackathonLinksCopyWith(_HackathonLinks value, $Res Function(_HackathonLinks) _then) = __$HackathonLinksCopyWithImpl;
@override @useResult
$Res call({
 String? github, String? demo, String? social
});




}
/// @nodoc
class __$HackathonLinksCopyWithImpl<$Res>
    implements _$HackathonLinksCopyWith<$Res> {
  __$HackathonLinksCopyWithImpl(this._self, this._then);

  final _HackathonLinks _self;
  final $Res Function(_HackathonLinks) _then;

/// Create a copy of HackathonLinks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? github = freezed,Object? demo = freezed,Object? social = freezed,}) {
  return _then(_HackathonLinks(
github: freezed == github ? _self.github : github // ignore: cast_nullable_to_non_nullable
as String?,demo: freezed == demo ? _self.demo : demo // ignore: cast_nullable_to_non_nullable
as String?,social: freezed == social ? _self.social : social // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Hackathon {

@JsonKey(name: '_id') String get id;@JsonKey(name: '_creationTime') double get creationTime; String get title; String get organizer; String get description; String get date; String get thumbnail; List<String> get gallery; List<String> get tags; HackathonLinks get links;
/// Create a copy of Hackathon
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HackathonCopyWith<Hackathon> get copyWith => _$HackathonCopyWithImpl<Hackathon>(this as Hackathon, _$identity);

  /// Serializes this Hackathon to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Hackathon&&(identical(other.id, id) || other.id == id)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&(identical(other.title, title) || other.title == title)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&const DeepCollectionEquality().equals(other.gallery, gallery)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.links, links) || other.links == links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationTime,title,organizer,description,date,thumbnail,const DeepCollectionEquality().hash(gallery),const DeepCollectionEquality().hash(tags),links);

@override
String toString() {
  return 'Hackathon(id: $id, creationTime: $creationTime, title: $title, organizer: $organizer, description: $description, date: $date, thumbnail: $thumbnail, gallery: $gallery, tags: $tags, links: $links)';
}


}

/// @nodoc
abstract mixin class $HackathonCopyWith<$Res>  {
  factory $HackathonCopyWith(Hackathon value, $Res Function(Hackathon) _then) = _$HackathonCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id,@JsonKey(name: '_creationTime') double creationTime, String title, String organizer, String description, String date, String thumbnail, List<String> gallery, List<String> tags, HackathonLinks links
});


$HackathonLinksCopyWith<$Res> get links;

}
/// @nodoc
class _$HackathonCopyWithImpl<$Res>
    implements $HackathonCopyWith<$Res> {
  _$HackathonCopyWithImpl(this._self, this._then);

  final Hackathon _self;
  final $Res Function(Hackathon) _then;

/// Create a copy of Hackathon
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creationTime = null,Object? title = null,Object? organizer = null,Object? description = null,Object? date = null,Object? thumbnail = null,Object? gallery = null,Object? tags = null,Object? links = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as double,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,organizer: null == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,gallery: null == gallery ? _self.gallery : gallery // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as HackathonLinks,
  ));
}
/// Create a copy of Hackathon
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HackathonLinksCopyWith<$Res> get links {
  
  return $HackathonLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}
}


/// Adds pattern-matching-related methods to [Hackathon].
extension HackathonPatterns on Hackathon {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Hackathon value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Hackathon() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Hackathon value)  $default,){
final _that = this;
switch (_that) {
case _Hackathon():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Hackathon value)?  $default,){
final _that = this;
switch (_that) {
case _Hackathon() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id, @JsonKey(name: '_creationTime')  double creationTime,  String title,  String organizer,  String description,  String date,  String thumbnail,  List<String> gallery,  List<String> tags,  HackathonLinks links)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Hackathon() when $default != null:
return $default(_that.id,_that.creationTime,_that.title,_that.organizer,_that.description,_that.date,_that.thumbnail,_that.gallery,_that.tags,_that.links);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id, @JsonKey(name: '_creationTime')  double creationTime,  String title,  String organizer,  String description,  String date,  String thumbnail,  List<String> gallery,  List<String> tags,  HackathonLinks links)  $default,) {final _that = this;
switch (_that) {
case _Hackathon():
return $default(_that.id,_that.creationTime,_that.title,_that.organizer,_that.description,_that.date,_that.thumbnail,_that.gallery,_that.tags,_that.links);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id, @JsonKey(name: '_creationTime')  double creationTime,  String title,  String organizer,  String description,  String date,  String thumbnail,  List<String> gallery,  List<String> tags,  HackathonLinks links)?  $default,) {final _that = this;
switch (_that) {
case _Hackathon() when $default != null:
return $default(_that.id,_that.creationTime,_that.title,_that.organizer,_that.description,_that.date,_that.thumbnail,_that.gallery,_that.tags,_that.links);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Hackathon implements Hackathon {
  const _Hackathon({@JsonKey(name: '_id') required this.id, @JsonKey(name: '_creationTime') required this.creationTime, required this.title, required this.organizer, required this.description, required this.date, required this.thumbnail, final  List<String> gallery = const [], final  List<String> tags = const [], required this.links}): _gallery = gallery,_tags = tags;
  factory _Hackathon.fromJson(Map<String, dynamic> json) => _$HackathonFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override@JsonKey(name: '_creationTime') final  double creationTime;
@override final  String title;
@override final  String organizer;
@override final  String description;
@override final  String date;
@override final  String thumbnail;
 final  List<String> _gallery;
@override@JsonKey() List<String> get gallery {
  if (_gallery is EqualUnmodifiableListView) return _gallery;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_gallery);
}

 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  HackathonLinks links;

/// Create a copy of Hackathon
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HackathonCopyWith<_Hackathon> get copyWith => __$HackathonCopyWithImpl<_Hackathon>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HackathonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hackathon&&(identical(other.id, id) || other.id == id)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&(identical(other.title, title) || other.title == title)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&const DeepCollectionEquality().equals(other._gallery, _gallery)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.links, links) || other.links == links));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationTime,title,organizer,description,date,thumbnail,const DeepCollectionEquality().hash(_gallery),const DeepCollectionEquality().hash(_tags),links);

@override
String toString() {
  return 'Hackathon(id: $id, creationTime: $creationTime, title: $title, organizer: $organizer, description: $description, date: $date, thumbnail: $thumbnail, gallery: $gallery, tags: $tags, links: $links)';
}


}

/// @nodoc
abstract mixin class _$HackathonCopyWith<$Res> implements $HackathonCopyWith<$Res> {
  factory _$HackathonCopyWith(_Hackathon value, $Res Function(_Hackathon) _then) = __$HackathonCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id,@JsonKey(name: '_creationTime') double creationTime, String title, String organizer, String description, String date, String thumbnail, List<String> gallery, List<String> tags, HackathonLinks links
});


@override $HackathonLinksCopyWith<$Res> get links;

}
/// @nodoc
class __$HackathonCopyWithImpl<$Res>
    implements _$HackathonCopyWith<$Res> {
  __$HackathonCopyWithImpl(this._self, this._then);

  final _Hackathon _self;
  final $Res Function(_Hackathon) _then;

/// Create a copy of Hackathon
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creationTime = null,Object? title = null,Object? organizer = null,Object? description = null,Object? date = null,Object? thumbnail = null,Object? gallery = null,Object? tags = null,Object? links = null,}) {
  return _then(_Hackathon(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as double,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,organizer: null == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,gallery: null == gallery ? _self._gallery : gallery // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as HackathonLinks,
  ));
}

/// Create a copy of Hackathon
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HackathonLinksCopyWith<$Res> get links {
  
  return $HackathonLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}
}

// dart format on
