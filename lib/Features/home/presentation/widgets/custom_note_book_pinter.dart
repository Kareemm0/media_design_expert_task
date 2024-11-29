import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class NotebookPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = AppColors.teal;

    const double lineHeight = 50;
    for (double y = 0; y < size.height; y += lineHeight) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    final Paint marginPaint = Paint()..color = AppColors.teal;
    canvas.drawLine(
        const Offset(50, -40), Offset(50, size.height), marginPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
