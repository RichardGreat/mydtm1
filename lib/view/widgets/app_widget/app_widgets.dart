import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/enter_first.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:mydtm/view/widgets/face_id/face_id.dart';

class MyWidgets {
  var box = Hive.box("online");

  Future goEnterFirst({required BuildContext context}) async {
    box.delete("token");
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => EnterFirst(windowIdEnterFirst: "0"),
        ));
  }

  static Widget loaderDownload({required BuildContext context}) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
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

  static Text robotoFontText({required String text,
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

  static scaffoldMessengerBottom(
      {required BuildContext context, required String valueText}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 1650),
        backgroundColor: MyColors.appColorBlack(),
        content: Container(
            decoration: BoxDecoration(color: MyColors.appColorBlack()),
            child: MyWidgets.robotoFontText(
                text: valueText, textColor: MyColors.appColorWhite()))));
  }

  static awesomeDialogInfo(
      {required BuildContext context, required String valueText}) {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.noHeader,
        animType: AnimType.bottomSlide,
        dismissOnTouchOutside: false,
        title: "BBA",
        desc: valueText,
        buttonsBorderRadius: BorderRadius.circular(8),
        titleTextStyle: TextStyle(
            color: MyColors.appColorBlue1(),
            fontSize: 24,
            fontWeight: FontWeight.bold),
        descTextStyle: TextStyle(
            color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
        btnCancelOnPress: () {},
        btnCancelColor: MyColors.appColorBlue1(),
        btnCancelText: "accepted".tr())
        .show();
  }

  static awesomeDialogError(
      {required BuildContext context, required String valueText}) {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.noHeader,
        animType: AnimType.bottomSlide,
        dismissOnTouchOutside: false,
        title: "BBA",
        desc: valueText,
        buttonsBorderRadius:  BorderRadius.circular(8),
        titleTextStyle: TextStyle(
            color: MyColors.appColorBlue1(),
            fontSize: 24,
            fontWeight: FontWeight.bold),
        descTextStyle: TextStyle(
            color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
        btnCancelOnPress: () {},
        btnCancelText: "OK")
        .show();
  }

  /// face id check
  static dialogCheckFaceId(
      {required BuildContext context, required String valueText, required String imie, required String psnum, required String psser}) {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.noHeader,
        animType: AnimType.bottomSlide,
        dismissOnTouchOutside: true,
        title: "BBA",

        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("BBA",
                  style: TextStyle(
                      color: MyColors.appColorBlue1(),
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
               Text(
                "faceSafe".tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        titleTextStyle: TextStyle(
            color: MyColors.appColorBlue1(),
            fontSize: 24,
            fontWeight: FontWeight.bold),
        descTextStyle: TextStyle(
            color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
        btnCancelOnPress: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) =>
              ImagePhoto(imie: imie, pser: psser, snum: psnum),));
        },
        btnCancelColor: MyColors.appColorBlue1(),
        buttonsBorderRadius: BorderRadius.circular(8),
        btnCancelText: "FACE ID")
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
    "50",
    "55",
    "77",
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
