import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:pomodoro_timer_app/application/timer_state.dart';
import 'package:pomodoro_timer_app/domain/timer_model.dart';
import 'package:pomodoro_timer_app/presentation/screen/select_timer_screen.dart';
import '../infrastructure/timer_state_repository.dart';

class TimerNotifier extends StateNotifier<TimerState> {
  // final TimerStateRepository repository;
  Timer? _timer;
  TimerModel timerModel;

  // TimerNotifier(this.repository) : super(TimerState.initial());
  // TimerNotifier(this.repository) : super(TimerState.initial());
  TimerNotifier(this.timerModel)
    // TimerNotifier(this.repository, this.timerModel)
    : super(
        TimerState(
          mainRemainingSeconds: timerModel.mainTime.inSeconds,
          mainTotalSeconds: timerModel.mainTime.inSeconds,
          subRemainingSeconds: timerModel.subTime.inSeconds,
          subTotalSeconds: timerModel.subTime.inSeconds,
          isRunning: false,
          timerMode: true,
          totalSeconds: 0,
        ),
      );

  TimerState setTimerState() {
    return TimerState(
      mainRemainingSeconds: timerModel.mainTime.inSeconds,
      mainTotalSeconds: timerModel.mainTime.inSeconds,
      subRemainingSeconds: timerModel.subTime.inSeconds,
      subTotalSeconds: timerModel.subTime.inSeconds,
      isRunning: false,
      timerMode: true,
      totalSeconds: 0,
    );
  }

  // Future<void> load() async {
  //   state = await repository.loadTimerState();
  // }

  void start() {
    if (state.isRunning) return;

    //
    state = state.mainRemainingSeconds > 0
        ? state.copyWith(timerMode: true)
        : state.copyWith(timerMode: false);

    if (state.timerMode) {
      _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
        if (state.mainRemainingSeconds > 0) {
          state = state.copyWith(
            mainRemainingSeconds: state.mainRemainingSeconds - 1,
            totalSeconds: state.totalSeconds + 1,
          );
          // await repository.saveTimerState(state);
        } else {
          stop();
        }
      });
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
        if (state.subRemainingSeconds > 0) {
          state = state.copyWith(
            subRemainingSeconds: state.subRemainingSeconds - 1,
            // totalSeconds: state.totalSeconds + 1,
          );
          // await repository.saveTimerState(state);  //重くなるため毎度保存しない
        } else {
          stop();
        }
      });
    }
    //

    state = state.copyWith(isRunning: true);
    // repository.saveTimerState(state);
  }

  void stop() {
    _timer?.cancel();
    state = state.copyWith(isRunning: false);
    // repository.saveTimerState(state);
  }

  void reset() {
    _timer?.cancel();
    state = setTimerState();
    state = state.copyWith(isRunning: false);
    // state = TimerState.initial();
    // repository.saveTimerState(state);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
