import 'package:ecoquest/model/challenge.dart';
import 'package:ecoquest/pages/challenge_list.dart';
import 'package:ecoquest/pages/main_page.dart';
import 'package:ecoquest/pages/previous_challenges.dart';
import 'package:ecoquest/pages/welcome_page.dart';
import 'package:ecoquest/utils/app_routes.dart';
import 'package:ecoquest/utils/challenge_preferences.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ChallengePreferences.init();

  ChallengePreferences.printChallengeList();

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
      initialRoute: ChallengePreferences.isFirstLaunch() ? '/welcome':'/',
      routes: {
        AppRoutes.mainPage : (build) => MainPage(),
        AppRoutes.challengeList : (build) => ChallengeList(),
        AppRoutes.previousChallenges : (build) => PreviousChallenges(),
        AppRoutes.welcome : (build) => WelcomePage()
      }
    );
  }
}