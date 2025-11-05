import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import '../application/timer_notifier.dart';
import 'package:pomodoro_timer_app/application/timer_state.dart';
import '../infrastructure/timer_repository.dart';

final timerRepositoryProvider = Provider((ref) => TimerRepository());

final timerProvider = StateNotifierProvider<TimerNotifier, TimerState>((ref) {
  final repo = ref.watch(timerRepositoryProvider);
  return TimerNotifier(repo);
});

//編集画面のモード
class editorModeNotifier extends Notifier<bool> {
  @override
  bool build() => false;
  void changeMode(bool newValue) {
    state = newValue;
    print('今の状態: $state');
  }
}

final editorModeProvider = NotifierProvider<editorModeNotifier, bool>(
  editorModeNotifier.new,
);

//時間選択ドラムロールの値(メインタイマー)

class timePickerNotifier extends Notifier<Duration> {
  @override
  Duration build() => Duration();
  void selectTime(Duration time) {
    state = time;
  }
}

final mainTimePickerValueProvider =
    NotifierProvider<timePickerNotifier, Duration>(timePickerNotifier.new);

//時間選択ドラムロールの値(ポモドーロタイマー)
// class subTimePickerNotifier extends Notifier<Duration> {
//   @override
//   Duration build() => Duration();
//   void selectTime(Duration time) {
//     state = time;
//   }
// }

final subTimePickerValueProvider =
    NotifierProvider<timePickerNotifier, Duration>(timePickerNotifier.new);

//タイマーメインカラー
class mainColorPickerNotifier extends Notifier<Color> {
  @override
  Color build() => const Color(0xFFB7E9FF); //初期色
  void selectColor(Color color) {
    state = color;
  }
}

final mainColorPickerValueProvider =
    NotifierProvider<mainColorPickerNotifier, Color>(
      mainColorPickerNotifier.new,
    );
//
