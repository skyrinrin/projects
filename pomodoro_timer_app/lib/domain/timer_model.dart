import 'package:flutter/material.dart';

class TimerModel {
  final Duration total;
  final Color color;
  // final Duration remaining;
  // final bool isRunning;
  // final DateTime? targetEnd; //nullなら停止中

  TimerModel({
    required this.total,
    required this.color,
    // required this.remaining,
    // required this.isRunning,
    // required this.targetEnd,
  });

  TimerModel copyWith({
    Duration? total,
    Color? color,
    // Duration? remaining,
    // bool? isRunning,
    // DateTime? targetEnd,
  }) => TimerModel(
    total: total ?? this.total,
    color: color ?? this.color,
    // remaining: remaining ?? this.remaining,
    // isRunning: isRunning ?? this.isRunning,
    // targetEnd: targetEnd ?? this.targetEnd,
  );
}
