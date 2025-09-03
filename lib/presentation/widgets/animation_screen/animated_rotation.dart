import 'dart:math';

import 'package:flutter/material.dart';

class RotationAnimation extends StatelessWidget {
  const RotationAnimation({
    super.key,
    required this.animation,
    required this.child,
  });

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.rotate(angle: pi * animation.value, child: child);
      },
      child: child,
    );
  }
}
