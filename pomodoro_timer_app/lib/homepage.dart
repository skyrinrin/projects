import 'package:flutter/material.dart';
import 'package:pomodoro_timer_app/presentation/bottom_nav.dart';
import 'package:pomodoro_timer_app/presentation/screen/home_screen.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: HomeScreen()),
        bottomNavigationBar: BottomNav(),
      ),
    );
  }
}
