import 'package:app/config/config.dart';

abstract interface class SentryConfig {
  String get dsn;

  // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
  // We recommend adjusting this value in production.
  double get tracesSampleRate;

  // The sampling rate for profiling is relative to tracesSampleRate
  // Setting to 1.0 will profile 100% of sampled transactions:
  double get profilesSampleRate;

  static SentryConfig fromEnvironment(Environment environment) {
    return switch (environment) {
      Environment.local => SentryLocalConfig(),
      Environment.development => SentryDevelopmentConfig(),
    };
  }
}

class SentryLocalConfig implements SentryConfig {
  @override
  String get dsn =>
      'https://78d6a92b2b3048ce9f73ccf62fff32ef@o4508226845016064.ingest.us.sentry.io/4508226873393152';
  @override
  double get tracesSampleRate => 0.0;
  @override
  double get profilesSampleRate => 0.0;
}

class SentryDevelopmentConfig implements SentryConfig {
  @override
  String get dsn =>
      'https://78d6a92b2b3048ce9f73ccf62fff32ef@o4508226845016064.ingest.us.sentry.io/4508226873393152';
  @override
  double get tracesSampleRate => 0.0;
  @override
  double get profilesSampleRate => 0.0;
}
