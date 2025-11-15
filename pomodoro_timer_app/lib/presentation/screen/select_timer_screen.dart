import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_timer_app/domain/timer_model.dart';
import 'package:pomodoro_timer_app/presentation/screen/timer_screen.dart';
import 'package:pomodoro_timer_app/main_screen.dart';
import 'package:pomodoro_timer_app/presentation/timer_select/timer_box.dart';
import 'package:pomodoro_timer_app/presentation/timer_select/timer_box.dart';
import 'package:pomodoro_timer_app/provider/provider.dart';

class SelectTimerScreen extends ConsumerWidget {
  const SelectTimerScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _timerList = ref.watch(timerListProvider);
    return
    // SingleChildScrollView(
    Container(
      // color: Colors.amber,
      // height: 1000,
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
          //
          // Container(
          //   // height: _timerList.length * 180,
          //   height: 100,
          Expanded(
            child: GridView.builder(
              // scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              itemCount: _timerList.length,
              // shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return TimerBox(timerModel: _timerList[index], key: key);
              },
              // ),
            ),
          ),

          //
          // TimerBox2(
          //   timerModel: TimerModel(
          //     mainTime: Duration(seconds: 60),
          //     subTime: Duration(seconds: 0),
          //     color: Color(0xFFB7E9FF),
          //   ),
          // ),
          // TimerBox2(
          //   timerModel: TimerModel(
          //     mainTime: Duration(seconds: 360),
          //     subTime: Duration(seconds: 10),
          //     color: Color(0xFFB7E9FF),
          //   ),
          // ),
          // TimerBox(),

          //
          // GridView.builder(
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     crossAxisSpacing: 12,
          //     childAspectRatio: 1.2,
          //   ),
          //   itemBuilder: (context, index) {},
          // ),

          //
        ],
      ),
    );
  }
}
