import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget updateInfoGradueted(
    {required BuildContext context,
    required Function function,
    required ProviderGraduated providerGraduated}) {
  return MaterialButton(
    onPressed: () {
      AwesomeDialog(
              context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.bottomSlide,
              dismissOnTouchOutside: false,
              title: "BBA",
              desc:
                  "wantUpdateInfo".tr(),
              titleTextStyle: TextStyle(
                  color: MyColors.appColorBlue1(),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              descTextStyle: TextStyle(
                  color: MyColors.appColorBlack(), fontWeight: FontWeight.bold),
              btnCancelOnPress: () {},
              btnOkOnPress: () {
                providerGraduated.getAllInfoGraduated2(context: context);
                function();
              },
              btnCancelColor: MyColors.appColorGrey600(),
              btnOkColor: MyColors.appColorBlue1(),
              btnOkText: "yes".tr(),
              btnCancelText: "no".tr())
          .show();
    },
    height: 45,
    minWidth: MediaQuery.of(context).size.width,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    elevation: 2,
    color: MyColors.appColorGrey100(),
    child: Text(
        providerGraduated.boolAllInfoGraduatedNot
            ? "updateGraduetedInfo".tr()
            : "updateGraduetedInfo".tr(),
        style: TextStyle(
            color: MyColors.appColorBlack(), fontWeight: FontWeight.bold)),
  );
}
