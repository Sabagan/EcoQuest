import 'package:ecoquest/components/app_button.dart';
import 'package:ecoquest/model/challenge.dart';
import 'package:ecoquest/utils/app_routes.dart';
import 'package:ecoquest/utils/challenge_preferences.dart';
import 'package:flutter/material.dart';

/* 
 * Welcome user, display "thank you for your commitment" text
 * Let user set up theme color and choose light or dark mode
 * Make theme color green and set to light mode by default
 * Set up day of the week and time to get challenge (this data will then be accessed in SharedPreferences)
 * After user chooses when to get a challenge, activate the continue button  
 * When continue button clicked, roll a random challenge, then go to home page
 */

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = false;

    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Text("Welcome"),
        AppButton(
          buttonText: "Continue",
          onPressed: () {
            ChallengePreferences.addChallenge(Challenge(
                title: "No Plastic Straws",
                description: "Try not to use plastic straws this week.",
                active: false));
            ChallengePreferences.addChallenge(Challenge(
                title: "Lightning Shower",
                description: "Reduce shower time to 5 minutes to save water.",
                active: false));

            ChallengePreferences.activateRandomChallenge();

            ChallengePreferences.printChallengeList();

            Navigator.of(context).pushReplacementNamed(AppRoutes.mainPage);
          },
          textColor: isDarkMode ? Colors.white : Colors.black,
        ),
      ],
    )));
  }
}
