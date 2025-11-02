import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_timer_app/presentation/bottom_nav.dart';
import 'package:pomodoro_timer_app/presentation/screen/account_screen.dart';
import 'package:pomodoro_timer_app/presentation/screen/home_screen.dart';
import 'package:pomodoro_timer_app/presentation/screen/point_screen.dart';
import 'package:pomodoro_timer_app/presentation/screen/report_screen.dart';
import 'package:pomodoro_timer_app/presentation/screen/select_timer_screen.dart';

class MainScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _currentIndex = 0;

  final _screens = [
    HomeScreen(),
    ReportScreen(),
    SelectTimerScreen(),
    PointScreen(),
    AccountScreen(),
  ];

  // }

  // class MainScreen extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(splashColor: Color(0xFF70CFFF)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: _screens[_currentIndex]),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF70CFFF),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => setState(() => _currentIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: '記録'),
            BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'タイマー'),
            BottomNavigationBarItem(icon: Icon(Icons.stars), label: 'ポイント'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'アカウント'),
          ],
        ),
      ),
    );
  }
}
