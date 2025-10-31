import 'package:flutter/material.dart';

class TimerCircle extends StatefulWidget {
  const TimerCircle({super.key});

  @override
  State<TimerCircle> createState() => _TimerCircleState();
}

class _TimerCircleState extends State<TimerCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      width: 330,
      decoration: BoxDecoration(
        color: Color(0xFFB7E9FF),
        borderRadius: BorderRadius.circular(1000),
        border: Border.all(color: Color(0xFFA8A8A8)),
      ),
      child: Container(
        height: 286,
        width: 286,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(1000),
          border: Border.all(color: Color(0xFFA8A8A8)),
        ),
      ),
    );
  }
}
