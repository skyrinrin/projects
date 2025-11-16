// class Application {
//   (int hour, int second) getProgressTime(int time) {
//     final hour = time ~/ 60;
//     final second = time % 60;
//     return (hour, second);
//   }

//   String getEndTime(int time) {
//     final now = DateTime.now();
//     final endTime = now.add(Duration(seconds: time));
//     final hour = endTime.hour.toString().padLeft(2, '0');
//     final minute = endTime.minute.toString().padLeft(2, '0');
//     // print(endTime);
//     return '$hour:$minute';
//   }
// }
