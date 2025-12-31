// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$listArticlesRoute];

RouteBase get $listArticlesRoute => GoRouteData.$route(
  path: '/articles',
  factory: $ListArticlesRoute._fromState,
  routes: [
    GoRouteData.$route(path: ':id', factory: $ArticleDetailRoute._fromState),
  ],
);

mixin $ListArticlesRoute on GoRouteData {
  static ListArticlesRoute _fromState(GoRouterState state) =>
      ListArticlesRoute();

  @override
  String get location => GoRouteData.$location('/articles');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ArticleDetailRoute on GoRouteData {
  static ArticleDetailRoute _fromState(GoRouterState state) =>
      ArticleDetailRoute(id: state.pathParameters['id']!);

  ArticleDetailRoute get _self => this as ArticleDetailRoute;

  @override
  String get location =>
      GoRouteData.$location('/articles/${Uri.encodeComponent(_self.id)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
