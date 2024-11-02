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
import 'dart:typed_data' as _i2;

abstract class GenerativeAIImage implements _i1.SerializableModel {
  GenerativeAIImage._({
    this.byteData,
    this.mimeType,
  });

  factory GenerativeAIImage({
    _i2.ByteData? byteData,
    String? mimeType,
  }) = _GenerativeAIImageImpl;

  factory GenerativeAIImage.fromJson(Map<String, dynamic> jsonSerialization) {
    return GenerativeAIImage(
      byteData: jsonSerialization['byteData'] == null
          ? null
          : _i1.ByteDataJsonExtension.fromJson(jsonSerialization['byteData']),
      mimeType: jsonSerialization['mimeType'] as String?,
    );
  }

  _i2.ByteData? byteData;

  String? mimeType;

  GenerativeAIImage copyWith({
    _i2.ByteData? byteData,
    String? mimeType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (byteData != null) 'byteData': byteData?.toJson(),
      if (mimeType != null) 'mimeType': mimeType,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GenerativeAIImageImpl extends GenerativeAIImage {
  _GenerativeAIImageImpl({
    _i2.ByteData? byteData,
    String? mimeType,
  }) : super._(
          byteData: byteData,
          mimeType: mimeType,
        );

  @override
  GenerativeAIImage copyWith({
    Object? byteData = _Undefined,
    Object? mimeType = _Undefined,
  }) {
    return GenerativeAIImage(
      byteData: byteData is _i2.ByteData? ? byteData : this.byteData?.clone(),
      mimeType: mimeType is String? ? mimeType : this.mimeType,
    );
  }
}
