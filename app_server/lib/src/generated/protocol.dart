/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'error/internal_error.dart' as _i4;
import 'error/invalid_argument.dart' as _i5;
import 'error/unauthenticated.dart' as _i6;
import 'example.dart' as _i7;
import 'generative_ai/generative_ai_conversation.dart' as _i8;
import 'generative_ai/generative_ai_message.dart' as _i9;
import 'generative_ai/generative_ai_message_request.dart' as _i10;
import 'generative_ai/generative_ai_message_type.dart' as _i11;
import 'protocol.dart' as _i12;
import 'package:app_server/src/generated/generative_ai/generative_ai_conversation.dart'
    as _i13;
import 'package:app_server/src/generated/generative_ai/generative_ai_message.dart'
    as _i14;
export 'error/internal_error.dart';
export 'error/invalid_argument.dart';
export 'error/unauthenticated.dart';
export 'example.dart';
export 'generative_ai/generative_ai_conversation.dart';
export 'generative_ai/generative_ai_message.dart';
export 'generative_ai/generative_ai_message_request.dart';
export 'generative_ai/generative_ai_message_type.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'generative_ai_conversation',
      dartName: 'GenerativeAIConversation',
      schema: 'public',
      module: 'app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'generative_ai_conversation_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'generative_ai_conversation_fk_0',
          columns: ['userId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'generative_ai_conversation_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'generative_ai_message',
      dartName: 'GenerativeAIMessage',
      schema: 'public',
      module: 'app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'generative_ai_message_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'sessionId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'conversationId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'aiModelName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'messageType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:GenerativeAIMessageType',
        ),
        _i2.ColumnDefinition(
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'generative_ai_message_fk_0',
          columns: ['conversationId'],
          referenceTable: 'generative_ai_conversation',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'generative_ai_message_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.InternalError) {
      return _i4.InternalError.fromJson(data) as T;
    }
    if (t == _i5.InvalidArgument) {
      return _i5.InvalidArgument.fromJson(data) as T;
    }
    if (t == _i6.Unauthenticated) {
      return _i6.Unauthenticated.fromJson(data) as T;
    }
    if (t == _i7.Example) {
      return _i7.Example.fromJson(data) as T;
    }
    if (t == _i8.GenerativeAIConversation) {
      return _i8.GenerativeAIConversation.fromJson(data) as T;
    }
    if (t == _i9.GenerativeAIMessage) {
      return _i9.GenerativeAIMessage.fromJson(data) as T;
    }
    if (t == _i10.GenerativeAIMessageRequest) {
      return _i10.GenerativeAIMessageRequest.fromJson(data) as T;
    }
    if (t == _i11.GenerativeAIMessageType) {
      return _i11.GenerativeAIMessageType.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.InternalError?>()) {
      return (data != null ? _i4.InternalError.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.InvalidArgument?>()) {
      return (data != null ? _i5.InvalidArgument.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Unauthenticated?>()) {
      return (data != null ? _i6.Unauthenticated.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Example?>()) {
      return (data != null ? _i7.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.GenerativeAIConversation?>()) {
      return (data != null ? _i8.GenerativeAIConversation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i9.GenerativeAIMessage?>()) {
      return (data != null ? _i9.GenerativeAIMessage.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.GenerativeAIMessageRequest?>()) {
      return (data != null
          ? _i10.GenerativeAIMessageRequest.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i11.GenerativeAIMessageType?>()) {
      return (data != null ? _i11.GenerativeAIMessageType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<List<_i12.GenerativeAIMessage>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i12.GenerativeAIMessage>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i13.GenerativeAIConversation>) {
      return (data as List)
          .map((e) => deserialize<_i13.GenerativeAIConversation>(e))
          .toList() as dynamic;
    }
    if (t == List<_i14.GenerativeAIMessage>) {
      return (data as List)
          .map((e) => deserialize<_i14.GenerativeAIMessage>(e))
          .toList() as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i4.InternalError) {
      return 'InternalError';
    }
    if (data is _i5.InvalidArgument) {
      return 'InvalidArgument';
    }
    if (data is _i6.Unauthenticated) {
      return 'Unauthenticated';
    }
    if (data is _i7.Example) {
      return 'Example';
    }
    if (data is _i8.GenerativeAIConversation) {
      return 'GenerativeAIConversation';
    }
    if (data is _i9.GenerativeAIMessage) {
      return 'GenerativeAIMessage';
    }
    if (data is _i10.GenerativeAIMessageRequest) {
      return 'GenerativeAIMessageRequest';
    }
    if (data is _i11.GenerativeAIMessageType) {
      return 'GenerativeAIMessageType';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'InternalError') {
      return deserialize<_i4.InternalError>(data['data']);
    }
    if (data['className'] == 'InvalidArgument') {
      return deserialize<_i5.InvalidArgument>(data['data']);
    }
    if (data['className'] == 'Unauthenticated') {
      return deserialize<_i6.Unauthenticated>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i7.Example>(data['data']);
    }
    if (data['className'] == 'GenerativeAIConversation') {
      return deserialize<_i8.GenerativeAIConversation>(data['data']);
    }
    if (data['className'] == 'GenerativeAIMessage') {
      return deserialize<_i9.GenerativeAIMessage>(data['data']);
    }
    if (data['className'] == 'GenerativeAIMessageRequest') {
      return deserialize<_i10.GenerativeAIMessageRequest>(data['data']);
    }
    if (data['className'] == 'GenerativeAIMessageType') {
      return deserialize<_i11.GenerativeAIMessageType>(data['data']);
    }
    if (data['className'].startsWith('serverpod.')) {
      data['className'] = data['className'].substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i8.GenerativeAIConversation:
        return _i8.GenerativeAIConversation.t;
      case _i9.GenerativeAIMessage:
        return _i9.GenerativeAIMessage.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'app';
}
