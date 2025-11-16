import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_timer_app/presentation/timer/timer_buttons.dart';
import 'package:pomodoro_timer_app/presentation/timer/timer_circle.dart';
import 'package:pomodoro_timer_app/provider/provider.dart';

//休憩時間が何分なのかをこのUIでは直感的に理解できない

class TimerScreen extends ConsumerWidget {
  const TimerScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerProvider);
    final totalTime = timerState.totalSeconds;
    return Column(
      children: [
        // Center(child: TimerBody()),
        // SizedBox(height: 120),
        Align(
          alignment: Alignment.topLeft,
          child: Icon(Icons.arrow_back, size: 32),
        ),
        Text('累計時間', style: TextStyle(fontSize: 20)),
        Text(
          '${totalTime.toString().padLeft(2, '0')}',
          style: TextStyle(fontSize: 40),
        ),

        // '${mainTime.inHours.toString().padLeft(2, '0')}:${(mainTime.inMinutes % 60).toString().padLeft(2, '0')}:${(mainTime.inSeconds % 60).toString().padLeft(2, '0')}';

        // Text('累計時間', style: TextStyle(fontSize: 20, height: 1.0)),
        // Text('00:00:00', style: TextStyle(fontSize: 36, height: 1.0)),
        SizedBox(height: 32),
        Center(
          child: SizedBox(height: 330, width: 330, child: CircularTimer()),
        ),
        SizedBox(height: 64),
        TimerButtons(),
      ],
    );
  }
}
