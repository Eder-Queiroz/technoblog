// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuestUser _$GuestUserFromJson(Map<String, dynamic> json) => GuestUser(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  avatarUrl: json['avatarUrl'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$GuestUserToJson(GuestUser instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'avatarUrl': instance.avatarUrl,
  'runtimeType': instance.$type,
};

NotLoggedUser _$NotLoggedUserFromJson(Map<String, dynamic> json) =>
    NotLoggedUser($type: json['runtimeType'] as String?);

Map<String, dynamic> _$NotLoggedUserToJson(NotLoggedUser instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

LoggedUser _$LoggedUserFromJson(Map<String, dynamic> json) => LoggedUser(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  avatarUrl: json['avatarUrl'] as String,
  accessToken: json['accessToken'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$LoggedUserToJson(LoggedUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'avatarUrl': instance.avatarUrl,
      'accessToken': instance.accessToken,
      'runtimeType': instance.$type,
    };
