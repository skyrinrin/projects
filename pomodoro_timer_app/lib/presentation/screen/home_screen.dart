import 'package:flutter/material.dart';
import 'package:pomodoro_timer_app/presentation/timer/timer_buttons.dart';
import 'package:pomodoro_timer_app/presentation/timer/timer_circle.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(children: [Text('ホームページ')]),
    );
  }
}
