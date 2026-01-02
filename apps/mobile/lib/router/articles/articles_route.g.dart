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
    GoRouteData.$route(path: 'new', factory: $NewArticleFormRoute._fromState),
    GoRouteData.$route(path: ':id', factory: $ArticleDetailRoute._fromState),
    GoRouteData.$route(
      path: ':id/edit',
      factory: $EditArticleFormRoute._fromState,
    ),
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

mixin $NewArticleFormRoute on GoRouteData {
  static NewArticleFormRoute _fromState(GoRouterState state) =>
      NewArticleFormRoute();

  @override
  String get location => GoRouteData.$location('/articles/new');

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
      ArticleDetailRoute(id: BigInt.parse(state.pathParameters['id']!));

  ArticleDetailRoute get _self => this as ArticleDetailRoute;

  @override
  String get location => GoRouteData.$location(
    '/articles/${Uri.encodeComponent(_self.id.toString())}',
  );

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

mixin $EditArticleFormRoute on GoRouteData {
  static EditArticleFormRoute _fromState(GoRouterState state) =>
      EditArticleFormRoute(id: BigInt.parse(state.pathParameters['id']!));

  EditArticleFormRoute get _self => this as EditArticleFormRoute;

  @override
  String get location => GoRouteData.$location(
    '/articles/${Uri.encodeComponent(_self.id.toString())}/edit',
  );

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
