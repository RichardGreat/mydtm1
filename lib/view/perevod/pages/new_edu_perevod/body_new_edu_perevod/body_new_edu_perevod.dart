import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/provider_new_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget bodyNewPerevod(
    {required BuildContext context,
    required ProviderNewEduPerevod providerNewEduPerevod}) {
    return Column(
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
                                            text: "chooseTestRegion".tr(), textSize: 17)),
                                ],
                            ),
                            providerNewEduPerevod.testRegion.length > 4
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
                    subtitle: Text(providerNewEduPerevod.testRegion),
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
                                text: "chooseEduType".tr(), textSize: 17),
                            providerNewEduPerevod.eduType.length > 4
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
                    subtitle: Text(providerNewEduPerevod.langName),
                    onTap: () {
                        // sheetLanguageChooseTest(
                        //     context: context, providerChooseEdu: providerChooseEdu);
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
                            providerNewEduPerevod.eduLang.length > 4
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
                    subtitle: Text(providerNewEduPerevod.eduLang),
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
                                            text: "oliytalim".tr(), textSize: 17)),
                                ],
                            ),
                            providerNewEduPerevod.eduName.length > 4
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
                    subtitle: Text(providerNewEduPerevod.eduName),
                    onTap: () {
                        // sheetRegionTest(
                        //     context: context, providerChooseEdu: providerChooseEdu);
                    },
                ),
            ),

            /// Ta'lim yo'nalish
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
                                text: "chooseDirection".tr(), textSize: 17),
                            providerNewEduPerevod.dirName.length > 4
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
                    subtitle: Text(providerNewEduPerevod.dirName),
                    onTap: () {
                        // sheetLanguageChooseTest(
                        //     context: context, providerChooseEdu: providerChooseEdu);
                    },
                ),
            ),

            /// Chet tili
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
                            providerNewEduPerevod.langName.length > 4
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
                    subtitle: Text(providerNewEduPerevod.langName),
                    onTap: () {
                        // sheetLanguageChooseTest(
                        //     context: context, providerChooseEdu: providerChooseEdu);
                    },
                ),
            ),
            MaterialButton(onPressed: (){},

                child: Text("OK", style: TextStyle(color: MyColors.appColorWhite())),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                height: 50,
                minWidth: MediaQuery.of(context).size.width*0.9,
                color: MyColors.appColorBlue1(),
            )
        ],
    );
}
