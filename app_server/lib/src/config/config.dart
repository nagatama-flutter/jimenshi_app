import 'package:dotenv/dotenv.dart';
import 'package:riverpod/riverpod.dart';

/// Provides the configuration for the current environment.
final configProvider = Provider<Config>((_) {
  final env = DotEnv(includePlatformEnvironment: true)..load();

  final geminiAPIKey = env.getOrElse('GEMINI_API_KEY', () {
    throw Exception('GEMINI_API_KEY is not set');
  });
  final sentryDsn = env.getOrElse('SENTRY_DSN', () {
    throw Exception('SENTRY_DSN is not set');
  });

  return Config(geminiAPIKey: geminiAPIKey, sentryDsn: sentryDsn);
});

class Config {
  final String geminiAPIKey;
  final String sentryDsn;

  const Config({
    required this.geminiAPIKey,
    required this.sentryDsn,
  });
}
