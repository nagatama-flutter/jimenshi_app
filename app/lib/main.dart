import 'package:app/app.dart';
import 'package:app/config/config.dart';
import 'package:app/data/serverpod_client.dart';
import 'package:app/data/serverpod_session_manager.dart';
import 'package:app/feature/sentry/domain/sentry_config.dart';
import 'package:app/firebase_options.dart';
import 'package:client/sample_pod_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

void main() async {
  final environment = Environment.fromCurrentEnvironment(
      const String.fromEnvironment('FLAVOR'));
  final config = Config.fromEnvironment(environment);
  final sentryConfig = SentryConfig.fromEnvironment(environment);
  await SentryFlutter.init(
    (options) {
      options.dsn = sentryConfig.dsn;
      options.tracesSampleRate = sentryConfig.tracesSampleRate;
      options.profilesSampleRate = sentryConfig.profilesSampleRate;
    },
    appRunner: () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);

      final client = Client(
        config.serverHost,
        authenticationKeyManager: FlutterAuthenticationKeyManager(),
      )..connectivityMonitor = FlutterConnectivityMonitor();

      final sessionManager = SessionManager(caller: client.modules.auth);

      await sessionManager.initialize();

      await GoogleFonts.pendingFonts([
        GoogleFonts.notoSansJpTextTheme(),
      ]);

      runApp(
        ProviderScope(
          overrides: [
            serverpodClientProvider.overrideWithValue(client),
            serverpodSessionManagerProvider.overrideWithValue(sessionManager),
          ],
          child: const App(),
        ),
      );
    },
  );
}
