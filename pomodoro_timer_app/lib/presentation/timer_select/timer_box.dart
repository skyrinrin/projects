import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_timer_app/presentation/timer_select/timer_circle_static.dart';
import 'package:pomodoro_timer_app/provider/provider.dart';

class TimerBox extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Colors.amber;
    return Container(
      width: 180,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(255, 151, 150, 150),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: CustomPaint(
              size: const Size(100, 100),
              painter: TimerStaticPainter(
                radius: 54,
                strokeWidth: 10,
                color: color,
              ),
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
              icon: Icon(
                Icons.more_vert,
                color: const Color.fromARGB(255, 0, 0, 0),
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
