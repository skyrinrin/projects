import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_timer_app/presentation/timer/timer_circle.dart';
import 'package:pomodoro_timer_app/presentation/timer_select/color_picker.dart';
import 'package:pomodoro_timer_app/presentation/timer_select/pomodoro_toggle.dart';
import 'package:pomodoro_timer_app/presentation/timer_select/time_picker.dart';
import 'package:pomodoro_timer_app/presentation/timer_select/timer_circle_static.dart';
import 'package:pomodoro_timer_app/provider/provider.dart';

class TimerEditor extends ConsumerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    final editorMode = ref.watch(editorModeProvider);
    Widget selectButton() {
      return GestureDetector(
        onTap: () {
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

    // final size = MediaQuery.of(context).size;
    // final height = size.height;
    // print('高さ: $height');
    // final width = size.width;
    return FractionallySizedBox(
      // alignment: Alignment.topLeft,
      // heightFactor: 0.9,
      heightFactor: 0.95,
      widthFactor: 1,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 32),
              Align(
                alignment: Alignment.topLeft,
                child: Text('タイマーを作成', style: TextStyle(fontSize: 24)),
              ),
              SizedBox(height: 132),
              CustomPaint(
                size: const Size(100, 100),
                painter: TimerStaticPainter(
                  radius: 120,
                  strokeWidth: 18,
                  color: editorMode
                      ? Color.fromARGB(255, 159, 241, 203)
                      : ref.watch(mainColorPickerValueProvider),
                ),
                child: ShowTimeBox(
                  notifierProvider: editorMode
                      ? mainTimePickerValueProvider
                      : subTimePickerValueProvider,
                ),
              ),

              SizedBox(height: 132),
              TimePicker(
                notifierProvider: editorMode
                    ? mainTimePickerValueProvider
                    : subTimePickerValueProvider,
              ),
              SizedBox(height: 32),
              Align(
                alignment: Alignment.centerLeft,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Visibility(
                        visible: !editorMode,
                        child: ColorPicker(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: PomodoroToggle(),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 60),
              selectButton(),
            ],
          ),
        ),
      ),
    );
  }
}
