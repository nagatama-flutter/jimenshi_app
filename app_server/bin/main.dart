import 'package:app_server/server.dart';
import 'package:app_server/src/config/config.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sentry/sentry.dart';

/// This is the starting point for your Serverpod server. Typically, there is
/// no need to modify this file.
Future<void> main(List<String> args) async {
  final sentryDsn = ProviderContainer().read(configProvider).sentryDsn;

  await Sentry.init((options) {
    options
      ..dsn = sentryDsn
      ..tracesSampleRate = 1.0;
  });

  run(args);
}
