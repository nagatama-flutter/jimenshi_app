import 'dart:typed_data';

import 'package:flutter/material.dart';

sealed class Message {
  int? get id;
  String get content;
  Uint8List? get imageData;

  const Message._();
}

@immutable
class InputMessage implements Message {
  @override
  final int? id;

  @override
  final String content;

  @override
  final Uint8List? imageData;

  const InputMessage(this.id, this.content, [this.imageData]);

}

@immutable
class GeneratedMessage implements Message {
  @override
  final int? id;

  @override
  final String content;

  @override
  final Uint8List? imageData;

  const GeneratedMessage(this.id, this.content, [this.imageData]);
  
}
