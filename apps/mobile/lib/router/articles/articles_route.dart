import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/views/articles/list/list_articles_screen.dart';

part 'articles_route.g.dart';

@TypedGoRoute<ListArticlesRoute>(path: '/articles')
class ListArticlesRoute extends GoRouteData with $ListArticlesRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ListArticlesScreen();
  }
}
