import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:developer';

Widget buttonCertificate(
    {required BuildContext context,
    required Function ff,
    required Function ff2,
    required ProviderCertificate providerCertificate}) {
  var box = Hive.box("online");
  return MaterialButton(
    height: 50,
    minWidth: double.infinity,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    color: MyColors.appColorBlue1(),
    onPressed: () {
            log( providerCertificate.textForeignSertNumber.text);
            log( providerCertificate.langLevelIds.toString());
            log( providerCertificate.dateYearMonthDay.toString());
            log(  box.get("imageServer").toString().length.toString());


      providerCertificate.textForeignSertNumber.text.length >= 7 &&
              providerCertificate.langLevelIds.isNotEmpty &&
              providerCertificate.dateYearMonthDay.isNotEmpty &&
              box.get("imageServer").toString().length > 20
          ? providerCertificate.sentCertificateServer(
              context: context, stateFunc: ff, stateFunc2: ff2)
          : {
        // MyWidgets.awesomeDialogError(context: context, valueText: "fillInField".tr()),
        AwesomeDialog(
            context: context,
            dialogType: DialogType.noHeader,
            animType: AnimType.bottomSlide,
            title: "BBA",
            desc: "fillInField".tr(),
            titleTextStyle: TextStyle(
                color: MyColors.appColorBlue1(),fontSize: 24, fontWeight: FontWeight.bold),
            descTextStyle: TextStyle(
                color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
            btnCancelOnPress: () {},
            btnCancelText: "OK")
            .show()
      };
    },
    child: MyWidgets.robotoFontText(
        text: "add".tr(), textColor: MyColors.appColorWhite()),
  );
}
