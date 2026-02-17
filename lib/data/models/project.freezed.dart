// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectLinks {

 String? get github; String? get demo; String? get live;
/// Create a copy of ProjectLinks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectLinksCopyWith<ProjectLinks> get copyWith => _$ProjectLinksCopyWithImpl<ProjectLinks>(this as ProjectLinks, _$identity);

  /// Serializes this ProjectLinks to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectLinks&&(identical(other.github, github) || other.github == github)&&(identical(other.demo, demo) || other.demo == demo)&&(identical(other.live, live) || other.live == live));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,github,demo,live);

@override
String toString() {
  return 'ProjectLinks(github: $github, demo: $demo, live: $live)';
}


}

/// @nodoc
abstract mixin class $ProjectLinksCopyWith<$Res>  {
  factory $ProjectLinksCopyWith(ProjectLinks value, $Res Function(ProjectLinks) _then) = _$ProjectLinksCopyWithImpl;
@useResult
$Res call({
 String? github, String? demo, String? live
});




}
/// @nodoc
class _$ProjectLinksCopyWithImpl<$Res>
    implements $ProjectLinksCopyWith<$Res> {
  _$ProjectLinksCopyWithImpl(this._self, this._then);

  final ProjectLinks _self;
  final $Res Function(ProjectLinks) _then;

/// Create a copy of ProjectLinks
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? github = freezed,Object? demo = freezed,Object? live = freezed,}) {
  return _then(_self.copyWith(
github: freezed == github ? _self.github : github // ignore: cast_nullable_to_non_nullable
as String?,demo: freezed == demo ? _self.demo : demo // ignore: cast_nullable_to_non_nullable
as String?,live: freezed == live ? _self.live : live // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectLinks].
extension ProjectLinksPatterns on ProjectLinks {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectLinks value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectLinks() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectLinks value)  $default,){
final _that = this;
switch (_that) {
case _ProjectLinks():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectLinks value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectLinks() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? github,  String? demo,  String? live)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectLinks() when $default != null:
return $default(_that.github,_that.demo,_that.live);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? github,  String? demo,  String? live)  $default,) {final _that = this;
switch (_that) {
case _ProjectLinks():
return $default(_that.github,_that.demo,_that.live);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? github,  String? demo,  String? live)?  $default,) {final _that = this;
switch (_that) {
case _ProjectLinks() when $default != null:
return $default(_that.github,_that.demo,_that.live);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectLinks implements ProjectLinks {
  const _ProjectLinks({this.github, this.demo, this.live});
  factory _ProjectLinks.fromJson(Map<String, dynamic> json) => _$ProjectLinksFromJson(json);

@override final  String? github;
@override final  String? demo;
@override final  String? live;

/// Create a copy of ProjectLinks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectLinksCopyWith<_ProjectLinks> get copyWith => __$ProjectLinksCopyWithImpl<_ProjectLinks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectLinksToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectLinks&&(identical(other.github, github) || other.github == github)&&(identical(other.demo, demo) || other.demo == demo)&&(identical(other.live, live) || other.live == live));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,github,demo,live);

@override
String toString() {
  return 'ProjectLinks(github: $github, demo: $demo, live: $live)';
}


}

/// @nodoc
abstract mixin class _$ProjectLinksCopyWith<$Res> implements $ProjectLinksCopyWith<$Res> {
  factory _$ProjectLinksCopyWith(_ProjectLinks value, $Res Function(_ProjectLinks) _then) = __$ProjectLinksCopyWithImpl;
@override @useResult
$Res call({
 String? github, String? demo, String? live
});




}
/// @nodoc
class __$ProjectLinksCopyWithImpl<$Res>
    implements _$ProjectLinksCopyWith<$Res> {
  __$ProjectLinksCopyWithImpl(this._self, this._then);

  final _ProjectLinks _self;
  final $Res Function(_ProjectLinks) _then;

/// Create a copy of ProjectLinks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? github = freezed,Object? demo = freezed,Object? live = freezed,}) {
  return _then(_ProjectLinks(
github: freezed == github ? _self.github : github // ignore: cast_nullable_to_non_nullable
as String?,demo: freezed == demo ? _self.demo : demo // ignore: cast_nullable_to_non_nullable
as String?,live: freezed == live ? _self.live : live // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Project {

@JsonKey(name: '_id') String get id;@JsonKey(name: '_creationTime') double get creationTime; String get title; String get category; String get description; String get thumbnail; List<String>? get gallery; List<String> get tags; String get date; ProjectLinks get links; int? get createdAt;// Keep for backwards compatibility with UI
 bool get isFeatured;
/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectCopyWith<Project> get copyWith => _$ProjectCopyWithImpl<Project>(this as Project, _$identity);

  /// Serializes this Project to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Project&&(identical(other.id, id) || other.id == id)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&const DeepCollectionEquality().equals(other.gallery, gallery)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.date, date) || other.date == date)&&(identical(other.links, links) || other.links == links)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationTime,title,category,description,thumbnail,const DeepCollectionEquality().hash(gallery),const DeepCollectionEquality().hash(tags),date,links,createdAt,isFeatured);

@override
String toString() {
  return 'Project(id: $id, creationTime: $creationTime, title: $title, category: $category, description: $description, thumbnail: $thumbnail, gallery: $gallery, tags: $tags, date: $date, links: $links, createdAt: $createdAt, isFeatured: $isFeatured)';
}


}

/// @nodoc
abstract mixin class $ProjectCopyWith<$Res>  {
  factory $ProjectCopyWith(Project value, $Res Function(Project) _then) = _$ProjectCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id,@JsonKey(name: '_creationTime') double creationTime, String title, String category, String description, String thumbnail, List<String>? gallery, List<String> tags, String date, ProjectLinks links, int? createdAt, bool isFeatured
});


$ProjectLinksCopyWith<$Res> get links;

}
/// @nodoc
class _$ProjectCopyWithImpl<$Res>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._self, this._then);

  final Project _self;
  final $Res Function(Project) _then;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creationTime = null,Object? title = null,Object? category = null,Object? description = null,Object? thumbnail = null,Object? gallery = freezed,Object? tags = null,Object? date = null,Object? links = null,Object? createdAt = freezed,Object? isFeatured = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as double,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,gallery: freezed == gallery ? _self.gallery : gallery // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as ProjectLinks,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectLinksCopyWith<$Res> get links {
  
  return $ProjectLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}
}


/// Adds pattern-matching-related methods to [Project].
extension ProjectPatterns on Project {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Project value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Project() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Project value)  $default,){
final _that = this;
switch (_that) {
case _Project():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Project value)?  $default,){
final _that = this;
switch (_that) {
case _Project() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id, @JsonKey(name: '_creationTime')  double creationTime,  String title,  String category,  String description,  String thumbnail,  List<String>? gallery,  List<String> tags,  String date,  ProjectLinks links,  int? createdAt,  bool isFeatured)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Project() when $default != null:
return $default(_that.id,_that.creationTime,_that.title,_that.category,_that.description,_that.thumbnail,_that.gallery,_that.tags,_that.date,_that.links,_that.createdAt,_that.isFeatured);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id, @JsonKey(name: '_creationTime')  double creationTime,  String title,  String category,  String description,  String thumbnail,  List<String>? gallery,  List<String> tags,  String date,  ProjectLinks links,  int? createdAt,  bool isFeatured)  $default,) {final _that = this;
switch (_that) {
case _Project():
return $default(_that.id,_that.creationTime,_that.title,_that.category,_that.description,_that.thumbnail,_that.gallery,_that.tags,_that.date,_that.links,_that.createdAt,_that.isFeatured);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id, @JsonKey(name: '_creationTime')  double creationTime,  String title,  String category,  String description,  String thumbnail,  List<String>? gallery,  List<String> tags,  String date,  ProjectLinks links,  int? createdAt,  bool isFeatured)?  $default,) {final _that = this;
switch (_that) {
case _Project() when $default != null:
return $default(_that.id,_that.creationTime,_that.title,_that.category,_that.description,_that.thumbnail,_that.gallery,_that.tags,_that.date,_that.links,_that.createdAt,_that.isFeatured);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Project implements Project {
  const _Project({@JsonKey(name: '_id') required this.id, @JsonKey(name: '_creationTime') required this.creationTime, required this.title, required this.category, required this.description, required this.thumbnail, final  List<String>? gallery, final  List<String> tags = const [], required this.date, required this.links, this.createdAt, this.isFeatured = false}): _gallery = gallery,_tags = tags;
  factory _Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override@JsonKey(name: '_creationTime') final  double creationTime;
@override final  String title;
@override final  String category;
@override final  String description;
@override final  String thumbnail;
 final  List<String>? _gallery;
@override List<String>? get gallery {
  final value = _gallery;
  if (value == null) return null;
  if (_gallery is EqualUnmodifiableListView) return _gallery;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  String date;
@override final  ProjectLinks links;
@override final  int? createdAt;
// Keep for backwards compatibility with UI
@override@JsonKey() final  bool isFeatured;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectCopyWith<_Project> get copyWith => __$ProjectCopyWithImpl<_Project>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Project&&(identical(other.id, id) || other.id == id)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&const DeepCollectionEquality().equals(other._gallery, _gallery)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.date, date) || other.date == date)&&(identical(other.links, links) || other.links == links)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationTime,title,category,description,thumbnail,const DeepCollectionEquality().hash(_gallery),const DeepCollectionEquality().hash(_tags),date,links,createdAt,isFeatured);

@override
String toString() {
  return 'Project(id: $id, creationTime: $creationTime, title: $title, category: $category, description: $description, thumbnail: $thumbnail, gallery: $gallery, tags: $tags, date: $date, links: $links, createdAt: $createdAt, isFeatured: $isFeatured)';
}


}

/// @nodoc
abstract mixin class _$ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$ProjectCopyWith(_Project value, $Res Function(_Project) _then) = __$ProjectCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id,@JsonKey(name: '_creationTime') double creationTime, String title, String category, String description, String thumbnail, List<String>? gallery, List<String> tags, String date, ProjectLinks links, int? createdAt, bool isFeatured
});


@override $ProjectLinksCopyWith<$Res> get links;

}
/// @nodoc
class __$ProjectCopyWithImpl<$Res>
    implements _$ProjectCopyWith<$Res> {
  __$ProjectCopyWithImpl(this._self, this._then);

  final _Project _self;
  final $Res Function(_Project) _then;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creationTime = null,Object? title = null,Object? category = null,Object? description = null,Object? thumbnail = null,Object? gallery = freezed,Object? tags = null,Object? date = null,Object? links = null,Object? createdAt = freezed,Object? isFeatured = null,}) {
  return _then(_Project(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as double,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,gallery: freezed == gallery ? _self._gallery : gallery // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as ProjectLinks,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectLinksCopyWith<$Res> get links {
  
  return $ProjectLinksCopyWith<$Res>(_self.links, (value) {
    return _then(_self.copyWith(links: value));
  });
}
}

// dart format on
