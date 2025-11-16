import 'package:flutter/material.dart';

class TimerValue extends StatefulWidget {
  const TimerValue({super.key, required this.time});
  final int time;

  @override
  State<TimerValue> createState() => _TimerValueState();
}

class _TimerValueState extends State<TimerValue> {
  @override
  Widget build(BuildContext context) {
    String _getEndTime(int time) {
      final now = DateTime.now();
      final endTime = now.add(Duration(seconds: time));
      final hour = endTime.hour.toString().padLeft(2, '0');
      final minute = endTime.minute.toString().padLeft(2, '0');
      return '$hour:$minute';
    }

    final total = widget.time;

    final hours = total ~/ 3600;
    final minutes = (total % 3600) ~/ 60;
    final seconds = total % 60;

    // フォーマット自動切り替え
    String formattedTime;
    if (hours > 0) {
      formattedTime =
          '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      formattedTime =
          '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }

    // テキストの長さに応じてフォントサイズを調整

    //ここから: Textのサイズが00:00:00対応になったときにsizedBoxの大きさの関係でレイアウトが崩れる

    final int length = formattedTime.length;

    double fontSize;
    if (length <= 5) {
      // 例: 12:34
      fontSize = 75;
    } else if (length <= 8) {
      // 例: 01:12:33
      fontSize = 53;
    } else {
      // それ以上（滅多にないが保険）
      fontSize = 48;
    }

    final endTime = _getEndTime(total);

    return SizedBox(
      height: 180,
      width: 206,
      child: Column(
        children: [
          Text(formattedTime, style: TextStyle(fontSize: fontSize)),
          const SizedBox(height: 0),
          const Text(
            '終了予定',
            style: TextStyle(fontSize: 18, color: Color(0xFF4A4A4A)),
          ),
          Text(
            endTime,
            style: const TextStyle(fontSize: 20, color: Color(0xFF4A4A4A)),
          ),
        ],
      ),
    );
  }
}
