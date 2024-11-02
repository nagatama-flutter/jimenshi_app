import 'package:app_server/src/extension/session_extension.dart';
import 'package:app_server/src/generated/protocol.dart';
import 'package:app_server/src/provider/gemini_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:serverpod/serverpod.dart';

class GenerativeAIEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// AIとの会話を開始する
  Future<GenerativeAIConversation> startConversation(Session session) async {
    final userId = await session.retrieveUserId();

    final result = await GenerativeAIConversation.db
        .insertRow(session, GenerativeAIConversation(userId: userId));

    session.debug('Inserted conversation: ${result.id}');

    return result;
  }

  /// AIとの会話の一覧を取得する
  Future<List<GenerativeAIConversation>> getConversationList(
    Session session,
  ) async {
    final userId = await session.retrieveUserId();

    final result = await GenerativeAIConversation.db.find(
      session,
      where: (table) => table.userId.equals(userId),
      orderBy: (table) => table.createdAt,
      orderDescending: true,
    );

    return result;
  }

  /// AIとの会話を取得する
  Future<List<GenerativeAIMessage>> getMessageList(
    Session session,
    int conversationId,
  ) async {
    final userId = await session.retrieveUserId();

    // conversationIdが存在しない場合はエラーを返す
    final result = await GenerativeAIConversation.db.findFirstRow(
      session,
      where: (table) =>
          table.userId.equals(userId) & table.id.equals(conversationId),
      include: GenerativeAIConversation.include(
        messages: GenerativeAIMessage.includeList(
          orderBy: (table) => table.createdAt,
          orderDescending: false,
          include: GenerativeAIMessage.include(),
        ),
      ),
    );

    if (result == null) {
      session.error(
        'Conversation not found. conversation id: $conversationId',
        error: InvalidArgument(),
        stackTrace: StackTrace.current,
      );
      throw InvalidArgument();
    }

    return result.messages ?? [];
  }

  @override
  Future<void> handleStreamMessage(
    StreamingSession session,
    SerializableModel message,
  ) async {
    session.debug('Calls handleStreamMessage: ${session.sessionId}');

    if (message is GenerativeAIMessageRequest) {
      final container = ProviderContainer();
      final modelName = container.read(geminiProvider).modelName;

      final inputMessage = await GenerativeAIMessage.db.insertRow(
        session,
        GenerativeAIMessage(
          conversationId: message.conversationId,
          sessionId: session.sessionId,
          aiModelName: modelName,
          messageType: GenerativeAIMessageType.input,
          content: message.content,
          image: message.image,
        ),
      );

      await sendStreamMessage(session, inputMessage);

      final histories = await GenerativeAIMessage.db.find(
        session,
        where: (table) => table.conversationId.equals(message.conversationId),
      );

      final stream = await container.read(geminiProvider).sendMessage(
            message.content,
            history: histories.toHistoryContentList(),
            image: message.image,
          );

      final outputMessage = await GenerativeAIMessage.db.insertRow(
        session,
        GenerativeAIMessage(
          conversationId: message.conversationId,
          sessionId: session.sessionId,
          aiModelName: modelName,
          messageType: GenerativeAIMessageType.output,
          content: message.content,
        ),
      );

      String content = '';
      stream.listen(
        (data) async {
          session.debug('sessionId: ${session.sessionId}');

          content = content + (data.text ?? '');

          await sendStreamMessage(
            session,
            outputMessage.copyWith(content: content),
          );
        },
        onError: (error) async {
          session.error(
            'Error occurred in session: ${session.sessionId}, $error',
            error: error,
            stackTrace: StackTrace.current,
          );

          if (content.isEmpty) {
            return;
          }

          await GenerativeAIMessage.db.updateRow(
            session,
            outputMessage.copyWith(content: content),
          );
        },
        onDone: () async {
          await GenerativeAIMessage.db.updateRow(
            session,
            outputMessage.copyWith(content: content),
          );
        },
      );
    } else {
      session.error(
        '不正なデータのリクエストを受信しました.',
        error: InvalidArgument(
            error: 'Invalid request data. ${message.runtimeType.toString()}'),
        stackTrace: StackTrace.current,
      );
    }
  }

  @override
  Future<void> streamClosed(Session session) async {
    session.debug('GeminiEndpoint.streamClosed');
  }

  @override
  Future<void> streamOpened(Session session) async {
    session.debug('GeminiEndpoint.streamOpened');
  }
}

extension on List<GenerativeAIMessage> {
  List<HistoryContent> toHistoryContentList() {
    return map((e) => e.toHistoryContent()).toList();
  }
}

extension on GenerativeAIMessage {
  HistoryContent toHistoryContent() {
    return switch (messageType) {
      GenerativeAIMessageType.input => HistoryContent(content, true, image),
      GenerativeAIMessageType.output => HistoryContent(content, false),
    };
  }
}
