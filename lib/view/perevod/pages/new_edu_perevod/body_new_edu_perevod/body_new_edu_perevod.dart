import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/body_new_edu_perevod/n1_test_region.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/body_new_edu_perevod/n2_edu_type.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/body_new_edu_perevod/n3_edu_lang.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/body_new_edu_perevod/n4_edu_new_perevod.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/body_new_edu_perevod/n5_edu_dir_new_perevod.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/body_new_edu_perevod/n6_foriegn_lang.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/body_new_edu_perevod/n7_edit_text.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/provider_new_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget bodyNewPerevod(
    {required BuildContext context,
    required ProviderNewEduPerevod providerNewEduPerevod}) {
  return Container(
    margin: const EdgeInsets.all(15),
    child: SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        MyWidgets.robotoFontText(
            text: "chooseDirection".tr(),
            textSize: 24,
            textFontWeight: FontWeight.w600,
            textColor: MyColors.appColorBlack()),
        // const SizedBox(height: 30),
        // MyWidgets.robotoFontText(text: "enterOldEdu".tr(),textSize: 17, textFontWeight: FontWeight.w600, textColor: MyColors.appColorGrey600()),
        const SizedBox(height: 20),

        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: MyColors.appColorWhite()),
            child: Column(
              children: [
                testRegion(
                    context: context,
                    providerNewEduPerevod: providerNewEduPerevod),

                /// Ta'lim shakli
                eduTypeNewPerevod(
                    context: context,
                    providerNewEduPerevod: providerNewEduPerevod),

                /// Ta'lim tili
                eduLangNewPerevod(
                    context: context,
                    providerNewEduPerevod: providerNewEduPerevod),

                /// Ta'lim muassasasi
                eduNewPerevod(
                    context: context,
                    providerNewEduPerevod: providerNewEduPerevod),

                /// Ta'lim yo'nalish
                eduDirNewPerevod(
                    context: context,
                    providerNewEduPerevod: providerNewEduPerevod),

                /// Chet tili

                Visibility(
                  visible: providerNewEduPerevod.listForeignLang.length > 1,
                  child: eduTestForeignLangNewPerevod(
                      context: context,
                      providerNewEduPerevod: providerNewEduPerevod),
                ),
                /// Izoh
                editInputPerevod(
                    context: context,
                    providerNewEduPerevod: providerNewEduPerevod),
              ],
            )),

        /// Test region

        const SizedBox(height: 10),
        MaterialButton(
          onPressed: () {
            if (providerNewEduPerevod.boolCheckForeignLanguage &&
                providerNewEduPerevod.testRegionNames.length > 4 &&
                providerNewEduPerevod.eduTypeNames.length > 4 &&
                providerNewEduPerevod.langNames.length > 4 &&
                providerNewEduPerevod.eduNames.length > 4 &&
                providerNewEduPerevod.dirNames.length > 4 &&
                providerNewEduPerevod.foreignLangName.length > 4) {}
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          height: 50,
          minWidth: MediaQuery.of(context).size.width * 0.9,
          color: MyColors.appColorBlue1(),
          child: Text("access".tr(),
              style: TextStyle(color: MyColors.appColorWhite())),
        )
      ],
    )),
  );
}
