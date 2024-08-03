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
    return Scaffold(
      body: Center(child: Text("Welcome")),
    );
  }
}