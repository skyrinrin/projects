// lib/domain/timer_state.dart
import 'dart:convert';

class TimerState {
  final int mainTotalSeconds;
  final int mainRemainingSeconds;
  final int subTotalSeconds;
  final int subRemainingSeconds;
  final bool isRunning;
  final bool timerMode;
  final int totalSeconds;

  const TimerState({
    required this.mainTotalSeconds,
    required this.mainRemainingSeconds,
    required this.subTotalSeconds,
    required this.subRemainingSeconds,
    required this.isRunning,
    required this.timerMode,
    required this.totalSeconds,
  });

  /// 初期状態（例：25分）
  factory TimerState.initial() {
    return const TimerState(
      mainTotalSeconds: 1500,
      mainRemainingSeconds: 1500,
      subTotalSeconds: 300,
      subRemainingSeconds: 300,
      isRunning: false,
      timerMode: true,
      totalSeconds: 0,
    );
  }

  /// 状態を部分的に更新（immutableな書き方）
  TimerState copyWith({
    int? mainTotalSeconds,
    int? mainRemainingSeconds,
    int? subTotalSeconds,
    int? subRemainingSeconds,
    bool? isRunning,
    bool? timerMode,
    int? totalSeconds,
  }) {
    return TimerState(
      mainTotalSeconds: mainTotalSeconds ?? this.mainTotalSeconds,
      mainRemainingSeconds: mainRemainingSeconds ?? this.mainRemainingSeconds,
      subTotalSeconds: subTotalSeconds ?? this.subTotalSeconds,
      subRemainingSeconds: subRemainingSeconds ?? this.subRemainingSeconds,
      isRunning: isRunning ?? this.isRunning,
      timerMode: timerMode ?? this.timerMode,
      totalSeconds: totalSeconds ?? this.totalSeconds,
    );
  }

  /// JSONに変換（保存用）
  Map<String, dynamic> toJson() {
    return {
      // 'remainingSeconds': mainRemainingSeconds, 'isRunning': isRunning,
      'mainTotalSeconds': mainTotalSeconds,
      'mainRemainingSeconds': mainRemainingSeconds,
      'subTotalSeconds': subTotalSeconds,
      'subRemainingSeconds': subRemainingSeconds,
      'isRunning': isRunning,
      'timerMode': timerMode,
      'totalSeconds': totalSeconds,
      // 'isRunning': isRunning
    };
  }

  /// JSONから復元（読み込み用）
  factory TimerState.fromJson(Map<String, dynamic> json) {
    return TimerState(
      mainTotalSeconds: json['totalSeconds'] ?? 1500,
      mainRemainingSeconds: json['remainingSeconds'] ?? 1500,
      subTotalSeconds: json['subTotalSeconds'] ?? 300,
      subRemainingSeconds: json['subRemainingSeconds'] ?? 300,
      isRunning: json['isRunning'] ?? false,
      timerMode: json['timerMode'] ?? true,
      totalSeconds: json['totalSeconds'] ?? 0,
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
      'TimerState(mainTotalSeconds: $mainTotalSeconds, mainRemainingSeconds: $mainRemainingSeconds, subTotalSeconds: $subTotalSeconds, subRemainingSeconds: $subRemainingSeconds, isRunning: $isRunning, timerMode: $timerMode, totalSeconds: $totalSeconds)';
}
