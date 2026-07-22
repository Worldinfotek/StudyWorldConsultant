import 'dart:math';
import 'package:flutter/material.dart';

/// Floating dot particles that drift upward with a gentle side-to-side
/// sway, like they're being carried by wind. Loops seamlessly.
class FloatingParticles extends StatefulWidget {
  final int particleCount;
  final Color particleColor;

  const FloatingParticles({
    super.key,
    this.particleCount = 30,
    this.particleColor = Colors.white,
  });

  @override
  State<FloatingParticles> createState() => _FloatingParticlesState();
}

class _FloatingParticlesState extends State<FloatingParticles>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<_Particle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    for (int i = 0; i < widget.particleCount; i++) {
      _particles.add(_Particle(_random));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _ParticlePainter(
            particles: _particles,
            progress: _controller.value,
            color: widget.particleColor,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class _Particle {
  late final double startX;
  late final double speed;
  late final double size;
  late final double driftAmplitude;
  late final double phase;
  late final double maxOpacity;

  _Particle(Random random) {
    startX = random.nextDouble();
    speed = 0.3 + random.nextDouble() * 0.7;
    size = 1.5 + random.nextDouble() * 3.0;
    driftAmplitude = 10 + random.nextDouble() * 25;
    phase = random.nextDouble() * 2 * pi;
    maxOpacity = 0.25 + random.nextDouble() * 0.45;
  }
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final double progress;
  final Color color;

  _ParticlePainter({
    required this.particles,
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      // Each particle loops on its own cycle based on its speed.
      final double t = (progress * p.speed) % 1.0;

      // Moves from bottom to top of the screen.
      final double y = size.height * (1 - t);

      // Horizontal wind-like sway.
      final double x = p.startX * size.width +
          sin((t * 2 * pi) + p.phase) * p.driftAmplitude;

      // Fades in, stays visible, fades out — smooth loop.
      final double fade = sin(t * pi);

      final paint = Paint()
        ..color = color.withOpacity((p.maxOpacity * fade).clamp(0.0, 1.0))
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(x, y), p.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) => true;
}
