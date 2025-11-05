import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_timer_app/provider/provider.dart';

class PomodoroToggle extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(editorModeProvider);
    return Container(
      height: 82,
      width: 128,
      // color: Colors.red,
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.more_time),
              Text('ポモドーロ', style: TextStyle(fontSize: 20)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SizedBox(width: 24),
              CupertinoSwitch(
                value: value,
                onChanged: (bool newValue) {
                  ref.read(editorModeProvider.notifier).changeMode(newValue);
                },
              ), //11/03 ここを変更したらタイマーの設定がポモドーロになるように変更する
            ],
          ),
        ],
      ),
    );
  }
}
