import 'package:flutter/material.dart';
import 'package:ecoquest/model/challenge.dart';
import 'package:ecoquest/utils/challenge_preferences.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ListChallengesPage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const ListChallengesPage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  _ListChallengesPageState createState() => _ListChallengesPageState();
}

class _ListChallengesPageState extends State<ListChallengesPage> {
  List<Challenge> _challenges = [];

  @override
  void initState() {
    super.initState();
    _loadChallenges();
  }

  void _loadChallenges() {
    setState(() {
      _challenges = ChallengePreferences.getChallengeList();
    });
  }

  void _addCustomChallenge() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final titleController = TextEditingController();
        final descriptionController = TextEditingController();

        return AlertDialog(
          title: Text('Add Custom Challenge'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                final newChallenge = Challenge(
                  title: titleController.text,
                  description: descriptionController.text,
                  active: false,
                );
                ChallengePreferences.addChallenge(newChallenge);
                _loadChallenges();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List of Challenges',
          style: TextStyle(
            color: widget.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,
        actions: [
          Row(
            children: [
              FlutterSwitch(
                value: widget.isDarkMode,
                onToggle: (val) {
                  widget.onThemeChanged(val);
                },
                activeColor: Colors.black,
                inactiveColor: Colors.blue,
                activeToggleColor: Colors.white,
                inactiveToggleColor: Colors.orange,
                activeSwitchBorder: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                inactiveSwitchBorder: Border.all(
                  color: Colors.blue,
                  width: 2.0,
                ),
                activeIcon: Image.asset(
                  'assets/images/moon.png',
                  height: 20,
                  width: 20,
                ),
                inactiveIcon: Image.asset(
                  'assets/images/sun.png',
                  height: 20,
                  width: 20,
                ),
                activeText: "Night",
                inactiveText: "Day",
                activeTextColor: Colors.white,
                inactiveTextColor: Colors.black,
              ),
              // Text(
              //   widget.isDarkMode ? 'Dark Mode' : 'Light Mode',
              //   style: TextStyle(
              //     color: widget.isDarkMode ? Colors.white : Colors.black,
              //   ),
              // ),
              // Switch(
              //   value: widget.isDarkMode,
              //   onChanged: (bool value) {
              //     widget.onThemeChanged(value);
              //   },
              // ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _challenges.length,
          itemBuilder: (context, index) {
            final challenge = _challenges[index];
            return Card(
              color: widget.isDarkMode ? Colors.blue[200] : Colors.blue[900],
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              elevation: 4,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(
                  challenge.title,
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.black : Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  challenge.description,
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.black87 : Colors.white70,
                    fontSize: 16,
                  ),
                ),
                leading: Image.asset(challenge.image!, width: 64, height: 64,),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCustomChallenge,
        child: Icon(Icons.add),
        backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,
      ),
    );
  }
}
