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

abstract class GenerativeAISpeechAudio implements _i1.SerializableModel {
  GenerativeAISpeechAudio._({
    required this.conversationId,
    required this.text,
    required this.audioFileUrl,
    required this.sentiment,
  });

  factory GenerativeAISpeechAudio({
    required int conversationId,
    required String text,
    required String audioFileUrl,
    required String sentiment,
  }) = _GenerativeAISpeechAudioImpl;

  factory GenerativeAISpeechAudio.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return GenerativeAISpeechAudio(
      conversationId: jsonSerialization['conversationId'] as int,
      text: jsonSerialization['text'] as String,
      audioFileUrl: jsonSerialization['audioFileUrl'] as String,
      sentiment: jsonSerialization['sentiment'] as String,
    );
  }

  int conversationId;

  String text;

  String audioFileUrl;

  String sentiment;

  GenerativeAISpeechAudio copyWith({
    int? conversationId,
    String? text,
    String? audioFileUrl,
    String? sentiment,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'conversationId': conversationId,
      'text': text,
      'audioFileUrl': audioFileUrl,
      'sentiment': sentiment,
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
    required String sentiment,
  }) : super._(
          conversationId: conversationId,
          text: text,
          audioFileUrl: audioFileUrl,
          sentiment: sentiment,
        );

  @override
  GenerativeAISpeechAudio copyWith({
    int? conversationId,
    String? text,
    String? audioFileUrl,
    String? sentiment,
  }) {
    return GenerativeAISpeechAudio(
      conversationId: conversationId ?? this.conversationId,
      text: text ?? this.text,
      audioFileUrl: audioFileUrl ?? this.audioFileUrl,
      sentiment: sentiment ?? this.sentiment,
    );
  }
}
