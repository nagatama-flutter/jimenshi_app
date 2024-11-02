import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

/// Override this provider with correct session manager.
final serverpodSessionManagerProvider =
    Provider<SessionManager>((_) => throw UnimplementedError());
