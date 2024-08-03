import 'package:ecoquest/pages/main_page.dart';
import 'package:ecoquest/pages/list_challenges_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: _isDarkMode ? Colors.blue : Colors.lightBlue,
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            MainPage(toggleTheme: _toggleTheme, isDarkMode: _isDarkMode),
        '/list_challenges': (context) =>
            ListChallengesPage(isDarkMode: _isDarkMode),
      },
    );
  }
}
