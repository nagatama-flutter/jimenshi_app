import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final bool isMine;
  final String message;
  final double opacity;
  final double? maxWidth;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isMine,
    this.opacity = 1,
    this.maxWidth = 220,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Opacity(
        opacity: opacity,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          constraints:
              maxWidth != null ? BoxConstraints(maxWidth: maxWidth!) : null,
          decoration: BoxDecoration(
            color: isMine
                ? Colors.green.withOpacity(1)
                : opacity == 1
                    ? Colors.white
                    : Colors.black.withOpacity(1),
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
