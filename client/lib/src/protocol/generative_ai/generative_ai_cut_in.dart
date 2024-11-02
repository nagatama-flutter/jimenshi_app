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

abstract class GenerativeAICutIn implements _i1.SerializableModel {
  GenerativeAICutIn._({required this.conversationId});

  factory GenerativeAICutIn({required int conversationId}) =
      _GenerativeAICutInImpl;

  factory GenerativeAICutIn.fromJson(Map<String, dynamic> jsonSerialization) {
    return GenerativeAICutIn(
        conversationId: jsonSerialization['conversationId'] as int);
  }

  int conversationId;

  GenerativeAICutIn copyWith({int? conversationId});
  @override
  Map<String, dynamic> toJson() {
    return {'conversationId': conversationId};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _GenerativeAICutInImpl extends GenerativeAICutIn {
  _GenerativeAICutInImpl({required int conversationId})
      : super._(conversationId: conversationId);

  @override
  GenerativeAICutIn copyWith({int? conversationId}) {
    return GenerativeAICutIn(
        conversationId: conversationId ?? this.conversationId);
  }
}
