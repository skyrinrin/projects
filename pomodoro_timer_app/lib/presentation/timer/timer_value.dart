import 'package:flutter/material.dart';
import 'package:pomodoro_timer_app/application/application.dart';

class TimerValue extends StatefulWidget {
  const TimerValue({super.key, required this.time});
  final int time;

  @override
  State<TimerValue> createState() => _TimerValueState();
}

class _TimerValueState extends State<TimerValue> {
  @override
  Widget build(BuildContext context) {
    final app = Application();
    final _time = app.getProgressTime(widget.time);
    final _hour = '${_time.$1}'.padLeft(1, '0');
    final _second = '${_time.$2}'.padLeft(2, '0');

    final _endTime = app.getEndTime(widget.time);

    return Container(
      // color: Colors.orangeAccent,
      height: 180,
      width: 206,
      child: Column(
        children: [
          Text('$_hour:$_second', style: TextStyle(fontSize: 75)),
          // Text('5:00', style: TextStyle(fontSize: 75, height: 1.0)),
          // SizedBox(height: 40),
          SizedBox(height: 0), //間隔の調整が必要
          Text(
            '終了予定',
            style: TextStyle(fontSize: 18, color: Color(0xFF4A4A4A)),
          ),
          Text(
            '$_endTime',
            style: TextStyle(fontSize: 20, color: Color(0xFF4A4A4A)),
          ),
          // Text('終了予定', style: TextStyle(fontSize: 18, height: 1.0)),
          // Text('10:06', style: TextStyle(fontSize: 20, height: 1.0)),
        ],
      ),
    );
  }
}

//ここにタイマーの中身部分を描画するが、タイマーの状態をどこで持つかは検討中
