import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_timer_app/main_screen.dart';
import 'package:pomodoro_timer_app/presentation/screen/timer_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(splashColor: Color(0xFF70CFFF)),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
