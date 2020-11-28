import 'package:flutter/material.dart';

class Utilities{

  static TextStyle smBoldTextStyle({Color color}){
    return TextStyle(
      fontSize: 14,
      color: color,
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle smTextStyle({Color color}){
    return TextStyle(
      fontSize: 14,
      color: color,
    );
  }
  static TextStyle mdBoldTextStyle({Color color}){
    return TextStyle(
      fontSize: 17,
      color: color,
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle mdTextStyle({Color color}){
    return TextStyle(
      fontSize: 17,
      color: color,
    );
  }
  static TextStyle xlgBoldTextStyle({Color color}){
    return TextStyle(
      fontSize: 21,
      color: color,
      fontWeight: FontWeight.bold,
    );
  }
  static TextStyle xlgTextStyle({Color color}){
    return TextStyle(
      fontSize: 21,
      color: color,
    );
  }
}