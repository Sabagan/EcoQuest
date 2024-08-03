import 'dart:convert';
import 'dart:math';

import 'package:ecoquest/model/challenge.dart';
import 'package:ecoquest/utils/app_pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChallengePreferences {
  static int nextId = 1;
  static SharedPreferences? _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
     
     if (_prefs!.getStringList(AppPrefKeys.keyChallengeList) == null){
      setChallengeList([]);
     }
  }
  
  static List<Challenge> getChallengeList() {
    List<String> challengeStringList = _prefs!.getStringList(AppPrefKeys.keyChallengeList) ?? [];
    List<Challenge> challenges = [];

    for (int i = 0; i < challengeStringList.length; i++){
      challenges.add(Challenge.fromJson(jsonDecode(challengeStringList[i])));
    }

    return challenges;
  }

  static Future setChallengeList(List<String> challengeList) async =>
    await _prefs!.setStringList(AppPrefKeys.keyChallengeList, challengeList);
  
  static Future addChallenge(Challenge challenge) async {
    challenge.id = nextId;

    List<String> challengeStringList = _prefs!.getStringList(AppPrefKeys.keyChallengeList)!;

    challengeStringList.add(jsonEncode(challenge));

    await setChallengeList(challengeStringList);

    nextId++;
  }

  // Get a random challenge, exclude challenge with given id
  static Challenge rollRandomChallenge(int id){
    List<Challenge> challengeList = getChallengeList();

    var randomIndex = Random().nextInt(challengeList.length);
    while (randomIndex == id) { randomIndex = Random().nextInt(challengeList.length); }

    return challengeList[randomIndex];
  }

  static Challenge? getActiveChallenge() {
    List<Challenge> challenges = getChallengeList();

    for (int i = 0; i < challenges.length; i++){
      if (challenges[i].active) return challenges[i];
    }

    return null;
  }

  static void printChallengeList() {
    var currList = getChallengeList();
    var challengeListString = "";
    for (int i = 0; i < currList.length; i++)
    {
      challengeListString += "Challenge title: ${currList[i].title}, id: ${currList[i].id}\n";
    }
    challengeListString += "\n";
    print(challengeListString);
  }

  static bool isFirstLaunch() => 
    getChallengeList().isEmpty;

  static Future resetPrefs() async {
    nextId = 1;
    await _prefs!.clear();
  }
}