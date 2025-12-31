import 'package:mobile/domain/article/dtos/paginated_articles_params_dto.dart';
import 'package:mobile/domain/article/entities/paginated_article_entity.dart';

abstract interface class IArticleRepository {
  Future<PaginatedArticle> getPaginatedArticles(
    PaginatedArticlesParamsDto params,
  );
}
