// lib/presentation/timer/circular_timer.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_timer_app/domain/timer_model.dart';
// import 'package:pomodoro_timer_app/application/timer_provider.dart';
import 'package:pomodoro_timer_app/provider/provider.dart';
import 'package:pomodoro_timer_app/presentation/timer/timer_value.dart';

class CircularTimer extends ConsumerWidget {
  const CircularTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerProvider);
    final timerModel = ref.watch(selectedTimerModelProvider);

    final progress =
        timerState.mainRemainingSeconds /
        timerState.mainTotalSeconds; // なぜかカクカク動く
    final remaining = timerState.mainRemainingSeconds;

    return CustomPaint(
      painter: TimerPainter(progress, Color(timerModel.color)),
      child: Center(child: TimerValue(time: remaining)),
    );
  }
}

class TimerPainter extends CustomPainter {
  final double progress;
  final Color color;
  TimerPainter(this.progress, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2 - 11;

    final progressPaint = Paint()
      ..color = color
      ..strokeWidth = 22
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final startAngle = -pi / 2;
    final sweepAngle = 2 * pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(TimerPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
