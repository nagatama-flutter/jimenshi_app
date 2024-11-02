import 'package:client/sample_pod_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Override this provider with correct client.
final serverpodClientProvider =
    Provider<Client>((ref) => throw UnimplementedError());

extension ClientExtension on Client {
  bool get isStreamingDisconnected =>
      streamingConnectionStatus == StreamingConnectionStatus.disconnected;
}
