import 'dart:async';
import 'dart:convert';

import 'package:pomodoro_timer_app/domain/timer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerModelRepositroy {
  final SharedPreferences prefs;
  static const _key = 'timer_models';
  TimerModelRepositroy(this.prefs);

  List<TimerModel> loadTimerModelList() {
    final list = prefs.getStringList(_key);
    if (list == null) return [];
    // return TimerModel.fromJson(jsonEncode(json));
    return list.map((jsonStr) {
      final map = jsonDecode(jsonStr) as Map<String, dynamic>;
      return TimerModel.fromJson(map);
    }).toList();
  }

  Future<void> saveTimerModelList(List<TimerModel> models) async {
    final list = models.map((m) => jsonEncode(m.toJson())).toList();
    await prefs.setStringList(_key, list);
    print('保存しました');
  }

  Future<void> add(TimerModel model) async {
    final models = loadTimerModelList();
    models.add(model);
    await saveTimerModelList(models);
  }
}
