// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AboutContent {

@JsonKey(name: '_id') String? get id; String? get title; String? get subtitle; List<String> get paragraphs; String? get imageUrl; List<AboutHighlight> get highlights;/// Stats from Convex is a map like {projects: "10+", technologies: "5+"}
 Map<String, dynamic>? get stats;
/// Create a copy of AboutContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AboutContentCopyWith<AboutContent> get copyWith => _$AboutContentCopyWithImpl<AboutContent>(this as AboutContent, _$identity);

  /// Serializes this AboutContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AboutContent&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other.paragraphs, paragraphs)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.highlights, highlights)&&const DeepCollectionEquality().equals(other.stats, stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,const DeepCollectionEquality().hash(paragraphs),imageUrl,const DeepCollectionEquality().hash(highlights),const DeepCollectionEquality().hash(stats));

@override
String toString() {
  return 'AboutContent(id: $id, title: $title, subtitle: $subtitle, paragraphs: $paragraphs, imageUrl: $imageUrl, highlights: $highlights, stats: $stats)';
}


}

/// @nodoc
abstract mixin class $AboutContentCopyWith<$Res>  {
  factory $AboutContentCopyWith(AboutContent value, $Res Function(AboutContent) _then) = _$AboutContentCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? title, String? subtitle, List<String> paragraphs, String? imageUrl, List<AboutHighlight> highlights, Map<String, dynamic>? stats
});




}
/// @nodoc
class _$AboutContentCopyWithImpl<$Res>
    implements $AboutContentCopyWith<$Res> {
  _$AboutContentCopyWithImpl(this._self, this._then);

  final AboutContent _self;
  final $Res Function(AboutContent) _then;

/// Create a copy of AboutContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? subtitle = freezed,Object? paragraphs = null,Object? imageUrl = freezed,Object? highlights = null,Object? stats = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,paragraphs: null == paragraphs ? _self.paragraphs : paragraphs // ignore: cast_nullable_to_non_nullable
as List<String>,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,highlights: null == highlights ? _self.highlights : highlights // ignore: cast_nullable_to_non_nullable
as List<AboutHighlight>,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AboutContent].
extension AboutContentPatterns on AboutContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AboutContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AboutContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AboutContent value)  $default,){
final _that = this;
switch (_that) {
case _AboutContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AboutContent value)?  $default,){
final _that = this;
switch (_that) {
case _AboutContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? title,  String? subtitle,  List<String> paragraphs,  String? imageUrl,  List<AboutHighlight> highlights,  Map<String, dynamic>? stats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AboutContent() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.paragraphs,_that.imageUrl,_that.highlights,_that.stats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? title,  String? subtitle,  List<String> paragraphs,  String? imageUrl,  List<AboutHighlight> highlights,  Map<String, dynamic>? stats)  $default,) {final _that = this;
switch (_that) {
case _AboutContent():
return $default(_that.id,_that.title,_that.subtitle,_that.paragraphs,_that.imageUrl,_that.highlights,_that.stats);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? title,  String? subtitle,  List<String> paragraphs,  String? imageUrl,  List<AboutHighlight> highlights,  Map<String, dynamic>? stats)?  $default,) {final _that = this;
switch (_that) {
case _AboutContent() when $default != null:
return $default(_that.id,_that.title,_that.subtitle,_that.paragraphs,_that.imageUrl,_that.highlights,_that.stats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AboutContent implements AboutContent {
  const _AboutContent({@JsonKey(name: '_id') this.id, this.title, this.subtitle, final  List<String> paragraphs = const [], this.imageUrl, final  List<AboutHighlight> highlights = const [], final  Map<String, dynamic>? stats}): _paragraphs = paragraphs,_highlights = highlights,_stats = stats;
  factory _AboutContent.fromJson(Map<String, dynamic> json) => _$AboutContentFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? title;
@override final  String? subtitle;
 final  List<String> _paragraphs;
@override@JsonKey() List<String> get paragraphs {
  if (_paragraphs is EqualUnmodifiableListView) return _paragraphs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paragraphs);
}

@override final  String? imageUrl;
 final  List<AboutHighlight> _highlights;
@override@JsonKey() List<AboutHighlight> get highlights {
  if (_highlights is EqualUnmodifiableListView) return _highlights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_highlights);
}

/// Stats from Convex is a map like {projects: "10+", technologies: "5+"}
 final  Map<String, dynamic>? _stats;
/// Stats from Convex is a map like {projects: "10+", technologies: "5+"}
@override Map<String, dynamic>? get stats {
  final value = _stats;
  if (value == null) return null;
  if (_stats is EqualUnmodifiableMapView) return _stats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of AboutContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AboutContentCopyWith<_AboutContent> get copyWith => __$AboutContentCopyWithImpl<_AboutContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AboutContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AboutContent&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&const DeepCollectionEquality().equals(other._paragraphs, _paragraphs)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other._highlights, _highlights)&&const DeepCollectionEquality().equals(other._stats, _stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle,const DeepCollectionEquality().hash(_paragraphs),imageUrl,const DeepCollectionEquality().hash(_highlights),const DeepCollectionEquality().hash(_stats));

@override
String toString() {
  return 'AboutContent(id: $id, title: $title, subtitle: $subtitle, paragraphs: $paragraphs, imageUrl: $imageUrl, highlights: $highlights, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$AboutContentCopyWith<$Res> implements $AboutContentCopyWith<$Res> {
  factory _$AboutContentCopyWith(_AboutContent value, $Res Function(_AboutContent) _then) = __$AboutContentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? title, String? subtitle, List<String> paragraphs, String? imageUrl, List<AboutHighlight> highlights, Map<String, dynamic>? stats
});




}
/// @nodoc
class __$AboutContentCopyWithImpl<$Res>
    implements _$AboutContentCopyWith<$Res> {
  __$AboutContentCopyWithImpl(this._self, this._then);

  final _AboutContent _self;
  final $Res Function(_AboutContent) _then;

/// Create a copy of AboutContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? subtitle = freezed,Object? paragraphs = null,Object? imageUrl = freezed,Object? highlights = null,Object? stats = freezed,}) {
  return _then(_AboutContent(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,paragraphs: null == paragraphs ? _self._paragraphs : paragraphs // ignore: cast_nullable_to_non_nullable
as List<String>,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,highlights: null == highlights ? _self._highlights : highlights // ignore: cast_nullable_to_non_nullable
as List<AboutHighlight>,stats: freezed == stats ? _self._stats : stats // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$AboutHighlight {

 String? get icon; String? get title; String? get value; String? get description; String? get color;
/// Create a copy of AboutHighlight
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AboutHighlightCopyWith<AboutHighlight> get copyWith => _$AboutHighlightCopyWithImpl<AboutHighlight>(this as AboutHighlight, _$identity);

  /// Serializes this AboutHighlight to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AboutHighlight&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.title, title) || other.title == title)&&(identical(other.value, value) || other.value == value)&&(identical(other.description, description) || other.description == description)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,icon,title,value,description,color);

@override
String toString() {
  return 'AboutHighlight(icon: $icon, title: $title, value: $value, description: $description, color: $color)';
}


}

/// @nodoc
abstract mixin class $AboutHighlightCopyWith<$Res>  {
  factory $AboutHighlightCopyWith(AboutHighlight value, $Res Function(AboutHighlight) _then) = _$AboutHighlightCopyWithImpl;
@useResult
$Res call({
 String? icon, String? title, String? value, String? description, String? color
});




}
/// @nodoc
class _$AboutHighlightCopyWithImpl<$Res>
    implements $AboutHighlightCopyWith<$Res> {
  _$AboutHighlightCopyWithImpl(this._self, this._then);

  final AboutHighlight _self;
  final $Res Function(AboutHighlight) _then;

/// Create a copy of AboutHighlight
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? icon = freezed,Object? title = freezed,Object? value = freezed,Object? description = freezed,Object? color = freezed,}) {
  return _then(_self.copyWith(
icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AboutHighlight].
extension AboutHighlightPatterns on AboutHighlight {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AboutHighlight value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AboutHighlight() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AboutHighlight value)  $default,){
final _that = this;
switch (_that) {
case _AboutHighlight():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AboutHighlight value)?  $default,){
final _that = this;
switch (_that) {
case _AboutHighlight() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? icon,  String? title,  String? value,  String? description,  String? color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AboutHighlight() when $default != null:
return $default(_that.icon,_that.title,_that.value,_that.description,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? icon,  String? title,  String? value,  String? description,  String? color)  $default,) {final _that = this;
switch (_that) {
case _AboutHighlight():
return $default(_that.icon,_that.title,_that.value,_that.description,_that.color);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? icon,  String? title,  String? value,  String? description,  String? color)?  $default,) {final _that = this;
switch (_that) {
case _AboutHighlight() when $default != null:
return $default(_that.icon,_that.title,_that.value,_that.description,_that.color);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AboutHighlight implements AboutHighlight {
  const _AboutHighlight({this.icon, this.title, this.value, this.description, this.color});
  factory _AboutHighlight.fromJson(Map<String, dynamic> json) => _$AboutHighlightFromJson(json);

@override final  String? icon;
@override final  String? title;
@override final  String? value;
@override final  String? description;
@override final  String? color;

/// Create a copy of AboutHighlight
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AboutHighlightCopyWith<_AboutHighlight> get copyWith => __$AboutHighlightCopyWithImpl<_AboutHighlight>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AboutHighlightToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AboutHighlight&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.title, title) || other.title == title)&&(identical(other.value, value) || other.value == value)&&(identical(other.description, description) || other.description == description)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,icon,title,value,description,color);

@override
String toString() {
  return 'AboutHighlight(icon: $icon, title: $title, value: $value, description: $description, color: $color)';
}


}

/// @nodoc
abstract mixin class _$AboutHighlightCopyWith<$Res> implements $AboutHighlightCopyWith<$Res> {
  factory _$AboutHighlightCopyWith(_AboutHighlight value, $Res Function(_AboutHighlight) _then) = __$AboutHighlightCopyWithImpl;
@override @useResult
$Res call({
 String? icon, String? title, String? value, String? description, String? color
});




}
/// @nodoc
class __$AboutHighlightCopyWithImpl<$Res>
    implements _$AboutHighlightCopyWith<$Res> {
  __$AboutHighlightCopyWithImpl(this._self, this._then);

  final _AboutHighlight _self;
  final $Res Function(_AboutHighlight) _then;

/// Create a copy of AboutHighlight
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? icon = freezed,Object? title = freezed,Object? value = freezed,Object? description = freezed,Object? color = freezed,}) {
  return _then(_AboutHighlight(
icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AboutStat {

 String get label; String get value;
/// Create a copy of AboutStat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AboutStatCopyWith<AboutStat> get copyWith => _$AboutStatCopyWithImpl<AboutStat>(this as AboutStat, _$identity);

  /// Serializes this AboutStat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AboutStat&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,value);

@override
String toString() {
  return 'AboutStat(label: $label, value: $value)';
}


}

/// @nodoc
abstract mixin class $AboutStatCopyWith<$Res>  {
  factory $AboutStatCopyWith(AboutStat value, $Res Function(AboutStat) _then) = _$AboutStatCopyWithImpl;
@useResult
$Res call({
 String label, String value
});




}
/// @nodoc
class _$AboutStatCopyWithImpl<$Res>
    implements $AboutStatCopyWith<$Res> {
  _$AboutStatCopyWithImpl(this._self, this._then);

  final AboutStat _self;
  final $Res Function(AboutStat) _then;

/// Create a copy of AboutStat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? value = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AboutStat].
extension AboutStatPatterns on AboutStat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AboutStat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AboutStat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AboutStat value)  $default,){
final _that = this;
switch (_that) {
case _AboutStat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AboutStat value)?  $default,){
final _that = this;
switch (_that) {
case _AboutStat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AboutStat() when $default != null:
return $default(_that.label,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String value)  $default,) {final _that = this;
switch (_that) {
case _AboutStat():
return $default(_that.label,_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String value)?  $default,) {final _that = this;
switch (_that) {
case _AboutStat() when $default != null:
return $default(_that.label,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AboutStat implements AboutStat {
  const _AboutStat({required this.label, required this.value});
  factory _AboutStat.fromJson(Map<String, dynamic> json) => _$AboutStatFromJson(json);

@override final  String label;
@override final  String value;

/// Create a copy of AboutStat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AboutStatCopyWith<_AboutStat> get copyWith => __$AboutStatCopyWithImpl<_AboutStat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AboutStatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AboutStat&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,value);

@override
String toString() {
  return 'AboutStat(label: $label, value: $value)';
}


}

/// @nodoc
abstract mixin class _$AboutStatCopyWith<$Res> implements $AboutStatCopyWith<$Res> {
  factory _$AboutStatCopyWith(_AboutStat value, $Res Function(_AboutStat) _then) = __$AboutStatCopyWithImpl;
@override @useResult
$Res call({
 String label, String value
});




}
/// @nodoc
class __$AboutStatCopyWithImpl<$Res>
    implements _$AboutStatCopyWith<$Res> {
  __$AboutStatCopyWithImpl(this._self, this._then);

  final _AboutStat _self;
  final $Res Function(_AboutStat) _then;

/// Create a copy of AboutStat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value = null,}) {
  return _then(_AboutStat(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
