import 'package:flutter/material.dart';

class StacklyLogo extends StatelessWidget {
  final Color color;
  final double iconSize;
  final bool showWordmark;

  const StacklyLogo({
    super.key,
    this.color = Colors.white,
    this.iconSize = 26,
    this.showWordmark = true,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showWordmark)
            Image.asset(
              'assets/images/stackly_logo_transparent.png',
              width: iconSize * 3.37,
              height: iconSize,
              fit: BoxFit.contain,
            )
          else
            SizedBox(width: iconSize, height: iconSize, child: CustomPaint(painter: _StacklyMarkPainter(color))),
        ],
      );
}

class _StacklyMarkPainter extends CustomPainter {
  final Color color;
  const _StacklyMarkPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide / 32;
    final path = Path()
      ..moveTo(25.8 * s, 3.2 * s)
      ..cubicTo(24.5 * s, 8.8 * s, 20.4 * s, 11.5 * s, 15.4 * s, 14.2 * s)
      ..cubicTo(10.5 * s, 16.9 * s, 5.2 * s, 19.6 * s, 3.7 * s, 25.7 * s)
      ..cubicTo(2.3 * s, 31.3 * s, 7.2 * s, 32.2 * s, 11.2 * s, 30.9 * s)
      ..lineTo(25.4 * s, 26.1 * s)
      ..cubicTo(29.4 * s, 24.7 * s, 30.2 * s, 20.6 * s, 27.3 * s, 18.2 * s)
      ..lineTo(23.1 * s, 14.8 * s)
      ..cubicTo(21.4 * s, 17.2 * s, 19.5 * s, 18.8 * s, 17.1 * s, 20.1 * s)
      ..lineTo(22.3 * s, 22.2 * s)
      ..lineTo(9.7 * s, 26.5 * s)
      ..cubicTo(11.6 * s, 22.7 * s, 16.8 * s, 20.2 * s, 21.7 * s, 17.4 * s)
      ..cubicTo(27.4 * s, 14.1 * s, 31.1 * s, 10.6 * s, 31.7 * s, 5.5 * s)
      ..cubicTo(32.1 * s, 1.8 * s, 28.5 * s, 0.5 * s, 25.8 * s, 3.2 * s)
      ..close();
    canvas.drawPath(path, Paint()..color = color..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant _StacklyMarkPainter oldDelegate) => oldDelegate.color != color;
}
