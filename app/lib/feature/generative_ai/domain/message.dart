import 'package:flutter/material.dart';

sealed class Message {
  int? get id;
  String get content;

  const Message._();
}

@immutable
class InputMessage implements Message {
  @override
  final int? id;

  @override
  final String content;

  const InputMessage(this.id, this.content);
}

@immutable
class GeneratedMessage implements Message {
  @override
  final int? id;

  @override
  final String content;

  const GeneratedMessage(this.id, this.content);
}
