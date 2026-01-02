import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/data/datasources/remote/articles_api.dart';
import 'package:mobile/data/exceptions/article_repository_exception.dart';
import 'package:mobile/domain/article/dtos/form_article_dto.dart';
import 'package:mobile/domain/article/dtos/paginated_articles_params_dto.dart';
import 'package:mobile/domain/article/entities/paginated_article_entity.dart';
import 'package:mobile/domain/article/repositories/article_repository.interface.dart';

final articleRepositoryProvider = Provider<IArticleRepository>(
  (ref) => ArticleRepositoryImpl(articlesApi: ref.read(articlesApiProvider)),
);

class ArticleRepositoryImpl implements IArticleRepository {
  final ArticlesApi _articlesApi;
  ArticleRepositoryImpl({required ArticlesApi articlesApi})
    : _articlesApi = articlesApi;

  @override
  Future<PaginatedArticle> getPaginatedArticles(
    PaginatedArticlesParamsDto params,
  ) async {
    return await _articlesApi.getPaginatedArticles(params);
  }

  @override
  Future<void> createArticle(FormArticleDto dto) async {
    if (!dto.validate()) {
      throw InvalidFormArticleException('Invalid form article');
    }
    return await _articlesApi.createArticle(dto);
  }
}
