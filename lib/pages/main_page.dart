import 'package:ecoquest/components/app_button.dart';
import 'package:ecoquest/model/challenge.dart';
import 'package:ecoquest/utils/app_routes.dart';
import 'package:ecoquest/utils/challenge_preferences.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  Challenge? currentActiveChallenge;

  @override
  void initState() {
    currentActiveChallenge = ChallengePreferences.getActiveChallenge() ?? Challenge(title: "NA", description: "NA", active: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => print("Toggle light/dark mode"), 
                  child: Text("Light/Dark Mode Button")
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      color: Colors.black,
                      child: Text("Day", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      color: Colors.white,
                      child: Text("Hour", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            const SizedBox(height: 24,),
            Container(
              height: 125,
              width: 125,
              color: Colors.black38,
              child: Align(alignment: Alignment.center, child: Text("Image goes here")),
            ),
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Text("Your Challenge This Week:", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 16,),
                    Text(currentActiveChallenge!.title, style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),
                    const SizedBox(height: 12,),
                    Text(currentActiveChallenge!.description, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: Column(
                children: [
                  AppButton(
                    buttonText: "Roll Challenges", 
                    onPressed: () => ChallengePreferences.resetPrefs(),),
                  AppButton(
                    buttonText: "List Of Challenges", 
                    onPressed: () => Navigator.of(context).pushNamed(AppRoutes.challengeList)),
                  AppButton(
                    buttonText: "Previous Challenges", 
                    onPressed: () => Navigator.of(context).pushNamed(AppRoutes.previousChallenges)),
                ],
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}