import 'package:flutter/material.dart';

class IsVisibleIconButton extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onPressed;

  const IsVisibleIconButton({
    required this.isVisible,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: isVisible
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
    );
  }
}
