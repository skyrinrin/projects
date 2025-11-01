class TimerModel {
  final Duration total;
  final Duration remaining;
  final bool isRunning;
  final DateTime? targetEnd; //nullなら停止中

  TimerModel({
    required this.total,
    required this.remaining,
    required this.isRunning,
    required this.targetEnd,
  });

  TimerModel copyWith({
    Duration? total,
    Duration? remaining,
    bool? isRunning,
    DateTime? targetEnd,
  }) => TimerModel(
    total: total ?? this.total,
    remaining: remaining ?? this.remaining,
    isRunning: isRunning ?? this.isRunning,
    targetEnd: targetEnd ?? this.targetEnd,
  );
}
