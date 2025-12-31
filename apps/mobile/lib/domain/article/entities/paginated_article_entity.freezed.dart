// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_article_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginatedArticle {

 List<Article> get data; int get total;
/// Create a copy of PaginatedArticle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedArticleCopyWith<PaginatedArticle> get copyWith => _$PaginatedArticleCopyWithImpl<PaginatedArticle>(this as PaginatedArticle, _$identity);

  /// Serializes this PaginatedArticle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedArticle&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),total);

@override
String toString() {
  return 'PaginatedArticle(data: $data, total: $total)';
}


}

/// @nodoc
abstract mixin class $PaginatedArticleCopyWith<$Res>  {
  factory $PaginatedArticleCopyWith(PaginatedArticle value, $Res Function(PaginatedArticle) _then) = _$PaginatedArticleCopyWithImpl;
@useResult
$Res call({
 List<Article> data, int total
});




}
/// @nodoc
class _$PaginatedArticleCopyWithImpl<$Res>
    implements $PaginatedArticleCopyWith<$Res> {
  _$PaginatedArticleCopyWithImpl(this._self, this._then);

  final PaginatedArticle _self;
  final $Res Function(PaginatedArticle) _then;

/// Create a copy of PaginatedArticle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? total = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Article>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedArticle].
extension PaginatedArticlePatterns on PaginatedArticle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedArticle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedArticle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedArticle value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedArticle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedArticle value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedArticle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Article> data,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedArticle() when $default != null:
return $default(_that.data,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Article> data,  int total)  $default,) {final _that = this;
switch (_that) {
case _PaginatedArticle():
return $default(_that.data,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Article> data,  int total)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedArticle() when $default != null:
return $default(_that.data,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedArticle implements PaginatedArticle {
  const _PaginatedArticle({required final  List<Article> data, required this.total}): _data = data;
  factory _PaginatedArticle.fromJson(Map<String, dynamic> json) => _$PaginatedArticleFromJson(json);

 final  List<Article> _data;
@override List<Article> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  int total;

/// Create a copy of PaginatedArticle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedArticleCopyWith<_PaginatedArticle> get copyWith => __$PaginatedArticleCopyWithImpl<_PaginatedArticle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedArticleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedArticle&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),total);

@override
String toString() {
  return 'PaginatedArticle(data: $data, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PaginatedArticleCopyWith<$Res> implements $PaginatedArticleCopyWith<$Res> {
  factory _$PaginatedArticleCopyWith(_PaginatedArticle value, $Res Function(_PaginatedArticle) _then) = __$PaginatedArticleCopyWithImpl;
@override @useResult
$Res call({
 List<Article> data, int total
});




}
/// @nodoc
class __$PaginatedArticleCopyWithImpl<$Res>
    implements _$PaginatedArticleCopyWith<$Res> {
  __$PaginatedArticleCopyWithImpl(this._self, this._then);

  final _PaginatedArticle _self;
  final $Res Function(_PaginatedArticle) _then;

/// Create a copy of PaginatedArticle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? total = null,}) {
  return _then(_PaginatedArticle(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Article>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
