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
import '../protocol.dart' as _i2;

abstract class GenerativeAIMessageRequest implements _i1.SerializableModel {
  GenerativeAIMessageRequest._({
    required this.conversationId,
    required this.content,
    this.image,
  });

  factory GenerativeAIMessageRequest({
    required int conversationId,
    required String content,
    _i2.GenerativeAIImage? image,
  }) = _GenerativeAIMessageRequestImpl;

  factory GenerativeAIMessageRequest.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return GenerativeAIMessageRequest(
      conversationId: jsonSerialization['conversationId'] as int,
      content: jsonSerialization['content'] as String,
      image: jsonSerialization['image'] == null
          ? null
          : _i2.GenerativeAIImage.fromJson(
              (jsonSerialization['image'] as Map<String, dynamic>)),
    );
  }

  int conversationId;

  String content;

  _i2.GenerativeAIImage? image;

  GenerativeAIMessageRequest copyWith({
    int? conversationId,
    String? content,
    _i2.GenerativeAIImage? image,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'conversationId': conversationId,
      'content': content,
      if (image != null) 'image': image?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GenerativeAIMessageRequestImpl extends GenerativeAIMessageRequest {
  _GenerativeAIMessageRequestImpl({
    required int conversationId,
    required String content,
    _i2.GenerativeAIImage? image,
  }) : super._(
          conversationId: conversationId,
          content: content,
          image: image,
        );

  @override
  GenerativeAIMessageRequest copyWith({
    int? conversationId,
    String? content,
    Object? image = _Undefined,
  }) {
    return GenerativeAIMessageRequest(
      conversationId: conversationId ?? this.conversationId,
      content: content ?? this.content,
      image: image is _i2.GenerativeAIImage? ? image : this.image?.copyWith(),
    );
  }
}
