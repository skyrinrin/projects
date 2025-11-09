//無印から2どちらかを採用する（どっちもはUIの統一性的に良くないかも）

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_timer_app/domain/timer_model.dart';
import 'package:pomodoro_timer_app/presentation/timer_select/timer_circle_static.dart';
import 'package:pomodoro_timer_app/provider/provider.dart';

class TimerBox extends ConsumerWidget {
  TimerModel timerModel;
  TimerBox({super.key, required this.timerModel});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Color(timerModel.color);
    String timeText = '--';
    String unitText = '--';
    double fontSize = 40;

    final time = timerModel.mainTime;

    // if (time.inSeconds <= 3600) {
    // timeText = time.inSeconds.toString();
    // unitText = '分';

    void selectTime() {
      if (timerModel.subTime == 0) {
        if (time.inSeconds < 60) {
          //ここの機構がキモイのとワンちゃん間違ってる
          timeText = time.inSeconds.toString();
          fontSize = 40;
          unitText = '秒';
        } else {
          if (time.inSeconds % 60 == 0) {
            fontSize = 40;
            if (time.inSeconds < 3600) {
              timeText = time.inMinutes.toString();
              unitText = '分';
            } else {
              if (time.inMinutes % 60 == 0) {
                timeText = time.inHours.toString();
                unitText = '時間';
              } else {
                fontSize = 30;
                timeText =
                    '${time.inHours.toString().padLeft(2, '0')}:${(time.inMinutes % 60).toString().padLeft(2, '0')}';
                unitText = '時間';
              }
            }
          } else {
            fontSize = 30;
            if (time.inSeconds < 3600) {
              unitText = '分';
              timeText =
                  '${time.inMinutes.toString().padLeft(2, '0')}:${(time.inSeconds % 60).toString().padLeft(2, '0')}';
            } else {
              unitText = '時間';
              fontSize = 22;
              timeText =
                  '${time.inHours.toString().padLeft(2, '0')}:${(time.inMinutes % 60).toString().padLeft(2, '0')}:${(time.inSeconds % 60).toString().padLeft(2, '0')}';
            }
            // }
          }
        }
      } else {
        fontSize = 22;
        if (time.inSeconds < 3600) {
          timeText =
              '${time.inMinutes.toString().padLeft(2, '0')}:${(time.inSeconds % 60).toString().padLeft(2, '0')}';
          unitText =
              '${timerModel.subTime.inMinutes.toString().padLeft(2, '0')}:${(timerModel.subTime.inSeconds % 60).toString().padLeft(2, '0')}';
        }
        timeText =
            '${time.inHours.toString().padLeft(2, '0')}:${(time.inMinutes % 60).toString().padLeft(2, '0')}:${(time.inSeconds % 60).toString().padLeft(2, '0')}';
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
                    height: 1.0,
                  ),
                ),
                Text(unitText),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.more_vert,
                color: const Color.fromARGB(255, 0, 0, 0),
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
