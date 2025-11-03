import 'dart:math';

import 'package:flutter/material.dart';

// class TimerCircleMini extends StatelessWidget {
//   const TimerCircleMini({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 40,
//       height: 40,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Color(0xFFB7E9FF),
//       ),
//     );
//   }
// }

class TimerStaticPainter extends CustomPainter {
  double radius; //ここを柔軟に対応できるようにする
  double strokeWidth;
  Color color;

  TimerStaticPainter({
    required this.radius,
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);

    final circlePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, circlePaint);
  }

  @override
  bool shouldRepaint(TimerStaticPainter oldDelegate) => false;
}
