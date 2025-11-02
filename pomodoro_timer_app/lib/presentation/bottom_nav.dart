import 'package:flutter/material.dart';
import 'package:pomodoro_timer_app/presentation/screen/home_screen.dart';
import 'package:pomodoro_timer_app/presentation/screen/select_timer_screen.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  void _onTap(int index, BuildContext context) {
    Widget _page = HomeScreen();
    switch (index) {
      case 0:
        _page = HomeScreen();
        break;
      case 1:
        _page = HomeScreen();
        break;
      case 2:
        _page = SelectTimerScreen();
        break;
      case 3:
        _page = HomeScreen();
        break;
      case 4:
        _page = HomeScreen();
        break;
      default:
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return _page;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF70CFFF),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      onTap: (value) => _onTap(value, context),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: '記録'),
        BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'タイマー'),
        BottomNavigationBarItem(icon: Icon(Icons.stars), label: 'ポイント'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'アカウント'),
      ],
    );
  }
}
