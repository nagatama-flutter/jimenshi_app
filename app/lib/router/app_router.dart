import 'package:app/feature/auth/presentation.dart';
import 'package:app/feature/home/presentation.dart';
import 'package:app/router/guard/auth_guard.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'app_router.gr.dart';

final appRouterProvider = Provider.autoDispose<RootStackRouter>(
  (ref) => AppRouter(
    authRouteGuard: ref.watch(authGuardProvider),
  ),
);

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final AutoRouteGuard authRouteGuard;

  AppRouter({required this.authRouteGuard});

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          guards: [authRouteGuard],
          initial: true,
        ),
        AutoRoute(page: ExampleRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
      ];
}
