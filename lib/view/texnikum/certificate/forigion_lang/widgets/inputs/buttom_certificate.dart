import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/texnikum/certificate/provider_certificate_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:developer';

Widget buttonCertificateTexnikum(
    {required BuildContext context,
    required Function ff,
    required Function ff2,
    required ProviderCertificateTexnikum providerCertificateTexnikum}) {
  var box = Hive.box("online");
  return MaterialButton(
    height: 50,
    minWidth: double.infinity,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    color: MyColors.appColorBlue1(),
    onPressed: () {



      providerCertificateTexnikum.textForeignSertNumber.text.length >= 7 &&
              providerCertificateTexnikum.langLevelIds.isNotEmpty &&
              providerCertificateTexnikum.dateYearMonthDay.isNotEmpty &&
              box.get("imageServer").toString().length > 20
          ? providerCertificateTexnikum.sentCertificateServer(
              context: context, stateFunc: ff, stateFunc2: ff2)
          : {
        // MyWidgets.awesomeDialogError(context: context, valueText: "fillInField".tr()),
        AwesomeDialog(
            context: context,
            dialogType: DialogType.NO_HEADER,
            animType: AnimType.BOTTOMSLIDE,
            title: "DTM",
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
