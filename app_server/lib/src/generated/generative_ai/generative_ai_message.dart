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
import '../protocol.dart' as _i2;

abstract class GenerativeAIMessage
    implements _i1.TableRow, _i1.ProtocolSerialization {
  GenerativeAIMessage._({
    this.id,
    required this.sessionId,
    required this.conversationId,
    required this.aiModelName,
    required this.messageType,
    required this.content,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory GenerativeAIMessage({
    int? id,
    required _i1.UuidValue sessionId,
    required int conversationId,
    required String aiModelName,
    required _i2.GenerativeAIMessageType messageType,
    required String content,
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
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = GenerativeAIMessageTable();

  static const db = GenerativeAIMessageRepository._();

  @override
  int? id;

  _i1.UuidValue sessionId;

  int conversationId;

  String aiModelName;

  _i2.GenerativeAIMessageType messageType;

  String content;

  DateTime createdAt;

  @override
  _i1.Table get table => t;

  GenerativeAIMessage copyWith({
    int? id,
    _i1.UuidValue? sessionId,
    int? conversationId,
    String? aiModelName,
    _i2.GenerativeAIMessageType? messageType,
    String? content,
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
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'sessionId': sessionId.toJson(),
      'conversationId': conversationId,
      'aiModelName': aiModelName,
      'messageType': messageType.toJson(),
      'content': content,
      'createdAt': createdAt.toJson(),
    };
  }

  static GenerativeAIMessageInclude include() {
    return GenerativeAIMessageInclude._();
  }

  static GenerativeAIMessageIncludeList includeList({
    _i1.WhereExpressionBuilder<GenerativeAIMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GenerativeAIMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GenerativeAIMessageTable>? orderByList,
    GenerativeAIMessageInclude? include,
  }) {
    return GenerativeAIMessageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GenerativeAIMessage.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GenerativeAIMessage.t),
      include: include,
    );
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
    DateTime? createdAt,
  }) : super._(
          id: id,
          sessionId: sessionId,
          conversationId: conversationId,
          aiModelName: aiModelName,
          messageType: messageType,
          content: content,
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
    DateTime? createdAt,
  }) {
    return GenerativeAIMessage(
      id: id is int? ? id : this.id,
      sessionId: sessionId ?? this.sessionId,
      conversationId: conversationId ?? this.conversationId,
      aiModelName: aiModelName ?? this.aiModelName,
      messageType: messageType ?? this.messageType,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class GenerativeAIMessageTable extends _i1.Table {
  GenerativeAIMessageTable({super.tableRelation})
      : super(tableName: 'generative_ai_message') {
    sessionId = _i1.ColumnUuid(
      'sessionId',
      this,
    );
    conversationId = _i1.ColumnInt(
      'conversationId',
      this,
    );
    aiModelName = _i1.ColumnString(
      'aiModelName',
      this,
    );
    messageType = _i1.ColumnEnum(
      'messageType',
      this,
      _i1.EnumSerialization.byName,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnUuid sessionId;

  late final _i1.ColumnInt conversationId;

  late final _i1.ColumnString aiModelName;

  late final _i1.ColumnEnum<_i2.GenerativeAIMessageType> messageType;

  late final _i1.ColumnString content;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
        id,
        sessionId,
        conversationId,
        aiModelName,
        messageType,
        content,
        createdAt,
      ];
}

class GenerativeAIMessageInclude extends _i1.IncludeObject {
  GenerativeAIMessageInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => GenerativeAIMessage.t;
}

class GenerativeAIMessageIncludeList extends _i1.IncludeList {
  GenerativeAIMessageIncludeList._({
    _i1.WhereExpressionBuilder<GenerativeAIMessageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GenerativeAIMessage.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => GenerativeAIMessage.t;
}

class GenerativeAIMessageRepository {
  const GenerativeAIMessageRepository._();

  Future<List<GenerativeAIMessage>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<GenerativeAIMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GenerativeAIMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GenerativeAIMessageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.find<GenerativeAIMessage>(
      where: where?.call(GenerativeAIMessage.t),
      orderBy: orderBy?.call(GenerativeAIMessage.t),
      orderByList: orderByList?.call(GenerativeAIMessage.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<GenerativeAIMessage?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<GenerativeAIMessageTable>? where,
    int? offset,
    _i1.OrderByBuilder<GenerativeAIMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GenerativeAIMessageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findFirstRow<GenerativeAIMessage>(
      where: where?.call(GenerativeAIMessage.t),
      orderBy: orderBy?.call(GenerativeAIMessage.t),
      orderByList: orderByList?.call(GenerativeAIMessage.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<GenerativeAIMessage?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findById<GenerativeAIMessage>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<GenerativeAIMessage>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<GenerativeAIMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<GenerativeAIMessage>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<GenerativeAIMessage> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    GenerativeAIMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<GenerativeAIMessage>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<GenerativeAIMessage>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<GenerativeAIMessage> rows, {
    _i1.ColumnSelections<GenerativeAIMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<GenerativeAIMessage>(
      rows,
      columns: columns?.call(GenerativeAIMessage.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<GenerativeAIMessage> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    GenerativeAIMessage row, {
    _i1.ColumnSelections<GenerativeAIMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<GenerativeAIMessage>(
      row,
      columns: columns?.call(GenerativeAIMessage.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<GenerativeAIMessage>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<GenerativeAIMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<GenerativeAIMessage>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<GenerativeAIMessage> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    GenerativeAIMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<GenerativeAIMessage>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<GenerativeAIMessage>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<GenerativeAIMessageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<GenerativeAIMessage>(
      where: where(GenerativeAIMessage.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<GenerativeAIMessageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<GenerativeAIMessage>(
      where: where?.call(GenerativeAIMessage.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
