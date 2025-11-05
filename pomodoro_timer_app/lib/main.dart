import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_timer_app/main_screen.dart';
import 'package:pomodoro_timer_app/presentation/screen/timer_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [sharedPrefsProvider.overrideWithValue(prefs)],

      child: MyApp(),
    ),
  );
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
