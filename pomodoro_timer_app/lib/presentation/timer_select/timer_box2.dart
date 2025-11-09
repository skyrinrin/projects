import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_timer_app/domain/timer_model.dart';
import 'package:pomodoro_timer_app/presentation/timer_select/timer_box.dart';
import 'package:pomodoro_timer_app/presentation/timer_select/timer_circle_static.dart';
import 'package:pomodoro_timer_app/provider/provider.dart';

class TimerBox2 extends ConsumerWidget {
  //   TimerModel timerModel;
  // TimerBox({super.key, required this.timerModel});
  TimerModel timerModel;
  TimerBox2({super.key, required this.timerModel});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool _isVisi = false;
    final color = Color(timerModel.color);
    String timeText = '--';
    String unitText = '--';
    double fontSize = 28;

    final mainTime = timerModel.mainTime;
    final subTime = timerModel.subTime;

    // if (time.inSeconds <= 3600) {
    // timeText = time.inSeconds.toString();
    // unitText = '分';

    void selectTime() {
      if (subTime.inSeconds == 0) {
        _isVisi = false;
        if (mainTime.inSeconds < 3600) {
          timeText =
              '${mainTime.inMinutes.toString().padLeft(2, '0')}:${(mainTime.inSeconds % 60).toString().padLeft(2, '0')}';
          fontSize = 28;
        } else {
          timeText =
              '${mainTime.inHours.toString().padLeft(2, '0')}:${(mainTime.inMinutes % 60).toString().padLeft(2, '0')}:${(mainTime.inSeconds % 60).toString().padLeft(2, '0')}';
          fontSize = 22;
        }

        //   if (time.inSeconds % 60 == 0) {
        //     timeText = '${time.inMinutes}:${time.inSeconds % 60}';
        //   } else {
        //     if (time.inSeconds < 60) {
        //       timeText = time.inSeconds.toString();
        //       unitText = '秒';
        //     } else {
        //       timeText = time.inMinutes.toString();
        //     }
        //   }
        // } else {
        //   // timeText = time.inMinutes.toString();
        //   unitText = '時間';
        //   if (time.inMinutes % 60 != 0) {
        //     timeText = '${time.inMinutes}:${time.inMinutes % 60}';
        //   }
      } else {
        _isVisi = true;
        if (mainTime.inSeconds < 3600) {
          timeText =
              '${mainTime.inMinutes.toString().padLeft(2, '0')}:${(mainTime.inSeconds % 60).toString().padLeft(2, '0')}';
          fontSize = 28;
          unitText =
              '${subTime.inMinutes.toString().padLeft(2, '0')}:${(subTime.inSeconds % 60).toString().padLeft(2, '0')}';
        } else {
          timeText =
              '${mainTime.inHours.toString().padLeft(2, '0')}:${(mainTime.inMinutes % 60).toString().padLeft(2, '0')}:${(mainTime.inSeconds % 60).toString().padLeft(2, '0')}';
          fontSize = 22;
          unitText =
              '${subTime.inMinutes.toString().padLeft(2, '0')}:${(subTime.inSeconds % 60).toString().padLeft(2, '0')}';
        }
      }
    }

    selectTime();

    return Container(
      width: 180,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(255, 151, 150, 150),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: CustomPaint(
              size: const Size(100, 100),
              painter: TimerStaticPainter(
                radius: 54,
                strokeWidth: 6,
                color: color,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  timeText,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.black,
                    height: 1.3,
                  ),
                ),
                Visibility(
                  visible: _isVisi,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.more_time, size: 16),
                      Text(
                        unitText,
                        style: TextStyle(
                          fontSize: 14,
                          // color: const Color.fromARGB(255, 104, 104, 104),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.more_vert,
                color: const Color.fromARGB(255, 121, 121, 121),
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
