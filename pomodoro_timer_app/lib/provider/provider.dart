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

// final showTimeValueProvider = StateProvider<String>((ref) => '00:00');
final timePickerValueProvider = StateProvider<Duration>((ref) => Duration());
final maincolorPickerValueProvider = StateProvider<Color>(
  (ref) => Color(0xFFB7E9FF),
);
//
