import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final bool isMine;
  final String message;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isMine,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Opacity(
        opacity: 0.55,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          constraints: const BoxConstraints(maxWidth: 220),
          decoration: BoxDecoration(
            color: isMine
                ? Colors.green.withOpacity(0.33)
                : Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            message,
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
