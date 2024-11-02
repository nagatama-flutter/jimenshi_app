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

abstract class InternalError
    implements _i1.SerializableException, _i1.SerializableModel {
  InternalError._({this.error});

  factory InternalError({String? error}) = _InternalErrorImpl;

  factory InternalError.fromJson(Map<String, dynamic> jsonSerialization) {
    return InternalError(error: jsonSerialization['error'] as String?);
  }

  String? error;

  InternalError copyWith({String? error});
  @override
  Map<String, dynamic> toJson() {
    return {if (error != null) 'error': error};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _InternalErrorImpl extends InternalError {
  _InternalErrorImpl({String? error}) : super._(error: error);

  @override
  InternalError copyWith({Object? error = _Undefined}) {
    return InternalError(error: error is String? ? error : this.error);
  }
}
