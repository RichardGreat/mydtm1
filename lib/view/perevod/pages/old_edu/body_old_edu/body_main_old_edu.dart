import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/old_edu/provider_old_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
            subtitle: Text(providerOldEdu.restRegionNamePerevod),
            onTap: () {
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
                providerOldEdu.langName.length > 4
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
            subtitle: Text(providerOldEdu.langName),
            onTap: () {
              // sheetLanguageChooseTest(
              //     context: context, providerChooseEdu: providerChooseEdu);
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
                providerOldEdu.langName.length > 4
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
            subtitle: Text(providerOldEdu.langName),
            onTap: () {
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
                providerOldEdu.langName.length > 4
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
            subtitle: Text(providerOldEdu.langName),
            onTap: () {
              // sheetLanguageChooseTest(
              //     context: context, providerChooseEdu: providerChooseEdu);
            },
          ),
        ),

        ///Kurs bosqichi
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
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
                providerOldEdu.langName.length > 4
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
            subtitle: Text(providerOldEdu.langName),
            onTap: () {
              // sheetLanguageChooseTest(
              //     context: context, providerChooseEdu: providerChooseEdu);
            },
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 70,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyColors.appColorWhite()),
          child: Center(child: Text("Image choose")),
        ),
        const SizedBox(height: 10),
        MaterialButton(onPressed: (){},

          child: Text("OK", style: TextStyle(color: MyColors.appColorWhite())),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          height: 50,
          minWidth: MediaQuery.of(context).size.width*0.9,
          color: MyColors.appColorBlue1(),
        )
      ],
    ),
  );
}
