import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/old_edu/image_to_pdf/image_to_pdf.dart';
import 'package:mydtm/view/perevod/pages/old_edu/provider_old_edu.dart';
import 'package:mydtm/view/perevod/pages/old_edu/sheets/country_sheet.dart';
import 'package:mydtm/view/perevod/pages/old_edu/sheets/edu_dir.dart';
import 'package:mydtm/view/perevod/pages/old_edu/sheets/edu_lang_old_perevod.dart';
import 'package:mydtm/view/perevod/pages/old_edu/sheets/edu_type.dart';
import 'package:mydtm/view/perevod/pages/old_edu/sheets/graduet_year.dart';
import 'package:mydtm/view/perevod/pages/old_edu/sheets/uzb_edu_sheet.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

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
        Container(
          decoration: BoxDecoration(
              color: MyColors.appColorWhite(),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          child: ListTile(
            minVerticalPadding: 0,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 4),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: MyWidgets.robotoFontText(
                            text: "oldEduCountry".tr(), textSize: 17)),
                  ],
                ),
                providerOldEdu.restRegionNamePerevod.length > 4
                    ? Icon(
                        Icons.check_circle,
                        color: MyColors.appColorGreen1(),
                      )
                    : const SizedBox.shrink()
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(height: 8),
                Icon(Icons.arrow_forward_ios_sharp, size: 16),
              ],
            ),
            subtitle: Text(
              providerOldEdu.restRegionNamePerevod,
            ),
            onTap: () {
              modelSheetCountryPerevod(
                  contexts: context, providerOldEdu: providerOldEdu);
              // sheetRegionTest(
              //     context: context, providerChooseEdu: providerChooseEdu);
            },
          ),
        ),

        /// Ta'lim shakli
        Container(
          decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
          ),
          child: ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyWidgets.robotoFontText(
                    text: "oldEduEduType".tr(), textSize: 17),
                providerOldEdu.eduTypeName.length > 4
                    ? Icon(
                        Icons.check_circle,
                        color: MyColors.appColorGreen1(),
                      )
                    : const SizedBox.shrink()
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(height: 8),
                Icon(Icons.arrow_forward_ios_sharp, size: 16),
              ],
            ),
            subtitle: Text(providerOldEdu.eduTypeName),
            onTap: () {
              modelSheetEduTypePerevod(
                  contexts: context, providerOldEdu: providerOldEdu);
            },
          ),
        ),

        /// Ta'lim tili
        Container(
          decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
          ),
          child: ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyWidgets.robotoFontText(
                    text: "chooseLangEmode".tr(), textSize: 17),
                providerOldEdu.eduLangName.length > 4
                    ? Icon(
                        Icons.check_circle,
                        color: MyColors.appColorGreen1(),
                      )
                    : const SizedBox.shrink()
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(height: 8),
                Icon(Icons.arrow_forward_ios_sharp, size: 16),
              ],
            ),
            subtitle: Text(providerOldEdu.eduLangName),
            onTap: () {
              modelSheetEduLangOldPerevod(
                  contexts: context, providerOldEdu: providerOldEdu);
            },
          ),
        ),

        /// Ta'lim muassasasi
        Container(
          decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
          ),
          child: ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyWidgets.robotoFontText(
                    text: "oldEduEduName".tr(), textSize: 17),
                providerOldEdu.eduUzbName.length > 4
                    ? Icon(
                        Icons.check_circle,
                        color: MyColors.appColorGreen1(),
                      )
                    : const SizedBox.shrink()
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(height: 8),
                Icon(Icons.arrow_forward_ios_sharp, size: 16),
              ],
            ),
            subtitle: Text(providerOldEdu.eduUzbName),
            onTap: () {
              modelSheetUzbEduPerevod(
                  contexts: context, providerOldEdu: providerOldEdu);
              // sheetLanguageChooseTest(
              //     context: context, providerChooseEdu: providerChooseEdu);
            },
          ),
        ),

        ///Yo'nalish
        Container(
          decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
          ),
          child: ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyWidgets.robotoFontText(
                    text: "oldEduDirectionName".tr(), textSize: 17),
                providerOldEdu.dirNames.length > 4
                    ? Icon(
                        Icons.check_circle,
                        color: MyColors.appColorGreen1(),
                      )
                    : const SizedBox.shrink()
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(height: 8),
                Icon(Icons.arrow_forward_ios_sharp, size: 16),
              ],
            ),
            subtitle: Text(providerOldEdu.dirNames),
            onTap: () {
              modelSheetEduDirPerevod(
                  contexts: context, providerOldEdu: providerOldEdu);
              // sheetLanguageChooseTest(
              //     context: context, providerChooseEdu: providerChooseEdu);
            },
          ),
        ),

        ///Kurs bosqichi
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8)),
            color: MyColors.appColorWhite(),
          ),
          child: ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyWidgets.robotoFontText(
                    text: "oldEduNumberCourse".tr(), textSize: 17),
                providerOldEdu.graduatedYearNames.length > 4
                    ? Icon(
                        Icons.check_circle,
                        color: MyColors.appColorGreen1(),
                      )
                    : const SizedBox.shrink()
              ],
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(height: 8),
                Icon(Icons.arrow_forward_ios_sharp, size: 16),
              ],
            ),
            subtitle: Text(providerOldEdu.graduatedYearNames),
            onTap: () {
              modelSheetGraduatedYearPerevod(
                  contexts: context, providerOldEdu: providerOldEdu);
              // sheetLanguageChooseTest(
              //     context: context, providerChooseEdu: providerChooseEdu);
            },
          ),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            pushNewScreen(context, screen: ImageToPdf(), withNavBar: false);
          },
          child: Container(
            height: 70,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColors.appColorWhite()),
            child: Center(child: Text("Image choose")),
          ),
        ),
        const SizedBox(height: 10),
        MaterialButton(
          onPressed: () {},
          child: Text("OK", style: TextStyle(color: MyColors.appColorWhite())),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          height: 50,
          minWidth: MediaQuery.of(context).size.width * 0.9,
          color: MyColors.appColorBlue1(),
        )
      ],
    ),
  );
}
