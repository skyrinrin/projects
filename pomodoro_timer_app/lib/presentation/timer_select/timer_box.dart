import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_timer_app/presentation/timer_select/timer_circle_mini.dart';

class TimerBox extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 180,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1),
      ),
      child: Stack(
        children: [
          Center(
            child: CustomPaint(
              size: const Size(100, 100),
              painter: TimerMiniPainter(),
            ),
          ),
          Center(
            child: Text(
              '25',
              style: TextStyle(fontSize: 40, color: Colors.black),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: null,
              icon: Icon(Icons.more_vert, color: Colors.black, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}
