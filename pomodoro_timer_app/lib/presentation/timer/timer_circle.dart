import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_timer_app/application/application.dart';
import 'package:pomodoro_timer_app/presentation/timer/timer_value.dart';

class CircularTimer extends ConsumerStatefulWidget {
  //11/01 ここから始める タイマーの円と文字列部分にProviderの情報を登録する
  final Duration duration;

  const CircularTimer({super.key, required this.duration});

  @override
  ConsumerState<CircularTimer> createState() => _CircularTimerState();
}

class _CircularTimerState extends ConsumerState<CircularTimer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..forward(); // 自動スタート
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
        double progress = 1.0 - _controller.value;
        return CustomPaint(
          painter: TimerPainter(progress),
          child: Center(
            child: TimerValue(
              // time: '${(widget.duration.inSeconds)}',
              // time: '${) (widget.duration.inSeconds * progress).round()}',
              time: (widget.duration.inSeconds * progress).round(),
            ),
            // child: Text(
            //   '${(widget.duration.inSeconds * progress).round()} s',
            //   style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            // ),
          ),
        );
      },
    );
  }
}

class TimerPainter extends CustomPainter {
  final double progress;

  TimerPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2 - 11;

    final backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 22
      ..style = PaintingStyle.stroke;

    final progressPaint = Paint()
      ..color = Color(0xFFB7E9FF)
      ..strokeWidth = 22
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final circlePaintOutBorder = Paint()
      ..color = Color(0xFFA8A8A8)
      ..strokeWidth = 0.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final circlePaintInBorder = Paint()
      ..color = Color(0xFFA8A8A8)
      // ..color = Color(0xFFA8A8A8)
      ..strokeWidth = 0.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    //残り時間の枠線部分(円)
    final progressCircleBorder = Paint()
      ..color = Color(0xFFA8A8A8)
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // 背景円
    // canvas.drawCircle(center, radius, backgroundPaint);
    //

    //円の周りの枠
    // canvas.drawCircle(center, radius + 11, circlePaintInBorder);
    // canvas.drawCircle(center, radius - 11, circlePaintOutBorder);
    //

    double startAngle = -pi / 2;
    double sweepAngle = 2 * pi * progress;
    double halfSweepAngle = sweepAngle = 2 * pi * progress;
    //
    // 残り時間（進行中の円弧）を描く部分のあとに追加
    final endAngle = startAngle + sweepAngle;

    // 円弧の先端の座標を求める
    final endX = center.dx + radius * cos(endAngle) + 0;
    final endY = center.dy + radius * sin(endAngle) + 0;
    final endPoint = Offset(endX, endY);

    // 影用ペイント
    final tipShadowPaint = Paint()
      ..color = Colors.black
      // .withOpacity(0.3) // 少し透明な黒
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6); // ぼかしで柔らかく

    // 先端の「点影」を描く
    // canvas.drawCircle(endPoint, 6, tipShadowPaint); //これが影の部分

    //

    // 残り時間を表す円弧
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      halfSweepAngle,
      false,
      progressPaint,
    );

    //残り時間の円弧の枠部分
    // canvas.drawArc(
    //   Rect.fromCircle(center: center, radius: radius),
    //   startAngle,
    //   sweepAngle,
    //   false,
    //   progressCircleBorder,
    // );
  }

  @override
  bool shouldRepaint(covariant TimerPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
