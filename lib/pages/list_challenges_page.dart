import 'package:flutter/material.dart';
import 'package:ecoquest/model/challenge.dart';
import 'package:ecoquest/utils/challenge_preferences.dart';

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

  void _showThemeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Theme Mode'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Light Mode'),
              Switch(
                value: widget.isDarkMode,
                onChanged: (bool value) {
                  Navigator.of(context).pop();
                  widget.onThemeChanged(value);
                },
              ),
              Text('Dark Mode'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Challenges'),
        backgroundColor:
            widget.isDarkMode ? Colors.blue[700] : Colors.blue[300],
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: _showThemeDialog,
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
              color: widget.isDarkMode ? Colors.blue[900] : Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              elevation: 4,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(
                  challenge.title,
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  challenge.description,
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.white70 : Colors.black87,
                    fontSize: 16,
                  ),
                ),
                leading: Icon(
                  Icons.eco,
                  color: widget.isDarkMode ? Colors.greenAccent : Colors.green,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCustomChallenge,
        child: Icon(Icons.add),
        backgroundColor:
            widget.isDarkMode ? Colors.blue[700] : Colors.blue[300],
      ),
    );
  }
}
