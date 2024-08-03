import 'package:flutter/material.dart';

class PreviousChallenges extends StatelessWidget {
  const PreviousChallenges({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Previous Challenges"),
      ),
      body: Center(child: Text("Previous Challenges"),),
    );
  }
}