import 'package:ecoquest/components/app_button.dart';
import 'package:ecoquest/model/challenge.dart';
import 'package:ecoquest/utils/app_routes.dart';
import 'package:ecoquest/utils/challenge_preferences.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
            Spacer(),
            SizedBox(height: 24,),
            Container(
              height: 125,
              width: 125,
              color: Colors.black38,
              child: Align(alignment: Alignment.center, child: Text("Image goes here")),
            ),
            const SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: Align(
                alignment: Alignment.center,
                child: Text("Title That Could Possible Be Very Long Goes Here", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
              ),
            ),
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: Align(
                alignment: Alignment.center,
                child: Text("Description that could even more possibly be pretty long goes here", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),),
              ),
            ),
            Spacer(),
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