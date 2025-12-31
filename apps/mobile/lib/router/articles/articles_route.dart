import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/views/articles/details/article_detail_screen.dart';
import 'package:mobile/views/articles/list/list_articles_screen.dart';

part 'articles_route.g.dart';

@TypedGoRoute<ListArticlesRoute>(
  path: '/articles',
  routes: [TypedGoRoute<ArticleDetailRoute>(path: ':id')],
)
class ListArticlesRoute extends GoRouteData with $ListArticlesRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ListArticlesScreen();
  }
}

class ArticleDetailRoute extends GoRouteData with $ArticleDetailRoute {
  final String id;

  const ArticleDetailRoute({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ArticleDetailScreen(id: id);
  }
}
