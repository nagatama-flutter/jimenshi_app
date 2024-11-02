// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ContractDecisionPage]
class ContractDecisionRoute extends PageRouteInfo<void> {
  const ContractDecisionRoute({List<PageRouteInfo>? children})
      : super(
          ContractDecisionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContractDecisionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ContractDecisionPage();
    },
  );
}

/// generated route for
/// [ContractNegotiationPage]
class ContractNegotiationRoute
    extends PageRouteInfo<ContractNegotiationRouteArgs> {
  ContractNegotiationRoute({
    Key? key,
    required int conversationId,
    List<PageRouteInfo>? children,
  }) : super(
          ContractNegotiationRoute.name,
          args: ContractNegotiationRouteArgs(
            key: key,
            conversationId: conversationId,
          ),
          initialChildren: children,
        );

  static const String name = 'ContractNegotiationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ContractNegotiationRouteArgs>();
      return ContractNegotiationPage(
        key: args.key,
        conversationId: args.conversationId,
      );
    },
  );
}

class ContractNegotiationRouteArgs {
  const ContractNegotiationRouteArgs({
    this.key,
    required this.conversationId,
  });

  final Key? key;

  final int conversationId;

  @override
  String toString() {
    return 'ContractNegotiationRouteArgs{key: $key, conversationId: $conversationId}';
  }
}

/// generated route for
/// [ContractResultFailurePage]
class ContractResultFailureRoute extends PageRouteInfo<void> {
  const ContractResultFailureRoute({List<PageRouteInfo>? children})
      : super(
          ContractResultFailureRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContractResultFailureRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ContractResultFailurePage();
    },
  );
}

/// generated route for
/// [ContractResultSuccessPage]
class ContractResultSuccessRoute extends PageRouteInfo<void> {
  const ContractResultSuccessRoute({List<PageRouteInfo>? children})
      : super(
          ContractResultSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContractResultSuccessRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ContractResultSuccessPage();
    },
  );
}

/// generated route for
/// [ExamplePage]
class ExampleRoute extends PageRouteInfo<void> {
  const ExampleRoute({List<PageRouteInfo>? children})
      : super(
          ExampleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExampleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ExamplePage();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingPage();
    },
  );
}

/// generated route for
/// [RootPage]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RootPage();
    },
  );
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignInPage();
    },
  );
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignUpPage();
    },
  );
}

/// generated route for
/// [StartPage]
class StartRoute extends PageRouteInfo<void> {
  const StartRoute({List<PageRouteInfo>? children})
      : super(
          StartRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StartPage();
    },
  );
}

/// generated route for
/// [StoryPage]
class StoryRoute extends PageRouteInfo<void> {
  const StoryRoute({List<PageRouteInfo>? children})
      : super(
          StoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'StoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StoryPage();
    },
  );
}
