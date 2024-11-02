/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'error/internal_error.dart' as _i2;
import 'error/invalid_argument.dart' as _i3;
import 'error/unauthenticated.dart' as _i4;
import 'example.dart' as _i5;
import 'generative_ai/generative_ai_conversation.dart' as _i6;
import 'generative_ai/generative_ai_message.dart' as _i7;
import 'generative_ai/generative_ai_message_request.dart' as _i8;
import 'generative_ai/generative_ai_message_type.dart' as _i9;
import 'protocol.dart' as _i10;
import 'package:client/src/protocol/generative_ai/generative_ai_conversation.dart'
    as _i11;
import 'package:client/src/protocol/generative_ai/generative_ai_message.dart'
    as _i12;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i13;
export 'error/internal_error.dart';
export 'error/invalid_argument.dart';
export 'error/unauthenticated.dart';
export 'example.dart';
export 'generative_ai/generative_ai_conversation.dart';
export 'generative_ai/generative_ai_message.dart';
export 'generative_ai/generative_ai_message_request.dart';
export 'generative_ai/generative_ai_message_type.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.InternalError) {
      return _i2.InternalError.fromJson(data) as T;
    }
    if (t == _i3.InvalidArgument) {
      return _i3.InvalidArgument.fromJson(data) as T;
    }
    if (t == _i4.Unauthenticated) {
      return _i4.Unauthenticated.fromJson(data) as T;
    }
    if (t == _i5.Example) {
      return _i5.Example.fromJson(data) as T;
    }
    if (t == _i6.GenerativeAIConversation) {
      return _i6.GenerativeAIConversation.fromJson(data) as T;
    }
    if (t == _i7.GenerativeAIMessage) {
      return _i7.GenerativeAIMessage.fromJson(data) as T;
    }
    if (t == _i8.GenerativeAIMessageRequest) {
      return _i8.GenerativeAIMessageRequest.fromJson(data) as T;
    }
    if (t == _i9.GenerativeAIMessageType) {
      return _i9.GenerativeAIMessageType.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.InternalError?>()) {
      return (data != null ? _i2.InternalError.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.InvalidArgument?>()) {
      return (data != null ? _i3.InvalidArgument.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Unauthenticated?>()) {
      return (data != null ? _i4.Unauthenticated.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Example?>()) {
      return (data != null ? _i5.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.GenerativeAIConversation?>()) {
      return (data != null ? _i6.GenerativeAIConversation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.GenerativeAIMessage?>()) {
      return (data != null ? _i7.GenerativeAIMessage.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i8.GenerativeAIMessageRequest?>()) {
      return (data != null
          ? _i8.GenerativeAIMessageRequest.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i9.GenerativeAIMessageType?>()) {
      return (data != null ? _i9.GenerativeAIMessageType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<List<_i10.GenerativeAIMessage>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i10.GenerativeAIMessage>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i11.GenerativeAIConversation>) {
      return (data as List)
          .map((e) => deserialize<_i11.GenerativeAIConversation>(e))
          .toList() as dynamic;
    }
    if (t == List<_i12.GenerativeAIMessage>) {
      return (data as List)
          .map((e) => deserialize<_i12.GenerativeAIMessage>(e))
          .toList() as dynamic;
    }
    try {
      return _i13.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.InternalError) {
      return 'InternalError';
    }
    if (data is _i3.InvalidArgument) {
      return 'InvalidArgument';
    }
    if (data is _i4.Unauthenticated) {
      return 'Unauthenticated';
    }
    if (data is _i5.Example) {
      return 'Example';
    }
    if (data is _i6.GenerativeAIConversation) {
      return 'GenerativeAIConversation';
    }
    if (data is _i7.GenerativeAIMessage) {
      return 'GenerativeAIMessage';
    }
    if (data is _i8.GenerativeAIMessageRequest) {
      return 'GenerativeAIMessageRequest';
    }
    if (data is _i9.GenerativeAIMessageType) {
      return 'GenerativeAIMessageType';
    }
    className = _i13.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'InternalError') {
      return deserialize<_i2.InternalError>(data['data']);
    }
    if (data['className'] == 'InvalidArgument') {
      return deserialize<_i3.InvalidArgument>(data['data']);
    }
    if (data['className'] == 'Unauthenticated') {
      return deserialize<_i4.Unauthenticated>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i5.Example>(data['data']);
    }
    if (data['className'] == 'GenerativeAIConversation') {
      return deserialize<_i6.GenerativeAIConversation>(data['data']);
    }
    if (data['className'] == 'GenerativeAIMessage') {
      return deserialize<_i7.GenerativeAIMessage>(data['data']);
    }
    if (data['className'] == 'GenerativeAIMessageRequest') {
      return deserialize<_i8.GenerativeAIMessageRequest>(data['data']);
    }
    if (data['className'] == 'GenerativeAIMessageType') {
      return deserialize<_i9.GenerativeAIMessageType>(data['data']);
    }
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i13.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
