import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pomodoro_timer_app/application/timer_state.dart';

// class TimerStateRepository {
//   //どこで使うかわかんない タイマーの状態保存はメモリの役割だから使わない方がいい
//   static const _key = 'timer_state';

//   /// 状態を保存
//   Future<void> saveTimerState(TimerState state) async {
//     final prefs = await SharedPreferences.getInstance();
//     final jsonString = jsonEncode(state.toJson());
//     await prefs.setString(_key, jsonString);
//   }

//   /// 状態を読み込み（存在しない場合は初期値）
//   Future<TimerState> loadTimerState() async {
//     final prefs = await SharedPreferences.getInstance();
//     final jsonString = prefs.getString(_key);
//     if (jsonString == null) {
//       return TimerState.initial();
//     }
//     final map = jsonDecode(jsonString) as Map<String, dynamic>;
//     return TimerState.fromJson(map);
//   }

//   /// 状態の削除
//   Future<void> clear() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_key);
//   }
// }
