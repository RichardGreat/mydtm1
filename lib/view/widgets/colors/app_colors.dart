import 'dart:math';

import 'package:flutter/material.dart';

class MyColors {
  static Color appColorWhite() {
    return Colors.white;
  }

  static Color appColorGrey100() {
    return Colors.grey.shade100;
  }

  static Color appColorGrey400() {
    return Colors.grey.shade400;
  }

  static Color appColorGrey600() {
    return Colors.grey.shade600;
  }

  static Color appColorRed() {
    return Colors.red;
  }

  static Color appColorRed2() {
    return const Color.fromRGBO(253, 32, 2, 0.7);
  }

  static Color appColorBlack() {
    return Colors.black;
  }

  // rgba(229, 229, 229, 1)
  static Color appColorTextFormField1() {
    return const Color.fromRGBO(236, 242, 247, 1);
  }

  static Color appColorBlue1() {
    return const Color.fromRGBO(66, 112, 218, 1);
  }

  static Color appColorBlue2() {
    return const Color.fromRGBO(79, 149, 232, 1);
  }

  static Color appColorBackGC1() {
    return const Color.fromRGBO(255, 255, 255, 1);
  }

  static Color appColorBackGC2() {
    return const Color.fromRGBO(255, 255, 255, 1);
  }

  static Color appColorBackGC3() {
    return const Color.fromRGBO(242, 245, 253, 1);
  }

  static Color appColorBackC4() {
    return const Color.fromRGBO(48, 192, 192, 1);
  }

  static Color appColorBackC5() {
    return const Color.fromRGBO(48, 192, 192, 1);
  }

  static Color appColorGreen1() {
    return Colors.green;
  }

  static Color appColorGreen2() {
    return const Color(0xFF66BB6A);
  }

  Random random = Random();
  List<Color> myColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.brown,
    Colors.deepPurple,
    Colors.deepPurpleAccent,
    Colors.pinkAccent,
    Colors.amber,
    Colors.tealAccent
  ];

  Color randomColor() {
    return myColors[random.nextInt(10)];
  }
}

class MyStyle {
  AnimationController? animationController;

  static TextStyle appTextStyle({double? fSize}) {
    return TextStyle(
        color: MyColors.appColorBlack(),
        fontSize: fSize!,
        fontWeight: FontWeight.w600);
  }
}
