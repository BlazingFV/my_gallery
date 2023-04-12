import 'package:flutter/material.dart';

class CustomContainerBackground extends CustomPainter {
  final Path path;
  final Color color;
  const CustomContainerBackground({
    required this.path,
    required this.color,
  });

  @override
  bool shouldRepaint(CustomContainerBackground oldDelegate) =>
      oldDelegate.path != path || oldDelegate.color != color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool hitTest(Offset position) => path.contains(position);
}
