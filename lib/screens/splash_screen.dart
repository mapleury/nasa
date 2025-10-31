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
      final x = (i * 47 + progress * 150 * (i % 5 + 1)) % size.width;
      final y = (i * 113 + progress * 200 * ((i % 7) + 1)) % size.height;
      final radius = _rng.nextDouble() * 1.5 + 0.3;
      final opacity = 0.1 + sin(progress * 2 * pi * i) * 0.1;
      paint.color = Colors.white.withOpacity(opacity);
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant SubtleStarfieldPainter oldDelegate) => true;
}

class SplashScreen extends StatefulWidget {
  final Widget homeScreen;

  const SplashScreen({super.key, required this.homeScreen});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _progressController;

  @override
  void initState() {
    super.initState();

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (_) => widget.homeScreen));
      }
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _progressController,
        builder: (context, child) {
          return CustomPaint(
            painter: SubtleStarfieldPainter(_progressController.value),
            child: child,
          );
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.grey.shade300.withOpacity(0.3),
                      Colors.grey.shade900.withOpacity(0.9),
                    ],
                    center: Alignment(-0.2, -0.2),
                    radius: 0.8,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.15),
                      blurRadius: 20,
                      spreadRadius: 5,
                      offset: const Offset(-5, -5),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 15,
                      spreadRadius: 5,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Solnari II',
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Orbits of Time',
                style: TextStyle(
                  fontFamily: 'Orbit',
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(color: Colors.white70),
            ],
          ),
        ),
      ),
    );
  }
}
