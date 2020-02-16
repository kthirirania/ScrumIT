import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];

    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static String convertDateFromString(String dateToConvert, String formatString){

    DateTime convertedDate = DateTime.parse(dateToConvert);
    var formatter = new DateFormat(formatString);
    return formatter.format(convertedDate);
  }

  static String capitalizeSentence(String string){

    List<String> words = string.split(" ");
    List<String> newWords = [];

    String newWord = "";

    for(final word in words){
      newWords.add(word[0].toUpperCase() + word.substring(1).toLowerCase());
    }

    for(int i = 0; i < newWords.length; i++){
      newWord += newWords[i] + " ";
    }

    return newWord;
  }

  static Color getColorFromHex(String color){
    String colorAppend = "0xff";

    return(Color(int.parse(colorAppend += color)));
  }
}
