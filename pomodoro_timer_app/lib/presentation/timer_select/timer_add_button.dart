import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_timer_app/provider/provider.dart';

class TimerAddButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        final mainTimeValue = ref.read(mainTimePickerValueProvider);
        if (mainTimeValue.inSeconds == 0) {
          final snackbar = SnackBar(content: const Text('タイマーの時間を設定してください'));
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          return;
        }
        await ref.read(TimerControllerProvider.notifier).saveTimer();
        Navigator.of(context).pop();
      },
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF7B7B7B),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            '追加',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
