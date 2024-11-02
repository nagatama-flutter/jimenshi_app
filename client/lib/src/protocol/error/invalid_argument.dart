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

abstract class InvalidArgument
    implements _i1.SerializableException, _i1.SerializableModel {
  InvalidArgument._({this.error});

  factory InvalidArgument({String? error}) = _InvalidArgumentImpl;

  factory InvalidArgument.fromJson(Map<String, dynamic> jsonSerialization) {
    return InvalidArgument(error: jsonSerialization['error'] as String?);
  }

  String? error;

  InvalidArgument copyWith({String? error});
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

class _InvalidArgumentImpl extends InvalidArgument {
  _InvalidArgumentImpl({String? error}) : super._(error: error);

  @override
  InvalidArgument copyWith({Object? error = _Undefined}) {
    return InvalidArgument(error: error is String? ? error : this.error);
  }
}
