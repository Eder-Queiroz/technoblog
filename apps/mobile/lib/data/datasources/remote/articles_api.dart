import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/article/dtos/paginated_articles_params_dto.dart';
import 'package:mobile/domain/article/entities/paginated_article_entity.dart';
import 'package:mobile/services/api/api_client.dart';

final articlesApiProvider = Provider<ArticlesApi>(
  (ref) => ArticlesApi(apiClient: ref.read(apiClientProvider)),
);

class ArticlesApi {
  final ApiClient _apiClient;

  ArticlesApi({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<PaginatedArticle> getPaginatedArticles(
    PaginatedArticlesParamsDto params,
  ) async {
    return await _apiClient.get<PaginatedArticle>(
      '/articles',
      queryParameters: params.toJson(),
      deserialize: (json) => PaginatedArticle.fromJson(json),
    );
  }
}
