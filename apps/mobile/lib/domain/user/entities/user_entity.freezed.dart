// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
User _$UserFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'guest':
          return GuestUser.fromJson(
            json
          );
                case 'notLogged':
          return NotLoggedUser.fromJson(
            json
          );
                case 'logged':
          return LoggedUser.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'User',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$User {



  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'User()';
}


}

/// @nodoc
class $UserCopyWith<$Res>  {
$UserCopyWith(User _, $Res Function(User) __);
}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GuestUser value)?  guest,TResult Function( NotLoggedUser value)?  notLogged,TResult Function( LoggedUser value)?  logged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GuestUser() when guest != null:
return guest(_that);case NotLoggedUser() when notLogged != null:
return notLogged(_that);case LoggedUser() when logged != null:
return logged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GuestUser value)  guest,required TResult Function( NotLoggedUser value)  notLogged,required TResult Function( LoggedUser value)  logged,}){
final _that = this;
switch (_that) {
case GuestUser():
return guest(_that);case NotLoggedUser():
return notLogged(_that);case LoggedUser():
return logged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GuestUser value)?  guest,TResult? Function( NotLoggedUser value)?  notLogged,TResult? Function( LoggedUser value)?  logged,}){
final _that = this;
switch (_that) {
case GuestUser() when guest != null:
return guest(_that);case NotLoggedUser() when notLogged != null:
return notLogged(_that);case LoggedUser() when logged != null:
return logged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String name,  String email,  String avatarUrl)?  guest,TResult Function()?  notLogged,TResult Function( String id,  String name,  String email,  String avatarUrl,  String accessToken)?  logged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GuestUser() when guest != null:
return guest(_that.id,_that.name,_that.email,_that.avatarUrl);case NotLoggedUser() when notLogged != null:
return notLogged();case LoggedUser() when logged != null:
return logged(_that.id,_that.name,_that.email,_that.avatarUrl,_that.accessToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String name,  String email,  String avatarUrl)  guest,required TResult Function()  notLogged,required TResult Function( String id,  String name,  String email,  String avatarUrl,  String accessToken)  logged,}) {final _that = this;
switch (_that) {
case GuestUser():
return guest(_that.id,_that.name,_that.email,_that.avatarUrl);case NotLoggedUser():
return notLogged();case LoggedUser():
return logged(_that.id,_that.name,_that.email,_that.avatarUrl,_that.accessToken);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String name,  String email,  String avatarUrl)?  guest,TResult? Function()?  notLogged,TResult? Function( String id,  String name,  String email,  String avatarUrl,  String accessToken)?  logged,}) {final _that = this;
switch (_that) {
case GuestUser() when guest != null:
return guest(_that.id,_that.name,_that.email,_that.avatarUrl);case NotLoggedUser() when notLogged != null:
return notLogged();case LoggedUser() when logged != null:
return logged(_that.id,_that.name,_that.email,_that.avatarUrl,_that.accessToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class GuestUser implements User {
  const GuestUser({required this.id, required this.name, required this.email, required this.avatarUrl, final  String? $type}): $type = $type ?? 'guest';
  factory GuestUser.fromJson(Map<String, dynamic> json) => _$GuestUserFromJson(json);

 final  String id;
 final  String name;
 final  String email;
 final  String avatarUrl;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuestUserCopyWith<GuestUser> get copyWith => _$GuestUserCopyWithImpl<GuestUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuestUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuestUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,avatarUrl);

@override
String toString() {
  return 'User.guest(id: $id, name: $name, email: $email, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $GuestUserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory $GuestUserCopyWith(GuestUser value, $Res Function(GuestUser) _then) = _$GuestUserCopyWithImpl;
@useResult
$Res call({
 String id, String name, String email, String avatarUrl
});




}
/// @nodoc
class _$GuestUserCopyWithImpl<$Res>
    implements $GuestUserCopyWith<$Res> {
  _$GuestUserCopyWithImpl(this._self, this._then);

  final GuestUser _self;
  final $Res Function(GuestUser) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? avatarUrl = null,}) {
  return _then(GuestUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class NotLoggedUser implements User {
  const NotLoggedUser({final  String? $type}): $type = $type ?? 'notLogged';
  factory NotLoggedUser.fromJson(Map<String, dynamic> json) => _$NotLoggedUserFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$NotLoggedUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotLoggedUser);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'User.notLogged()';
}


}




/// @nodoc
@JsonSerializable()

class LoggedUser implements User {
  const LoggedUser({required this.id, required this.name, required this.email, required this.avatarUrl, required this.accessToken, final  String? $type}): $type = $type ?? 'logged';
  factory LoggedUser.fromJson(Map<String, dynamic> json) => _$LoggedUserFromJson(json);

 final  String id;
 final  String name;
 final  String email;
 final  String avatarUrl;
 final  String accessToken;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoggedUserCopyWith<LoggedUser> get copyWith => _$LoggedUserCopyWithImpl<LoggedUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoggedUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoggedUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,avatarUrl,accessToken);

@override
String toString() {
  return 'User.logged(id: $id, name: $name, email: $email, avatarUrl: $avatarUrl, accessToken: $accessToken)';
}


}

/// @nodoc
abstract mixin class $LoggedUserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory $LoggedUserCopyWith(LoggedUser value, $Res Function(LoggedUser) _then) = _$LoggedUserCopyWithImpl;
@useResult
$Res call({
 String id, String name, String email, String avatarUrl, String accessToken
});




}
/// @nodoc
class _$LoggedUserCopyWithImpl<$Res>
    implements $LoggedUserCopyWith<$Res> {
  _$LoggedUserCopyWithImpl(this._self, this._then);

  final LoggedUser _self;
  final $Res Function(LoggedUser) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? avatarUrl = null,Object? accessToken = null,}) {
  return _then(LoggedUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
