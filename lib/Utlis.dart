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

  static String getDate(String start, String end) {
    DateTime startDate = DateTime.parse(start);
    DateTime endDate = DateTime.parse(end);
    Duration difference = endDate.difference(startDate);

    int duration = difference.inDays;

    int y = 0;
    int m = 0;
    int d = 0;

    if (duration > 365) {
      do {
        y += 1;
        duration -= 365;
      } while (duration > 365);
    }
    if (duration > 30) {
      do {
        m += 1;
        duration -= 30;
      } while (duration > 30);
    }

    if (duration > 0) {
      do {
        d += 1;
        duration -= 1;
      } while (duration > 0);
    }

    Mydate mydate = Mydate(y, m, d);

    String result = '';

    if (mydate.d != null) {
      result += mydate.d;

      if (mydate.m != null) {
        result += ', ' + mydate.m;
      }

      if (mydate.y != null) {
        result += ', ' + mydate.y;
      }
    } else if (mydate.m != null) {
      result += mydate.m;

      if (mydate.m != null) {
        result += ', ' + mydate.y;
      }
    } else if (mydate.y != null) {
      result += ', ' + mydate.y;
    }

    return (result);
  }

  static String convertDateFromString(
      String dateToConvert, String formatString) {
    DateTime convertedDate = DateTime.parse(dateToConvert);
    var formatter = new DateFormat(formatString);
    return formatter.format(convertedDate);
  }

  static String capitalizeSentence(String string) {
    List<String> words = string.split(" ");
    List<String> newWords = [];

    String newWord = "";

    for (final word in words) {
      newWords.add(word[0].toUpperCase() + word.substring(1).toLowerCase());
    }

    for (int i = 0; i < newWords.length; i++) {
      newWord += newWords[i] + " ";
    }

    return newWord;
  }

  static Color getColorFromHex(String color) {
    String colorAppend = "0xff";

    return (Color(int.parse(colorAppend += color)));
  }
}

class Mydate {
  int _y;
  int _m;
  int _d;

  Mydate(this._y, this._m, this._d);

  String get d {
    if (_d == 1) {
      return '1 Day';
    } else if (_d > 0) {
      return '$_d Days';
    }
  }

  String get m {
    if (_m == 1) {
      return '1 Month';
    } else if (_m > 0) {
      return '$_m Months';
    }
  }

  String get y {
    if (_y == 1) {
      return '1 Year';
    } else if (_y > 0) {
      return '$_y Years';
    }
  }
}
