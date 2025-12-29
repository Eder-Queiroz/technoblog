import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
sealed class User with _$User {
  const factory User.guest({
    required String id,
    required String name,
    required String email,
    required String avatarUrl,
  }) = GuestUser;

  const factory User.notLogged() = NotLoggedUser;

  const factory User.logged({
    required String id,
    required String name,
    required String email,
    required String avatarUrl,
    required String accessToken,
  }) = LoggedUser;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
