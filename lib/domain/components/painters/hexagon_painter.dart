import 'dart:math';

import 'package:flutter/material.dart';

class HexagonPainter extends CustomPainter {
  final Paint hexagonPaint = Paint();
  final Color color;

  HexagonPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    hexagonPaint.color = color;
    hexagonPaint.style = PaintingStyle.fill;
    hexagonPaint.strokeWidth = 3;

    final path = Path();

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;

    for (int edge = 0; edge < 6; edge++) {
      final rad60Degrees = (pi / 3);
      final angle = rad60Degrees * edge - pi / 2;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      if (edge == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(path, hexagonPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
