// lib/domain/timer_state.dart
import 'dart:convert';

class TimerState {
  final int mainRemainingSeconds;
  final int mainTotalSeconds;
  final int subRemainingSeconds;
  final int subTotalSeconds;
  final bool isRunning;
  final int count;

  const TimerState({
    required this.mainRemainingSeconds,
    required this.mainTotalSeconds,
    required this.subRemainingSeconds,
    required this.subTotalSeconds,
    required this.isRunning,
    required this.count,
  });

  /// 初期状態（例：25分）
  factory TimerState.initial() {
    return const TimerState(
      mainRemainingSeconds: 1500,
      mainTotalSeconds: 1500,
      subRemainingSeconds: 300,
      subTotalSeconds: 300,
      isRunning: false,
      count: 1,
    );
  }

  /// 状態を部分的に更新（immutableな書き方）
  TimerState copyWith({
    int? mainRemainingSeconds,
    int? mainTotalSeconds,
    int? subRemainingSeconds,
    int? subTotalSeconds,
    bool? isRunning,
    int? count,
  }) {
    return TimerState(
      mainRemainingSeconds: mainRemainingSeconds ?? this.mainRemainingSeconds,
      mainTotalSeconds: mainTotalSeconds ?? this.mainTotalSeconds,
      subRemainingSeconds: subRemainingSeconds ?? this.subRemainingSeconds,
      subTotalSeconds: subTotalSeconds ?? this.subTotalSeconds,
      isRunning: isRunning ?? this.isRunning,
      count: count ?? this.count,
    );
  }

  /// JSONに変換（保存用）
  Map<String, dynamic> toJson() {
    return {
      'remainingSeconds': mainRemainingSeconds, 'isRunning': isRunning,
      'mainRemainingSeconds': mainRemainingSeconds,
      'mainTotalSeconds': mainTotalSeconds,
      'subRemainingSeconds': subRemainingSeconds,
      'subTotalSeconds': subTotalSeconds,
      'count': count,
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
      count: json['count'] ?? 1,
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
      'TimerState(mainRemainingSeconds: $mainRemainingSeconds, , mainTotalSeconds: $mainTotalSeconds, subRemainingSeconds: $subRemainingSeconds, subTotalSeconds: $subTotalSeconds,isRunning: $isRunning, count: $count)';
}
