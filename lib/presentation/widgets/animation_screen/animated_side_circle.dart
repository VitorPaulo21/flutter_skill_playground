import 'package:app/presentation/widgets/animation_screen/circle_container.dart';
import 'package:flutter/material.dart';

class AnimatedSideCircle extends StatelessWidget {
  const AnimatedSideCircle({
    super.key,
    required this.animation,
    required this.color,
    required this.direction,
  });

  final Animation<double> animation;
  final Color color;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            direction == Axis.horizontal ? animation.value : 0,
            direction == Axis.vertical ? animation.value : 0,
          ),
          child: CircleContainer(size: 50, color: color),
        );
      },
    );
  }
}
