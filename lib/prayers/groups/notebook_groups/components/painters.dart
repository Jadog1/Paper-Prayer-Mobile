import 'package:flutter/material.dart';

/// Custom painter for notebook paper lines effect.
/// Creates horizontal ruled lines to simulate notebook paper.
class NotebookLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE8DCC8).withValues(alpha: 0.4)
      ..strokeWidth = 1.0;

    const lineSpacing = 20.0;
    for (double y = 0; y < size.height; y += lineSpacing) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Custom painter for corner fold effect on notebook cards.
/// Creates a small triangular fold in the top-right corner.
class CornerFoldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width - size.width, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    final paint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);

    final borderPaint = Paint()
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width - size.width, size.height),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
