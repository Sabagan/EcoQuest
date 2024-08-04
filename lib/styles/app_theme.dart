import 'package:flutter/material.dart';

class AppTheme{
  static var currentAppTheme = greenTheme;
  static var mode = "light";

  static void setAppTheme(Map<String, Map<String, Color?>> appTheme){
    currentAppTheme = appTheme;
  }
  static void toggleLightMode(){
    if (mode == "light"){
      mode = "dark";
    }
    else{
      mode = "light";
    }
  }

  static final greenTheme = {
    "light":
    {
      "bg": Colors.greenAccent,
      "text": Colors.black
    },
    "dark":
    {
      "bg": Colors.green[900],
      "text": Colors.white
    }
  };
}