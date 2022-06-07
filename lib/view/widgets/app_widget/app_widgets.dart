import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MyWidgets {
  var box = Hive.box("online");

  Future goEnterFirst({required BuildContext context}) async {
    box.delete("token");
    pushNewScreen(context, screen: EnterFirst(), withNavBar: false);
  }

  static Widget loaderDownload({required BuildContext context}){
    return const Center(child: CupertinoActivityIndicator(),);
  }

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

  static Text robotoFontText(
      {required String text,
      double? textSize,
      Color? textColor,
      FontWeight? textFontWeight}) {
    return Text(
      text,
      style: TextStyle(
          color: textColor ?? MyColors.appColorBlack(),
          fontSize: textSize ?? 17,
          fontWeight: textFontWeight ?? FontWeight.normal,
          fontFamily: 'Roboto-Medium'),
    );
  }

  static Text appTextTitles2({String? txt, double? txtSize, Color? colorAppTxt2}) {
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

  static Text appTextWithColor1({String? txt, double? txtSize, Color? colorText}) {
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

  static scaffoldMessengerBottom({required BuildContext context, required String valueText}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: MyColors.appColorBlack(),
        content: Container(
            decoration: BoxDecoration(color: MyColors.appColorBlack()),
            child: MyWidgets.robotoFontText(
                text: valueText, textColor: MyColors.appColorWhite()))));
  }

  static awesomeDialogInfo({required BuildContext context, required String valueText}) {
    AwesomeDialog(
            context: context,
            dialogType: DialogType.INFO,
            animType: AnimType.BOTTOMSLIDE,
            title: "DTM",
            desc: valueText,
            titleTextStyle: TextStyle(
                color: MyColors.appColorBlue1(), fontWeight: FontWeight.bold),
            descTextStyle: TextStyle(
                color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
            btnCancelOnPress: () {},
            btnCancelText: "OK")
        .show();
  }

  static awesomeDialogError({required BuildContext context, required String valueText}) {
    AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: "DTM",
            desc: valueText,
            titleTextStyle: TextStyle(
                color: MyColors.appColorBlue1(), fontWeight: FontWeight.bold),
            descTextStyle: TextStyle(
                color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
            btnCancelOnPress: () {},
            btnCancelText: "OK")
        .show();
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
