import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/misc.dart';
import 'package:pomodoro_timer_app/provider/provider.dart';

class TimePicker extends ConsumerWidget {
  // Duration _duration = Duration(hours: 0, minutes: 0, seconds: 0);
  // final timePickerValue
  // String _timeValue = '00:00';

  // void changedDuration(Duration newDuration, WidgetRef ref) {
  //   // _duration = newDuration;
  //   // String _hour = '';
  //   // String _minute = '00';
  //   // String _second = '00';
  //   // if (_duration.inHours == 0) {
  //   //   _hour = '';
  //   // }

  //   //

  //   // _timeValue = '$_hour$_minute:$_second'
  // }

  NotifierProvider<timePickerNotifier, Duration> notifierProvider;

  TimePicker({super.key, required this.notifierProvider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duration = ref.watch(notifierProvider);
    return CupertinoTimerPicker(
      //なぜか滑らかに動かない
      key: ValueKey(duration),
      onTimerDurationChanged: (Duration newDuration) {
        ref.read(notifierProvider.notifier).selectTime(newDuration);
      },
      mode: CupertinoTimerPickerMode.hms,
      initialTimerDuration: duration,
      // initialTimerDuration: ref.read(notifierProvider),
    );
  }
}

class ShowTimeBox extends ConsumerWidget {
  NotifierProvider<timePickerNotifier, Duration> notifierProvider;

  ShowTimeBox({super.key, required this.notifierProvider});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timePickerValue = ref.watch(notifierProvider);
    final _time =
        '${timePickerValue.inHours.toString().padLeft(2, '0')}:${(timePickerValue.inMinutes % 60).toString().padLeft(2, '0')}:${(timePickerValue.inSeconds % 60).toString().padLeft(2, '0')}';

    return Center(child: Text(_time, style: TextStyle(fontSize: 50)));
  }
}
