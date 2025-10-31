import 'package:flutter/material.dart';

class TimerValue extends StatefulWidget {
  const TimerValue({super.key, required this.time});
  final time;

  @override
  State<TimerValue> createState() => _TimerValueState();
}

class _TimerValueState extends State<TimerValue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.orangeAccent,
      height: 180,
      width: 206,
      child: Column(
        children: [
          Text(widget.time, style: TextStyle(fontSize: 75)),
          // Text('5:00', style: TextStyle(fontSize: 75, height: 1.0)),
          // SizedBox(height: 40),
          Text('終了予定', style: TextStyle(fontSize: 18)),
          Text('10:06', style: TextStyle(fontSize: 20)),
          // Text('終了予定', style: TextStyle(fontSize: 18, height: 1.0)),
          // Text('10:06', style: TextStyle(fontSize: 20, height: 1.0)),
        ],
      ),
    );
  }
}

//ここにタイマーの中身部分を描画するが、タイマーの状態をどこで持つかは検討中
