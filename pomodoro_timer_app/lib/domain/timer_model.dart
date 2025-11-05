import 'dart:convert';

import 'package:flutter/material.dart';

class TimerModel {
  final Duration mainTime;
  final Duration subTime;
  final int color;
  // final Duration remaining;
  // final bool isRunning;
  // final DateTime? targetEnd; //nullなら停止中

  TimerModel({
    required this.mainTime,
    required this.subTime,
    required Color color,
    // required this.remaining,
    // required this.isRunning,
    // required this.targetEnd,
  }) : color = color.value;

  //使う時に復元
  // TimerModel copyWith({
  //   Duration? mainTime,
  //   Duration? subTime,
  //   Color? color,
  //   // Duration? remaining,
  //   // bool? isRunning,
  //   // DateTime? targetEnd,
  // }) => TimerModel(
  //   mainTime: mainTime ?? this.mainTime,
  //   subTime: subTime ?? this.subTime,
  //   color: color ?? this.color,
  //   // remaining: remaining ?? this.remaining,
  //   // isRunning: isRunning ?? this.isRunning,
  //   // targetEnd: targetEnd ?? this.targetEnd,
  // );

  /// JSONに変換（保存用）
  Map<String, dynamic> toJson() {
    return {
      'mainTime': mainTime.inSeconds,
      'subTime': subTime.inSeconds,
      'color': color,
    };
  }

  /// JSONから復元（読み込み用）
  factory TimerModel.fromJson(Map<String, dynamic> json) {
    return TimerModel(
      // mainTime: json['mainTime'] ?? 1500,
      // subTime: json['subTime'] ?? 300,
      // color: json['color'] ?? Color(0xFFB7E9FF),
      mainTime: Duration(seconds: json['mainTime']),
      subTime: Duration(seconds: json['subTime']),
      color: Color(json['color']),
    );
  }

  /// JSON文字列に変換（SharedPreferencesなどで保存しやすい）
  String toJsonString() => jsonEncode(toJson());

  /// JSON文字列から復元
  factory TimerModel.fromJsonString(String jsonStr) {
    return TimerModel.fromJson(jsonDecode(jsonStr));
  }

  @override
  String toString() =>
      'TimerState(mainTime: $mainTime, subTime: $subTime, color: $color)';
}
