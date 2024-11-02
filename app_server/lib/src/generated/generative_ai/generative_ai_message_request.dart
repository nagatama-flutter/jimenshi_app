/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class GenerativeAIMessageRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  GenerativeAIMessageRequest._({
    required this.conversationId,
    required this.content,
  });

  factory GenerativeAIMessageRequest({
    required int conversationId,
    required String content,
  }) = _GenerativeAIMessageRequestImpl;

  factory GenerativeAIMessageRequest.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return GenerativeAIMessageRequest(
      conversationId: jsonSerialization['conversationId'] as int,
      content: jsonSerialization['content'] as String,
    );
  }

  int conversationId;

  String content;

  GenerativeAIMessageRequest copyWith({
    int? conversationId,
    String? content,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'conversationId': conversationId,
      'content': content,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'conversationId': conversationId,
      'content': content,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _GenerativeAIMessageRequestImpl extends GenerativeAIMessageRequest {
  _GenerativeAIMessageRequestImpl({
    required int conversationId,
    required String content,
  }) : super._(
          conversationId: conversationId,
          content: content,
        );

  @override
  GenerativeAIMessageRequest copyWith({
    int? conversationId,
    String? content,
  }) {
    return GenerativeAIMessageRequest(
      conversationId: conversationId ?? this.conversationId,
      content: content ?? this.content,
    );
  }
}
