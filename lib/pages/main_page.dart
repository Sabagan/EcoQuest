import 'package:ecoquest/components/app_button.dart';
import 'package:ecoquest/model/challenge.dart';
import 'package:ecoquest/utils/app_routes.dart';
import 'package:ecoquest/utils/challenge_preferences.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const MainPage(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Challenge? currentActiveChallenge;

  @override
  void initState() {
    super.initState();
    currentActiveChallenge = ChallengePreferences.getCurrentActiveChallenge() ??
        Challenge(title: "NA", description: "NA", active: false);
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: widget.isDarkMode ? Colors.white : Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );

    final descriptionStyle = TextStyle(
      color: widget.isDarkMode ? Colors.white : Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );

    return Scaffold(
      backgroundColor: widget.isDarkMode ? Colors.blue[400] : Colors.blue[100],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            widget.isDarkMode ? Colors.blue[100] : Colors.blue[400],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: "Back"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ChallengePreferences.resetPrefs(),
        child: Icon(Icons.refresh),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: widget.toggleTheme,
                  child: const Text("Toggle Light/Dark Mode"),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      color: Colors.black,
                      child: const Text(
                        "Day",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      color: Colors.white,
                      child: const Text(
                        "Hour",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              height: 125,
              width: 125,
              color: Colors.black38,
              child: const Center(child: Text("Image goes here")),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Title That Could Possibly Be Very Long Goes Here",
                  style: textStyle,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Description that could even more possibly be pretty long goes here",
                  style: descriptionStyle,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Text(
                      "Your Challenge This Week:",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      currentActiveChallenge!.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      currentActiveChallenge!.description,
                      style: descriptionStyle,
                    ),
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
                    onPressed: () {
                      setState(() {
                        currentActiveChallenge =
                            ChallengePreferences.rollRandomChallenge(
                                currentActiveChallenge!.id!);
                      });
                    },
                  ),
                  AppButton(
                    buttonText: "List Of Challenges",
                    onPressed: () => Navigator.of(context)
                        .pushNamed(AppRoutes.challengeList),
                  ),
                  AppButton(
                    buttonText: "Previous Challenges",
                    onPressed: () => Navigator.of(context)
                        .pushNamed(AppRoutes.previousChallenges),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
