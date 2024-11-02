import 'package:app_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

extension SessionExtension on Session {
  /// Returns the authenticated user id.
  ///
  /// If the user is not authenticated, it will throw [Unauthenticated].
  Future<int> retrieveUserId() async {
    final authInfo = await authenticated;
    if (authInfo == null) {
      error('AuthInfo is null',
          error: Unauthenticated(), stackTrace: StackTrace.current);
      throw Unauthenticated();
    }

    return authInfo.userId;
  }

  /// Logging for the session.
  void debug(String message) {
    log(message, level: LogLevel.debug);
  }

  void info(String message) {
    log(message, level: LogLevel.info);
  }

  void warning(
    String message, {
    required Object error,
    StackTrace? stackTrace,
  }) {
    log(message, level: LogLevel.warning);
  }

  void error(
    String message, {
    required Object error,
    StackTrace? stackTrace,
  }) {
    log(message, level: LogLevel.error);
  }

  void fatal(
    String message, {
    required Object error,
    StackTrace? stackTrace,
  }) {
    log(message, level: LogLevel.fatal);
  }
}
