import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:pomodoro_timer_app/domain/timer_model.dart';
import 'package:pomodoro_timer_app/infrastructure/timer_model_repositroy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../application/timer_notifier.dart';
import 'package:pomodoro_timer_app/application/timer_state.dart';
import '../infrastructure/timer_state_repository.dart';

final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final timerStateRepositoryProvider = Provider((ref) => TimerStateRepository());
final timerModelRepositoryProvider = Provider<TimerModelRepositroy>((ref) {
  final prefs = ref.watch(sharedPrefsProvider);
  return TimerModelRepositroy(prefs);
});

final timerProvider = StateNotifierProvider<TimerNotifier, TimerState>((ref) {
  final repo = ref.watch(timerStateRepositoryProvider);
  final timerModel = ref.watch(selectedTimerModelProvider);
  return TimerNotifier(repo, timerModel!);
});

//現在選ばれているタイマーのモデル
class selectedTimerModelNotifier extends Notifier<TimerModel> {
  @override
  TimerModel build() => TimerModel(
    mainTime: Duration(seconds: 1500),
    subTime: Duration(seconds: 300),
    color: const Color(0xFFB7E9FF),
  );

  void selectTimerModel(TimerModel model) {
    state = model;
  }
}

final selectedTimerModelProvider =
    NotifierProvider<selectedTimerModelNotifier, TimerModel>(
      selectedTimerModelNotifier.new,
    );

//編集画面のモード
class editorModeNotifier extends Notifier<bool> {
  @override
  bool build() => false;
  void changeMode(bool newValue) {
    state = newValue;
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

  void clearValue() {
    state = Duration();
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

  void clearValue() {
    state = Color(0xFFB7E9FF);
  }
}

final mainColorPickerValueProvider =
    NotifierProvider<mainColorPickerNotifier, Color>(
      mainColorPickerNotifier.new,
    );

//タイマー追加処理
class TimerController extends Notifier<void> {
  @override
  void build() {}

  Future<void> saveTimer() async {
    final mainTime = ref.read(mainTimePickerValueProvider);
    // if (mainTime.inSeconds == 0) {
    //   return;
    // }
    final subTime = ref.read(subTimePickerValueProvider);
    final color = ref.read(mainColorPickerValueProvider);

    final timer = TimerModel(
      mainTime: mainTime,
      subTime: subTime,
      color: color,
    );

    final repo = ref.read(timerModelRepositoryProvider);
    await repo.add(timer);

    //UI反映用
    ref.read(timerListProvider.notifier).addTimer(timer);

    ref.read(mainTimePickerValueProvider.notifier).clearValue();
    ref.read(subTimePickerValueProvider.notifier).clearValue();
    ref.read(mainColorPickerValueProvider.notifier).clearValue();
    ref.read(editorModeProvider.notifier).changeMode(false);
  }
}

final TimerControllerProvider = NotifierProvider<TimerController, void>(
  TimerController.new,
);

//タイマーリスト
class modelListNotifier extends Notifier<List<TimerModel>> {
  @override
  List<TimerModel> build() {
    final repo = ref.read(timerModelRepositoryProvider);
    return repo.loadTimerModelList();
  }

  //UI反映用
  void addTimer(TimerModel timer) {
    state = [...state, timer];
  }
}

final timerListProvider = NotifierProvider<modelListNotifier, List<TimerModel>>(
  modelListNotifier.new,
);
