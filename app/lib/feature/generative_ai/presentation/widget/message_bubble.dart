import 'package:app/feature/generative_ai/domain/message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.alignment,
      child: Padding(
        padding: message.outerPadding,
        child: DecoratedBox(
          decoration: message.decoration,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (message.imageData != null)
                  Image.memory(
                    message.imageData!,
                    fit: BoxFit.cover,
                  ),
                SelectableText(message.content),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension on Message {
  EdgeInsets get outerPadding => switch (this) {
        InputMessage() => const EdgeInsets.only(left: 8),
        GeneratedMessage() => const EdgeInsets.only(right: 32),
      };

  Alignment get alignment => switch (this) {
        InputMessage() => Alignment.centerRight,
        GeneratedMessage() => Alignment.centerLeft,
      };

  BoxDecoration get decoration => BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: switch (this) {
          InputMessage() => Colors.grey.shade300,
          GeneratedMessage() => Colors.green.shade100,
        },
      );
}
