import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_timer_app/presentation/timer/timer_buttons.dart';
import 'package:pomodoro_timer_app/presentation/timer/timer_circle.dart';

class TimerScreen extends ConsumerWidget {
  const TimerScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        // Center(child: TimerBody()),
        SizedBox(height: 120),
        Center(
          child: SizedBox(height: 330, width: 330, child: CircularTimer()),
        ),
        SizedBox(height: 64),
        TimerButtons(),
      ],
    );
  }
}
