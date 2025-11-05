import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:pomodoro_timer_app/application/timer_state.dart';
import '../infrastructure/timer_state_repository.dart';

class TimerNotifier extends StateNotifier<TimerState> {
  final TimerStateRepository repository;
  Timer? _timer;

  TimerNotifier(this.repository) : super(TimerState.initial());

  Future<void> load() async {
    state = await repository.loadTimerState();
  }

  void start() {
    if (state.isRunning) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      if (state.remainingSeconds > 0) {
        state = state.copyWith(remainingSeconds: state.remainingSeconds - 1);
        await repository.saveTimerState(state);
      } else {
        stop();
      }
    });

    state = state.copyWith(isRunning: true);
    repository.saveTimerState(state);
  }

  void stop() {
    _timer?.cancel();
    state = state.copyWith(isRunning: false);
    repository.saveTimerState(state);
  }

  void reset() {
    _timer?.cancel();
    state = TimerState.initial();
    repository.saveTimerState(state);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
