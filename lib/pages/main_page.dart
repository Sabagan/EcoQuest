import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const MainPage(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: isDarkMode ? Colors.white : Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );

    final descriptionStyle = TextStyle(
      color: isDarkMode ? Colors.white : Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.blue[400] : Colors.blue[100],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDarkMode ? Colors.blue[100] : Colors.blue[400],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: "Back"),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: toggleTheme,
                  child: const Text("Light/Dark Mode Button"),
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
            const SizedBox(
              height: 24,
            ),
            Container(
              height: 125,
              width: 125,
              color: Colors.black38,
              child: const Align(
                  alignment: Alignment.center, child: Text("Image goes here")),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Title That Could Possible Be Very Long Goes Here",
                    style: textStyle),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "Description that could even more possibly be pretty long goes here",
                    style: descriptionStyle),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                ),
                onPressed: () => print("Roll challenges"),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Roll Challenges", style: textStyle),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/list_challenges');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("List Of Challenges", style: textStyle),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                ),
                onPressed: () => print("Previous Challenges"),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Previous Challenges", style: textStyle),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
