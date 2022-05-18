import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class MyWidgets {
  /// Text
  static Text appTextTitles1({String? txt, double? txtSize}) {
    return Text(
      "$txt",
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: txtSize ?? 18),
    );
  }

  static Text robotoFontText({
    required String text,
    double? textSize,
    Color? textColor,
    FontWeight? textFontWeight
  }) {
    return Text(text, style: TextStyle(
        color: textColor ?? MyColors.appColorBlack(),
        fontSize: textSize ?? 17,
        fontWeight: textFontWeight ?? FontWeight.normal,
        fontFamily: 'Roboto-Medium'
    ),);
  }

  static Text appTextTitles2(
      {String? txt, double? txtSize, Color? colorAppTxt2}) {
    return Text(
      "$txt",
      style: TextStyle(
          color: colorAppTxt2 ?? MyColors.appColorWhite(),
          fontWeight: FontWeight.w500,
          fontSize: txtSize ?? 18),
    );
  }

  static Text appText1({String? txt, double? txtSize}) {
    return Text(
      "$txt",
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: txtSize ?? 18),
    );
  }

  static Text appTextWithColor1(
      {String? txt, double? txtSize, Color? colorText}) {
    return Text(
      "$txt",
      style: TextStyle(
          color: colorText,
          fontWeight: FontWeight.w400,
          fontSize: txtSize ?? 18),
    );
  }

  /// Buttons



  static Widget pointButton({String? txt, BuildContext? contexts}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: MyColors.appColorWhite(),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyWidgets.appTextWithColor1(txt: txt),
          IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.chevron_forward))
        ],
      ),
    );
  }



  static scaffoldMessengerBottom({ required BuildContext context, required String valueText}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 5),
        backgroundColor: MyColors.appColorBlack(),
        content: Container(
          decoration: BoxDecoration(color: MyColors.appColorBlack()),
          child: MyWidgets.robotoFontText(text:valueText,textColor: MyColors.appColorWhite())
        )));
  }


  /// Phone code
  static String returnPhoneFormat({required String phoneNumber}) {
    String p = "(${phoneNumber.substring(0, 2)})-";
    String h = "${phoneNumber.substring(2, 5)}-";
    String o = "${phoneNumber.substring(5, 7)}-";
    String n = phoneNumber.substring(7, 9);
    return p + h + o + n;
  }

  static List<String> checkTelephoneCompanyCode = [
    "33",
    "88",
    "90",
    "91",
    "93",
    "94",
    "95",
    "97",
    "98",
    "99"
  ];

}
