import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/domain/article/entities/article_entity.dart';

part 'paginated_article_entity.freezed.dart';
part 'paginated_article_entity.g.dart';

@freezed
sealed class PaginatedArticle with _$PaginatedArticle {
  const factory PaginatedArticle({
    required List<Article> data,
    required int total,
  }) = _PaginatedArticle;

  factory PaginatedArticle.fromJson(Map<String, dynamic> json) =>
      _$PaginatedArticleFromJson(json);
}
