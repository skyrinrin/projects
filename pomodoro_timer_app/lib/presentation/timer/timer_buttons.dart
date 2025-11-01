import 'package:flutter/material.dart';

class TimerButtons extends StatefulWidget {
  const TimerButtons({super.key});

  @override
  State<TimerButtons> createState() => _TimerButtonsState();
}

class _TimerButtonsState extends State<TimerButtons>
    with SingleTickerProviderStateMixin {
  bool isRunning = false;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 500);

    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: isRunning
          ? _buildStopButton(duration)
          : _buildPlayResetButtons(duration),
    );
  }

  /// ------------------------------
  /// 再生中（停止ボタン）
  /// ------------------------------
  Widget _buildStopButton(Duration duration) {
    return GestureDetector(
      onTap: () => setState(() => isRunning = false),
      child: AnimatedContainer(
        duration: duration,
        curve: Curves.easeInOut,
        width: 160,
        height: 60,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 253, 115, 115),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.redAccent.withOpacity(0.4),
              blurRadius: 20,
              spreadRadius: 1,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: const Center(
          // child: Icon(Icons.stop, color: Colors.white, size: 40),
          child: Icon(Icons.pause, color: Colors.white, size: 40),
        ),
      ),
    );
  }

  Widget sumple() {
    return Row(children: [Container()]);
  }

  /// ------------------------------
  /// 停止中（再生＋リセットボタン）
  /// ------------------------------
  Widget _buildPlayResetButtons(Duration duration) {
    return SizedBox(
      width: 336,
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: duration,
            curve: Curves.easeInOutCubic,
            left: 0,
            child: _longButton(
              // label: "▶ 再生",
              mode: true,
              color: Color(0xFF3886FD),
              onTap: () => setState(() => isRunning = true),
            ),
          ),
          AnimatedPositioned(
            duration: duration,
            curve: Curves.easeInOutCubic,
            right: 0,
            child: _longButton(
              // label: "↻ リセット",
              mode: false,
              color: Color(0xFFCDCDCD),
              onTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('リセットしました')));
              },
            ),
          ),
        ],
      ),
    );
  }

  /// ------------------------------
  /// 長丸ボタン共通パーツ
  /// ------------------------------
  Widget _longButton({
    // required String label,
    required bool mode,
    required Color color,
    required VoidCallback onTap,
  }) {
    final _buttonIcon = mode ? Icons.play_arrow : Icons.stop;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 160,
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 15,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(child: Icon(_buttonIcon, color: Colors.white, size: 40)),
      ),
    );
  }
}
