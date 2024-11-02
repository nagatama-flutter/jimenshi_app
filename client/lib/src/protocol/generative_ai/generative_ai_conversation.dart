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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import '../protocol.dart' as _i3;

abstract class GenerativeAIConversation implements _i1.SerializableModel {
  GenerativeAIConversation._({
    this.id,
    required this.userId,
    this.user,
    this.messages,
    DateTime? createdAt,
    this.updatedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory GenerativeAIConversation({
    int? id,
    required int userId,
    _i2.UserInfo? user,
    List<_i3.GenerativeAIMessage>? messages,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _GenerativeAIConversationImpl;

  factory GenerativeAIConversation.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return GenerativeAIConversation(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      messages: (jsonSerialization['messages'] as List?)
          ?.map((e) =>
              _i3.GenerativeAIMessage.fromJson((e as Map<String, dynamic>)))
          .toList(),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  _i2.UserInfo? user;

  List<_i3.GenerativeAIMessage>? messages;

  DateTime createdAt;

  DateTime? updatedAt;

  GenerativeAIConversation copyWith({
    int? id,
    int? userId,
    _i2.UserInfo? user,
    List<_i3.GenerativeAIMessage>? messages,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      if (messages != null)
        'messages': messages?.toJson(valueToJson: (v) => v.toJson()),
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GenerativeAIConversationImpl extends GenerativeAIConversation {
  _GenerativeAIConversationImpl({
    int? id,
    required int userId,
    _i2.UserInfo? user,
    List<_i3.GenerativeAIMessage>? messages,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          messages: messages,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  GenerativeAIConversation copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    Object? messages = _Undefined,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
  }) {
    return GenerativeAIConversation(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserInfo? ? user : this.user?.copyWith(),
      messages: messages is List<_i3.GenerativeAIMessage>?
          ? messages
          : this.messages?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}
