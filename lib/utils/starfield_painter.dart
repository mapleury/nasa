import 'dart:math';
import 'package:flutter/material.dart';

class SubtleStarfieldPainter extends CustomPainter {
  final double progress;
  final Random _rng = Random();

  SubtleStarfieldPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      colors: [Colors.black, const Color(0xFF050515)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    final rect = Offset.zero & size;
    canvas.drawRect(rect, Paint()..shader = gradient.createShader(rect));

    final paint = Paint();
    for (int i = 0; i < 70; i++) {
      final x = (i * 47 + progress * 100) % size.width;
      final y = (i * 113 + progress * 200) % size.height;
      final radius = _rng.nextDouble() * 1.2 + 0.3;
      final opacity = 0.15 + sin(progress * 2 * pi * i) * 0.1;
      paint.color = Colors.white.withOpacity(opacity);
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant SubtleStarfieldPainter oldDelegate) => true;
}
