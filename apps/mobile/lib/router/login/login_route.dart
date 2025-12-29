import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/views/login/login_screen.dart';

part 'login_route.g.dart';

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}
