import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_timer_app/presentation/screen/timer_screen.dart';
import 'package:pomodoro_timer_app/main_screen.dart';
import 'package:pomodoro_timer_app/presentation/timer_select/timer_box.dart';

class SelectTimerScreen extends ConsumerWidget {
  const SelectTimerScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('タイマー選択'),
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context).pushNamed('/timer');
              final state = context.findAncestorStateOfType<MainScreenState>();
              state?.changeTab(5);
            },
            child: Text('タイマー'),
          ),
          TimerBox(),
        ],
      ),
    );
  }
}
