import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/pages/otm/widgets/choose_direction/sheets/grant_contract.dart';
import 'package:mydtm/view/pages/otm/widgets/choose_direction/sheets/language_choose.dart';
import 'package:mydtm/view/pages/otm/widgets/choose_direction/sheets/maqsadli.dart';
import 'package:mydtm/view/pages/otm/widgets/choose_direction/sheets/region_test.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget chooseDirect({required BuildContext context, required ProviderChooseEdu providerChooseEdu}){
  List<String> listDirection = [
    "chooseTestRegion".tr(),
    "chooseGrantContract".tr(),
    "chooseLangEmode".tr(),
    "targetSelection".tr(),
    "testGraphic".tr()
  ];
  return Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MyWidgets.robotoFontText(text: "chooseDirection".tr(), textSize: 24),
      const SizedBox(height: 20),
      /// test hudud
      Container(
        decoration: BoxDecoration(color: MyColors.appColorWhite(),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )
        ),
        child: ListTile(
          minVerticalPadding: 0,
          title: MyWidgets.robotoFontText(text: listDirection[0], textSize: 18),
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          subtitle: Text(providerChooseEdu.testRegionNames),
          onTap: (){
            sheetRegionTest(context: context, providerChooseEdu: providerChooseEdu);
          },
        ),
      ),

      /// ustuvorlik
      Container(
        decoration: BoxDecoration(color: MyColors.appColorWhite()),
        child: ListTile(
          title: MyWidgets.robotoFontText(text: listDirection[1], textSize: 20),
          subtitle: Text(providerChooseEdu.grantContractName),
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
           onTap: (){
             sheetGrantContractChoose(context: context, providerChooseEdu: providerChooseEdu);
           },
        ),

      ),
      /// maqsadli
      Container(
        decoration: BoxDecoration(color: MyColors.appColorWhite(),

        ),
        child: ListTile(
          title: MyWidgets.robotoFontText(text: listDirection[3], textSize: 20),
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          subtitle: Text(providerChooseEdu.maqsadliName),
          onTap: (){
            sheetMaqsadli(context: context, providerChooseEdu: providerChooseEdu);
          },
        ),
      ),
      /// Ta'lim tili
      Container(
        decoration: BoxDecoration(color: MyColors.appColorWhite(),

        ),
        child: ListTile(
          title: MyWidgets.robotoFontText(text: listDirection[2], textSize: 20),
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          subtitle: Text(providerChooseEdu.langName),
          onTap: (){
            sheetLanguageChooseTest(context: context, providerChooseEdu: providerChooseEdu);
          },
        ),
      ),
      /// Test grafik
      Visibility(
        visible: providerChooseEdu.langId == "1",
        child: Container(
        decoration: BoxDecoration(color: MyColors.appColorWhite(),

        ),
        child: ListTile(
          title: MyWidgets.robotoFontText(text: listDirection[4], textSize: 20),
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
          subtitle: Text(providerChooseEdu.langName),
          onTap: (){
            sheetLanguageChooseTest(context: context, providerChooseEdu: providerChooseEdu);
          },
        ),
      ),),
      const SizedBox(height: 20),
    ],);
}