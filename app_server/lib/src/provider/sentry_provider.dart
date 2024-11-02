import 'package:riverpod/riverpod.dart';
import 'package:sentry/sentry.dart';

final sentryProvider = Provider.autoDispose((ref) => const SentryProvider());

class SentryProvider {
  const SentryProvider();

  Future<void> captureException(
    dynamic exception, {
    dynamic stackTrace,
    Map<String, dynamic>? extra,
    bool? showDialog,
  }) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  }
}
