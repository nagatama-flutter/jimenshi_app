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

abstract class GenerativeAISpeechAudio
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  GenerativeAISpeechAudio._({
    required this.conversationId,
    required this.text,
    required this.audioFileUrl,
  });

  factory GenerativeAISpeechAudio({
    required int conversationId,
    required String text,
    required String audioFileUrl,
  }) = _GenerativeAISpeechAudioImpl;

  factory GenerativeAISpeechAudio.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return GenerativeAISpeechAudio(
      conversationId: jsonSerialization['conversationId'] as int,
      text: jsonSerialization['text'] as String,
      audioFileUrl: jsonSerialization['audioFileUrl'] as String,
    );
  }

  int conversationId;

  String text;

  String audioFileUrl;

  GenerativeAISpeechAudio copyWith({
    int? conversationId,
    String? text,
    String? audioFileUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'conversationId': conversationId,
      'text': text,
      'audioFileUrl': audioFileUrl,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'conversationId': conversationId,
      'text': text,
      'audioFileUrl': audioFileUrl,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _GenerativeAISpeechAudioImpl extends GenerativeAISpeechAudio {
  _GenerativeAISpeechAudioImpl({
    required int conversationId,
    required String text,
    required String audioFileUrl,
  }) : super._(
          conversationId: conversationId,
          text: text,
          audioFileUrl: audioFileUrl,
        );

  @override
  GenerativeAISpeechAudio copyWith({
    int? conversationId,
    String? text,
    String? audioFileUrl,
  }) {
    return GenerativeAISpeechAudio(
      conversationId: conversationId ?? this.conversationId,
      text: text ?? this.text,
      audioFileUrl: audioFileUrl ?? this.audioFileUrl,
    );
  }
}
