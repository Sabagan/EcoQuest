import 'package:flutter/material.dart';

class ChallengeList extends StatelessWidget {
  const ChallengeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Challenges"),
      ),
      body: Center(child: Text("Challenge Lists"),),
    );
  }
}