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

abstract class GenerativeAIMessage implements _i1.SerializableModel {
  GenerativeAIMessage._({
    this.id,
    required this.sessionId,
    required this.conversationId,
    required this.aiModelName,
    required this.messageType,
    required this.content,
    this.image,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory GenerativeAIMessage({
    int? id,
    required _i1.UuidValue sessionId,
    required int conversationId,
    required String aiModelName,
    required _i2.GenerativeAIMessageType messageType,
    required String content,
    _i2.GenerativeAIImage? image,
    DateTime? createdAt,
  }) = _GenerativeAIMessageImpl;

  factory GenerativeAIMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return GenerativeAIMessage(
      id: jsonSerialization['id'] as int?,
      sessionId:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['sessionId']),
      conversationId: jsonSerialization['conversationId'] as int,
      aiModelName: jsonSerialization['aiModelName'] as String,
      messageType: _i2.GenerativeAIMessageType.fromJson(
          (jsonSerialization['messageType'] as String)),
      content: jsonSerialization['content'] as String,
      image: jsonSerialization['image'] == null
          ? null
          : _i2.GenerativeAIImage.fromJson(
              (jsonSerialization['image'] as Map<String, dynamic>)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i1.UuidValue sessionId;

  int conversationId;

  String aiModelName;

  _i2.GenerativeAIMessageType messageType;

  String content;

  _i2.GenerativeAIImage? image;

  DateTime createdAt;

  GenerativeAIMessage copyWith({
    int? id,
    _i1.UuidValue? sessionId,
    int? conversationId,
    String? aiModelName,
    _i2.GenerativeAIMessageType? messageType,
    String? content,
    _i2.GenerativeAIImage? image,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'sessionId': sessionId.toJson(),
      'conversationId': conversationId,
      'aiModelName': aiModelName,
      'messageType': messageType.toJson(),
      'content': content,
      if (image != null) 'image': image?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GenerativeAIMessageImpl extends GenerativeAIMessage {
  _GenerativeAIMessageImpl({
    int? id,
    required _i1.UuidValue sessionId,
    required int conversationId,
    required String aiModelName,
    required _i2.GenerativeAIMessageType messageType,
    required String content,
    _i2.GenerativeAIImage? image,
    DateTime? createdAt,
  }) : super._(
          id: id,
          sessionId: sessionId,
          conversationId: conversationId,
          aiModelName: aiModelName,
          messageType: messageType,
          content: content,
          image: image,
          createdAt: createdAt,
        );

  @override
  GenerativeAIMessage copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? sessionId,
    int? conversationId,
    String? aiModelName,
    _i2.GenerativeAIMessageType? messageType,
    String? content,
    Object? image = _Undefined,
    DateTime? createdAt,
  }) {
    return GenerativeAIMessage(
      id: id is int? ? id : this.id,
      sessionId: sessionId ?? this.sessionId,
      conversationId: conversationId ?? this.conversationId,
      aiModelName: aiModelName ?? this.aiModelName,
      messageType: messageType ?? this.messageType,
      content: content ?? this.content,
      image: image is _i2.GenerativeAIImage? ? image : this.image?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
