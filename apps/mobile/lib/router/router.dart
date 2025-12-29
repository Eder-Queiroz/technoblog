import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/domain/user/entities/user_entity.dart';
import 'package:mobile/router/articles/articles_route.dart';
import 'package:mobile/router/login/login_route.dart';
import 'package:mobile/views/contexts/user_context.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final userStateNotifier = ValueNotifier<AsyncValue<User>>(
    const AsyncLoading(),
  );

  ref.listen<AsyncValue<User>>(userContextProvider, (previous, next) {
    userStateNotifier.value = next;
  });

  return GoRouter(
    routes: [$loginRoute, $listArticlesRoute],
    initialLocation: LoginRoute().location,
    redirect: (context, state) {
      final userContext = ref.read(userContextProvider.notifier);

      final isGoingToLogin = state.matchedLocation == LoginRoute().location;
      final isAuthenticated = userContext.isAuthenticated;

      if (isGoingToLogin && isAuthenticated) {
        return ListArticlesRoute().location;
      }

      if (!isGoingToLogin && !isAuthenticated) {
        return LoginRoute().location;
      }

      return null;
    },
    refreshListenable: userStateNotifier,
  );
});
