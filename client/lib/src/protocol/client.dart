/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:client/src/protocol/generative_ai/generative_ai_conversation.dart'
    as _i3;
import 'package:client/src/protocol/generative_ai/generative_ai_message.dart'
    as _i4;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i5;
import 'protocol.dart' as _i6;

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointGenerativeAI extends _i1.EndpointRef {
  EndpointGenerativeAI(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'generativeAI';

  /// AIとの会話を開始する
  _i2.Future<_i3.GenerativeAIConversation> startConversation() =>
      caller.callServerEndpoint<_i3.GenerativeAIConversation>(
        'generativeAI',
        'startConversation',
        {},
      );

  /// AIとの会話の一覧を取得する
  _i2.Future<List<_i3.GenerativeAIConversation>> getConversationList() =>
      caller.callServerEndpoint<List<_i3.GenerativeAIConversation>>(
        'generativeAI',
        'getConversationList',
        {},
      );

  /// AIとの会話を取得する
  _i2.Future<List<_i4.GenerativeAIMessage>> getMessageList(
          int conversationId) =>
      caller.callServerEndpoint<List<_i4.GenerativeAIMessage>>(
        'generativeAI',
        'getMessageList',
        {'conversationId': conversationId},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i5.Caller(client);
  }

  late final _i5.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    example = EndpointExample(this);
    generativeAI = EndpointGenerativeAI(this);
    modules = _Modules(this);
  }

  late final EndpointExample example;

  late final EndpointGenerativeAI generativeAI;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'example': example,
        'generativeAI': generativeAI,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
