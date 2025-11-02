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

class TimerMiniPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = 50; //ここを柔軟に対応できるようにする

    final circlePaint = Paint()
      ..color = const Color(0xFFB7E9FF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawCircle(center, 58, circlePaint);
  }

  @override
  bool shouldRepaint(TimerMiniPainter oldDelegate) => false;
}
