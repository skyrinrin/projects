import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF70CFFF),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
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
