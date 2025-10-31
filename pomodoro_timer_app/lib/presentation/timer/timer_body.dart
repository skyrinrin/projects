import 'package:flutter/material.dart';
import 'package:pomodoro_timer_app/presentation/timer/timer_circle.dart';

class TimerBody extends StatefulWidget {
  const TimerBody({super.key});

  @override
  State<TimerBody> createState() => _TimerBodyState();
}

class _TimerBodyState extends State<TimerBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 330,
      width: 330,
      child: Stack(children: [Positioned(child: TimerCircle())]),
    );
  }
}
