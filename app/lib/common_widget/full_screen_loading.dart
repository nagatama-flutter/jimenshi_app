import 'package:flutter/material.dart';

class FullScreenLoading extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const FullScreenLoading({
    required this.child,
    required this.isLoading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.45),
              child: const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                  strokeWidth: 6,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
