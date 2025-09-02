// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/circular_reveal_clipper.dart';

import 'package:app/domain/components/painters/hexagon_painter.dart';

class ExagonWidget extends StatelessWidget {
  const ExagonWidget({Key? key, required this.color, required this.radius})
    : super(key: key);

  final Color color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CircularRevealClipper(fraction: 0.98, maxRadius: radius),
      child: CustomPaint(
        painter: HexagonPainter(color: color),
        size: Size(radius * 2, radius * 2),
      ),
    );
  }
}
