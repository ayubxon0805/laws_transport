import 'package:flutter/material.dart';

class CheckAnswers {
  static Color checkQuestion(
      int optionIndex, int? currentIndex, int selectedIndex) {
    if (currentIndex == optionIndex) {
      return Colors.green;
    } else {
      if (optionIndex == selectedIndex) {
        return Colors.red;
      } else {
        return Color.fromARGB(255, 176, 171, 171);
      }
    }
  }
}
