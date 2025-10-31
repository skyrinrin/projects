class Application {
  (int hour, int second) getProgressTime(int time) {
    final hour = time ~/ 60;
    final second = time % 60;
    return (hour, second);
  }
}
