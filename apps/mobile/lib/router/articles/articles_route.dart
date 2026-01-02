import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/views/articles/details/article_detail_screen.dart';
import 'package:mobile/views/articles/form/article_form_screen.dart';
import 'package:mobile/views/articles/list/list_articles_screen.dart';

part 'articles_route.g.dart';

@TypedGoRoute<ListArticlesRoute>(
  path: '/articles',
  routes: [
    TypedGoRoute<NewArticleFormRoute>(path: 'new'),
    TypedGoRoute<ArticleDetailRoute>(path: ':id'),
    TypedGoRoute<EditArticleFormRoute>(path: ':id/edit'),
  ],
)
class ListArticlesRoute extends GoRouteData with $ListArticlesRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ListArticlesScreen();
  }
}

class ArticleDetailRoute extends GoRouteData with $ArticleDetailRoute {
  final BigInt id;

  const ArticleDetailRoute({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ArticleDetailScreen(id: id);
  }
}

class NewArticleFormRoute extends GoRouteData with $NewArticleFormRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ArticleFormScreen();
  }
}

class EditArticleFormRoute extends GoRouteData with $EditArticleFormRoute {
  final BigInt id;

  const EditArticleFormRoute({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ArticleFormScreen(articleId: id);
  }
}
