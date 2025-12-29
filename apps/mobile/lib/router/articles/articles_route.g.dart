// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$listArticlesRoute];

RouteBase get $listArticlesRoute => GoRouteData.$route(
  path: '/articles',
  factory: $ListArticlesRoute._fromState,
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
