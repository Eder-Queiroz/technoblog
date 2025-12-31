import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/domain/tag/entities/tag_entity.dart';
import 'package:mobile/domain/user/entities/user_entity.dart';
import 'package:mobile/utils/helpers/big_int_json.dart';

part 'article_entity.freezed.dart';
part 'article_entity.g.dart';

@freezed
sealed class Article with _$Article {
  const Article._();

  const factory Article({
    @JsonKey(fromJson: bigIntFromJson, toJson: bigIntToJson) required BigInt id,
    required String title,
    required String content,
    required GuestUser author,
    required List<Tag> tags,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  bool isAuthor(User user) {
    return user.when(
      guest: (id, name, email, avatarUrl) => id == author.id,
      logged: (id, name, email, avatarUrl, accessToken) => id == author.id,
      notLogged: () => false,
    );
  }

  bool canBeEditedBy(AsyncValue<User> user) {
    return user.maybeWhen(data: (user) => isAuthor(user), orElse: () => false);
  }
}
