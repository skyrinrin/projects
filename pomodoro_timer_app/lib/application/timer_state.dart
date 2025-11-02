// lib/domain/timer_state.dart
import 'dart:convert';

class TimerState {
  final int remainingSeconds;
  final int totalSeconds;
  final bool isRunning;

  const TimerState({
    required this.remainingSeconds,
    required this.totalSeconds,
    required this.isRunning,
  });

  /// 初期状態（例：25分）
  factory TimerState.initial() {
    return const TimerState(
      remainingSeconds: 1500,
      totalSeconds: 1500,
      isRunning: false,
    );
  }

  /// 状態を部分的に更新（immutableな書き方）
  TimerState copyWith({
    int? remainingSeconds,
    int? totalSeconds,
    bool? isRunning,
  }) {
    return TimerState(
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      totalSeconds: totalSeconds ?? this.totalSeconds,
      isRunning: isRunning ?? this.isRunning,
    );
  }

  /// JSONに変換（保存用）
  Map<String, dynamic> toJson() {
    return {'remainingSeconds': remainingSeconds, 'isRunning': isRunning};
  }

  /// JSONから復元（読み込み用）
  factory TimerState.fromJson(Map<String, dynamic> json) {
    return TimerState(
      totalSeconds: json['totalSeconds'] ?? 1500,
      remainingSeconds: json['remainingSeconds'] ?? 1500,
      isRunning: json['isRunning'] ?? false,
    );
  }

  /// JSON文字列に変換（SharedPreferencesなどで保存しやすい）
  String toJsonString() => jsonEncode(toJson());

  /// JSON文字列から復元
  factory TimerState.fromJsonString(String jsonStr) {
    return TimerState.fromJson(jsonDecode(jsonStr));
  }

  @override
  String toString() =>
      'TimerState(remainingSeconds: $remainingSeconds, , totalSeconds: $totalSeconds, isRunning: $isRunning)';
}
