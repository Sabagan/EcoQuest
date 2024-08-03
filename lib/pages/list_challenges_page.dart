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
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );

    final inputTextStyle = TextStyle(
      color: widget.isDarkMode ? Colors.white : Colors.black,
      fontSize: 16,
    );

    return Scaffold(
      backgroundColor: widget.isDarkMode ? Colors.blue[400] : Colors.blue[100],
      appBar: AppBar(
        title: const Text("List of Challenges"),
        backgroundColor:
            widget.isDarkMode ? Colors.blue[100] : Colors.blue[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: challenges.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    color: widget.isDarkMode ? Colors.black : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(challenges[index], style: textStyle),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Add Custom Challenge",
                labelStyle: inputTextStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: widget.isDarkMode ? Colors.black : Colors.white,
              ),
              style: inputTextStyle,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor:
                    widget.isDarkMode ? Colors.blue[100] : Colors.blue[400],
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
              onPressed: _addCustomChallenge,
              child: const Text("Add Challenge",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
