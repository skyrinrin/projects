import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_timer_app/presentation/bottom_nav.dart';
import 'package:pomodoro_timer_app/presentation/screen/account_screen.dart';
import 'package:pomodoro_timer_app/presentation/screen/home_screen.dart';
import 'package:pomodoro_timer_app/presentation/screen/point_screen.dart';
import 'package:pomodoro_timer_app/presentation/screen/report_screen.dart';
import 'package:pomodoro_timer_app/presentation/screen/select_timer_screen.dart';
import 'package:pomodoro_timer_app/presentation/screen/timer_screen.dart';
import 'package:pomodoro_timer_app/presentation/timer_select/timer_editor.dart';
import 'package:pomodoro_timer_app/provider/provider.dart';

class MainScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainScreen> {
  int _currentIndex = 0;

  final _screens = [
    HomeScreen(),
    ReportScreen(),
    SelectTimerScreen(),
    PointScreen(),
    AccountScreen(),
    TimerScreen(),
  ];

  void changeTab(int index) {
    final _timerState = ref.watch(timerProvider);
    setState(() {
      if (index == 2 &&
          _timerState.totalSeconds != _timerState.remainingSeconds) {
        //現状ではタイマーが停止している状態でも遷移されない (タイマーが一度でも動いたかを確認しないといけない)
        _currentIndex = 5;
      } else {
        _currentIndex = index;
      }
    });
  }

  // }

  // class MainScreen extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white), //ここにいろいろする
      backgroundColor: Colors.white,
      body: SafeArea(child: _screens[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF70CFFF),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: changeTab,
        // onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: '記録'),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'タイマー'),
          BottomNavigationBarItem(icon: Icon(Icons.stars), label: 'ポイント'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'アカウント'),
        ],
      ),
      floatingActionButton: _currentIndex == 2
          ? FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () async {
                await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  builder: (context) => TimerEditor(),
                );
              },

              child: Icon(Icons.add, color: Colors.white, size: 32),
              backgroundColor: Color(0xFF51BBFD),
            )
          : null,
    );
  }
}
