import 'package:app/data.dart';
import 'package:app/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authGuardProvider = Provider.autoDispose<AutoRouteGuard>(AuthGuard.new);

class AuthGuard extends AutoRouteGuard {
  final Ref _ref;

  AuthGuard(this._ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final session = _ref.read(serverpodSessionManagerProvider);
    if (!session.isSignedIn) {
      resolver.redirect(const SignInRoute());
    } else {
      resolver.next(true);
    }
  }
}
