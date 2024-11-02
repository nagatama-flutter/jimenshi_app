import 'package:flutter/material.dart';

class DeleteTextButton extends StatelessWidget {
  final TextEditingController controller;

  const DeleteTextButton({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (_, value, __) {
        if (value.text.isEmpty) {
          return const SizedBox.shrink();
        }

        return IconButton(
          onPressed: controller.clear,
          icon: const Icon(Icons.close_rounded),
        );
      },
    );
  }
}
