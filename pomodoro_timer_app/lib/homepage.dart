import 'package:flutter/material.dart';
import 'package:pomodoro_timer_app/presentation/home_screen/home_screen.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: HomeScreen()),
    );
  }
}
