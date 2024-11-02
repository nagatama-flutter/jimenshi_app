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
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import '../protocol.dart' as _i3;

abstract class GenerativeAIConversation
    implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = GenerativeAIConversationTable();

  static const db = GenerativeAIConversationRepository._();

  @override
  int? id;

  int userId;

  _i2.UserInfo? user;

  List<_i3.GenerativeAIMessage>? messages;

  DateTime createdAt;

  DateTime? updatedAt;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      if (messages != null)
        'messages': messages?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  static GenerativeAIConversationInclude include({
    _i2.UserInfoInclude? user,
    _i3.GenerativeAIMessageIncludeList? messages,
  }) {
    return GenerativeAIConversationInclude._(
      user: user,
      messages: messages,
    );
  }

  static GenerativeAIConversationIncludeList includeList({
    _i1.WhereExpressionBuilder<GenerativeAIConversationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GenerativeAIConversationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GenerativeAIConversationTable>? orderByList,
    GenerativeAIConversationInclude? include,
  }) {
    return GenerativeAIConversationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GenerativeAIConversation.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GenerativeAIConversation.t),
      include: include,
    );
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

class GenerativeAIConversationTable extends _i1.Table {
  GenerativeAIConversationTable({super.tableRelation})
      : super(tableName: 'generative_ai_conversation') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  _i2.UserInfoTable? _user;

  _i3.GenerativeAIMessageTable? ___messages;

  _i1.ManyRelation<_i3.GenerativeAIMessageTable>? _messages;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.UserInfoTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: GenerativeAIConversation.t.userId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i3.GenerativeAIMessageTable get __messages {
    if (___messages != null) return ___messages!;
    ___messages = _i1.createRelationTable(
      relationFieldName: '__messages',
      field: GenerativeAIConversation.t.id,
      foreignField: _i3.GenerativeAIMessage.t.conversationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.GenerativeAIMessageTable(tableRelation: foreignTableRelation),
    );
    return ___messages!;
  }

  _i1.ManyRelation<_i3.GenerativeAIMessageTable> get messages {
    if (_messages != null) return _messages!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'messages',
      field: GenerativeAIConversation.t.id,
      foreignField: _i3.GenerativeAIMessage.t.conversationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.GenerativeAIMessageTable(tableRelation: foreignTableRelation),
    );
    _messages = _i1.ManyRelation<_i3.GenerativeAIMessageTable>(
      tableWithRelations: relationTable,
      table: _i3.GenerativeAIMessageTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _messages!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'messages') {
      return __messages;
    }
    return null;
  }
}

class GenerativeAIConversationInclude extends _i1.IncludeObject {
  GenerativeAIConversationInclude._({
    _i2.UserInfoInclude? user,
    _i3.GenerativeAIMessageIncludeList? messages,
  }) {
    _user = user;
    _messages = messages;
  }

  _i2.UserInfoInclude? _user;

  _i3.GenerativeAIMessageIncludeList? _messages;

  @override
  Map<String, _i1.Include?> get includes => {
        'user': _user,
        'messages': _messages,
      };

  @override
  _i1.Table get table => GenerativeAIConversation.t;
}

class GenerativeAIConversationIncludeList extends _i1.IncludeList {
  GenerativeAIConversationIncludeList._({
    _i1.WhereExpressionBuilder<GenerativeAIConversationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GenerativeAIConversation.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => GenerativeAIConversation.t;
}

class GenerativeAIConversationRepository {
  const GenerativeAIConversationRepository._();

  final attach = const GenerativeAIConversationAttachRepository._();

  final attachRow = const GenerativeAIConversationAttachRowRepository._();

  Future<List<GenerativeAIConversation>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<GenerativeAIConversationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GenerativeAIConversationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GenerativeAIConversationTable>? orderByList,
    _i1.Transaction? transaction,
    GenerativeAIConversationInclude? include,
  }) async {
    return databaseAccessor.db.find<GenerativeAIConversation>(
      where: where?.call(GenerativeAIConversation.t),
      orderBy: orderBy?.call(GenerativeAIConversation.t),
      orderByList: orderByList?.call(GenerativeAIConversation.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<GenerativeAIConversation?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<GenerativeAIConversationTable>? where,
    int? offset,
    _i1.OrderByBuilder<GenerativeAIConversationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GenerativeAIConversationTable>? orderByList,
    _i1.Transaction? transaction,
    GenerativeAIConversationInclude? include,
  }) async {
    return databaseAccessor.db.findFirstRow<GenerativeAIConversation>(
      where: where?.call(GenerativeAIConversation.t),
      orderBy: orderBy?.call(GenerativeAIConversation.t),
      orderByList: orderByList?.call(GenerativeAIConversation.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<GenerativeAIConversation?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
    GenerativeAIConversationInclude? include,
  }) async {
    return databaseAccessor.db.findById<GenerativeAIConversation>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<List<GenerativeAIConversation>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<GenerativeAIConversation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<GenerativeAIConversation>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<GenerativeAIConversation> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    GenerativeAIConversation row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<GenerativeAIConversation>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<GenerativeAIConversation>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<GenerativeAIConversation> rows, {
    _i1.ColumnSelections<GenerativeAIConversationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<GenerativeAIConversation>(
      rows,
      columns: columns?.call(GenerativeAIConversation.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<GenerativeAIConversation> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    GenerativeAIConversation row, {
    _i1.ColumnSelections<GenerativeAIConversationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<GenerativeAIConversation>(
      row,
      columns: columns?.call(GenerativeAIConversation.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<GenerativeAIConversation>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<GenerativeAIConversation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<GenerativeAIConversation>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<GenerativeAIConversation> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    GenerativeAIConversation row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<GenerativeAIConversation>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<GenerativeAIConversation>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<GenerativeAIConversationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<GenerativeAIConversation>(
      where: where(GenerativeAIConversation.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<GenerativeAIConversationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<GenerativeAIConversation>(
      where: where?.call(GenerativeAIConversation.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class GenerativeAIConversationAttachRepository {
  const GenerativeAIConversationAttachRepository._();

  Future<void> messages(
    _i1.DatabaseAccessor databaseAccessor,
    GenerativeAIConversation generativeAIConversation,
    List<_i3.GenerativeAIMessage> generativeAIMessage, {
    _i1.Transaction? transaction,
  }) async {
    if (generativeAIMessage.any((e) => e.id == null)) {
      throw ArgumentError.notNull('generativeAIMessage.id');
    }
    if (generativeAIConversation.id == null) {
      throw ArgumentError.notNull('generativeAIConversation.id');
    }

    var $generativeAIMessage = generativeAIMessage
        .map((e) => e.copyWith(conversationId: generativeAIConversation.id))
        .toList();
    await databaseAccessor.db.update<_i3.GenerativeAIMessage>(
      $generativeAIMessage,
      columns: [_i3.GenerativeAIMessage.t.conversationId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class GenerativeAIConversationAttachRowRepository {
  const GenerativeAIConversationAttachRowRepository._();

  Future<void> user(
    _i1.DatabaseAccessor databaseAccessor,
    GenerativeAIConversation generativeAIConversation,
    _i2.UserInfo user, {
    _i1.Transaction? transaction,
  }) async {
    if (generativeAIConversation.id == null) {
      throw ArgumentError.notNull('generativeAIConversation.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $generativeAIConversation =
        generativeAIConversation.copyWith(userId: user.id);
    await databaseAccessor.db.updateRow<GenerativeAIConversation>(
      $generativeAIConversation,
      columns: [GenerativeAIConversation.t.userId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<void> messages(
    _i1.DatabaseAccessor databaseAccessor,
    GenerativeAIConversation generativeAIConversation,
    _i3.GenerativeAIMessage generativeAIMessage, {
    _i1.Transaction? transaction,
  }) async {
    if (generativeAIMessage.id == null) {
      throw ArgumentError.notNull('generativeAIMessage.id');
    }
    if (generativeAIConversation.id == null) {
      throw ArgumentError.notNull('generativeAIConversation.id');
    }

    var $generativeAIMessage = generativeAIMessage.copyWith(
        conversationId: generativeAIConversation.id);
    await databaseAccessor.db.updateRow<_i3.GenerativeAIMessage>(
      $generativeAIMessage,
      columns: [_i3.GenerativeAIMessage.t.conversationId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}
