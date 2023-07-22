import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/old_edu/body_old_edu/p1_davlat.dart';
import 'package:mydtm/view/perevod/pages/old_edu/body_old_edu/p2_shakl.dart';
import 'package:mydtm/view/perevod/pages/old_edu/body_old_edu/p3_til.dart';
import 'package:mydtm/view/perevod/pages/old_edu/body_old_edu/p4_edit_text_muassasa.dart';
import 'package:mydtm/view/perevod/pages/old_edu/body_old_edu/p4_talim_muassasa.dart';
import 'package:mydtm/view/perevod/pages/old_edu/body_old_edu/p5_yonalish.dart';
import 'package:mydtm/view/perevod/pages/old_edu/body_old_edu/p6_kurs_bosqich.dart';
import 'package:mydtm/view/perevod/pages/old_edu/body_old_edu/p7_hujjat_rasm.dart';
import 'package:mydtm/view/perevod/pages/old_edu/provider_old_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget bodyMainOldEdu(
    {required BuildContext context, required ProviderOldEdu providerOldEdu}) {
  return SingleChildScrollView(
    child: Column(
      children: [
        const SizedBox(height: 10),
        MyWidgets.robotoFontText(
            text: "enterOldEdu".tr(),
            textSize: 24,
            textFontWeight: FontWeight.w600,
            textColor: MyColors.appColorBlack()),
        // const SizedBox(height: 30),
        // MyWidgets.robotoFontText(text: "enterOldEdu".tr(),textSize: 17, textFontWeight: FontWeight.w600, textColor: MyColors.appColorGrey600()),
        const SizedBox(height: 20),

        /// Joylashgan davlat
        davlat(context: context, providerOldEdu: providerOldEdu),

        /// Ta'lim shakli
        shakl(context: context, providerOldEdu: providerOldEdu),

        /// Ta'lim tili
        til(context: context, providerOldEdu: providerOldEdu),

        /// Ta'lim muassasasi
        providerOldEdu.restRegionNamePerevodId == "860"?
                muassasaNomi(context: context, providerOldEdu: providerOldEdu):
        editMuassasa(context: context, providerOldEdu: providerOldEdu),

        ///Yo'nalish
        yonalish(context: context, providerOldEdu: providerOldEdu),

        ///Kurs bosqichi
        kursBosqichi(context: context, providerOldEdu: providerOldEdu),

        /// Hujjat rasm
        hujjatRasm(context: context, providerOldEdu: providerOldEdu),

        const SizedBox(height: 10),
        MaterialButton(
          onPressed: () {

            providerOldEdu.restRegionNamePerevodId == "860"? {
            if (providerOldEdu.restRegionNamePerevod.length > 4 &&
            providerOldEdu.eduTypeName.length > 4 &&
            providerOldEdu.eduLangName.length > 4 &&
            providerOldEdu.eduUzbName.length > 4 &&
            providerOldEdu.textEditingDirection.text.length > 4 &&
            providerOldEdu.graduatedYearNames.length > 4
            && providerOldEdu.listFiles.isNotEmpty
            ) {
              providerOldEdu.sentServerData(context: context),
            } else {
              print("#-1"),
            AwesomeDialog(
            context: context,
                dialogType: DialogType.noHeader,
                animType: AnimType.bottomSlide,
            dismissOnTouchOutside: false,
            title: "BBA",
            desc: "fillUpRow".tr(),
            titleTextStyle: TextStyle(
            color: MyColors.appColorBlue1(),
            fontSize: 24,
            fontWeight: FontWeight.bold),
            descTextStyle: TextStyle(
            color: MyColors.appColorBlack(),
            fontWeight: FontWeight.bold),
            btnCancelOnPress: () {},
            btnCancelText: "OK")
                .show(),
            }
            }:
            {
              if (providerOldEdu.restRegionNamePerevod.length > 4 &&
                  providerOldEdu.eduTypeName.length > 4 &&
                  providerOldEdu.eduLangName.length > 4 &&
                  providerOldEdu.textEditingEducation.text.length > 4 &&
                  providerOldEdu.textEditingDirection.text.length > 4 &&
                  providerOldEdu.graduatedYearNames.length > 4
              && providerOldEdu.listFiles.isNotEmpty
              ) {
                providerOldEdu.sentServerData(context: context),
              } else {
            print("#-2"),
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.noHeader,
                    animType: AnimType.bottomSlide,
                    dismissOnTouchOutside: false,
                    title: "BBA",
                    desc: "fillUpRow".tr(),
                    titleTextStyle: TextStyle(
                        color: MyColors.appColorBlue1(),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    descTextStyle: TextStyle(
                        color: MyColors.appColorBlack(),
                        fontWeight: FontWeight.bold),
                    btnCancelOnPress: () {},
                    btnCancelText: "OK")
                    .show(),
              }
            };

          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          height: 50,
          minWidth: MediaQuery.of(context).size.width * 0.9,
          color: MyColors.appColorBlue1(),
          child: Text("access".tr(),
              style: TextStyle(color: MyColors.appColorWhite())),
        )
      ],
    ),
  );
}
