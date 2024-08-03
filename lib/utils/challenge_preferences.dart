import 'dart:convert';
import 'dart:math';

import 'package:ecoquest/model/challenge.dart';
import 'package:ecoquest/utils/app_pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChallengePreferences {
  static SharedPreferences? _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
     
     if (_prefs!.getStringList(AppPrefKeys.keyChallengeList) == null){
      setChallengeListPref([]);
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

  static Future setChallengeListPref(List<String> challengeListJsons) async =>
    await _prefs!.setStringList(AppPrefKeys.keyChallengeList, challengeListJsons);
  
  static Future addChallenge(Challenge challenge) async {
    List<String> challengeStringList = _prefs!.getStringList(AppPrefKeys.keyChallengeList)!;
    
    challenge.id = challengeStringList.length + 1;
    
    challengeStringList.add(jsonEncode(challenge));

    await setChallengeListPref(challengeStringList);
  }

  // Get a random challenge, exclude challenge with given id, which will be the previously active challenge
  static Challenge rollRandomChallenge(int previousActiveChallengeId){
    int previousChallengeActiveIndex = previousActiveChallengeId - 1; // Id is based off index

    List<Challenge> challengeList = getChallengeList();
    
    challengeList[previousChallengeActiveIndex].active = false;

    int randomIndex = Random().nextInt(challengeList.length);
    while (randomIndex == previousChallengeActiveIndex) { randomIndex = Random().nextInt(challengeList.length); }

    challengeList[randomIndex].active = true;

    setChallengeListPref(getChallengeListAsJsonList(challengeList));
    return challengeList[randomIndex];
  }

  static getChallengeListAsJsonList(List<Challenge> challengeList){
    List<String> challengeListJsons = [];
    for (int i = 0; i < challengeList.length; i++){
      challengeListJsons.add(jsonEncode(challengeList[i]));
    }
    return challengeListJsons;
  }

  // This will be called from the welcome page, when the continue button is clicked
  static void activateRandomChallenge() {
    List<Challenge> challengeList = getChallengeList();
    int randomIndex = Random().nextInt(challengeList.length);
    challengeList[randomIndex].active = true;

    setChallengeListPref(getChallengeListAsJsonList(challengeList));
  }

  static Challenge? getCurrentActiveChallenge() {
    List<Challenge> challenges = getChallengeList();

    for (int i = 0; i < challenges.length; i++){
      if (challenges[i].active) return challenges[i];
    }

    return null;
  }

  static int getCurrentActiveChallengeIndex() {
    List<Challenge> challenges = getChallengeList();

    for (int i = 0; i < challenges.length; i++){
      if (challenges[i].active) return i;
    }

    return -1;
  }

  static void printChallengeList() {
    var currList = getChallengeList();
    var challengeListString = "";
    for (int i = 0; i < currList.length; i++)
    {
      challengeListString += "Challenge id: ${currList[i].id}, title: ${currList[i].title}, description: ${currList[i].description}, active: ${currList[i].active}\n";
    }
    challengeListString += "\n";
    print(challengeListString);
  }

  static bool isFirstLaunch() => 
    getChallengeList().isEmpty;

  static Future resetPrefs() async {
    await _prefs!.clear();
  }
}