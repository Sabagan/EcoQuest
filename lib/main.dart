import 'package:ecoquest/pages/challenge_list.dart';
import 'package:ecoquest/pages/main_page.dart';
import 'package:ecoquest/pages/previous_challenges.dart';
import 'package:ecoquest/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 224, 255, 240),
        brightness: Brightness.light
      ),
      initialRoute: '/',
      routes: {
        AppRoutes.mainPage : (build) => MainPage(),
        AppRoutes.challengeList : (build) => ChallengeList(),
        AppRoutes.previousChallenges : (build) => PreviousChallenges()
      }
    );
  }
}