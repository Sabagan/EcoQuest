import 'package:flutter/material.dart';

class ListChallengesPage extends StatefulWidget {
  final bool isDarkMode;

  const ListChallengesPage({super.key, required this.isDarkMode});

  @override
  _ListChallengesPageState createState() => _ListChallengesPageState();
}

class _ListChallengesPageState extends State<ListChallengesPage> {
  final List<String> challenges = [
    "Use a reusable straw",
    "Recycle paper and plastic",
    "Plant a tree",
    "Use a reusable shopping bag",
    "Reduce water usage",
    "Turn off lights when not in use",
    "Bike to work",
    "Use public transportation",
    "Compost food waste",
    "Avoid single-use plastics"
  ];

  final TextEditingController _controller = TextEditingController();

  void _addCustomChallenge() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        challenges.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: widget.isDarkMode ? Colors.white : Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      backgroundColor: widget.isDarkMode ? Colors.blue[400] : Colors.blue[100],
      appBar: AppBar(
        title: const Text("List of Challenges"),
        backgroundColor:
            widget.isDarkMode ? Colors.blue[100] : Colors.blue[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: challenges.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
                    child: Text(challenges[index], style: textStyle),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Add Custom Challenge",
                  labelStyle: TextStyle(
                      color: widget.isDarkMode ? Colors.white : Colors.black),
                  border: const OutlineInputBorder(),
                ),
                style: TextStyle(
                    color: widget.isDarkMode ? Colors.white : Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                ),
                onPressed: _addCustomChallenge,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Add Challenge",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
