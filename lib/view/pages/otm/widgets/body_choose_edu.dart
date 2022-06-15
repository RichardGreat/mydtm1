import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/pages/otm/widgets/choose_direction/choose_direct.dart';
import 'package:mydtm/view/pages/otm/widgets/select_direction/otm/foreign_lang.dart';
import 'package:mydtm/view/pages/otm/widgets/select_direction/select_direction.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'dart:developer';

Widget bodyChooseEdu({
  required BuildContext context,
  required ProviderChooseEdu providerChooseEdu,
}) {
  bool checkFillSelected() {
    return providerChooseEdu.langId.isNotEmpty &&
        providerChooseEdu.grantContractId.isNotEmpty &&
        providerChooseEdu.testRegionId.isNotEmpty &&
        providerChooseEdu.maqsadliName.isNotEmpty;
  }

  bool checkFillDir({required int index}) {
    if (index >= 1) {
      if (providerChooseEdu.listTitleEduDir[index - 1].dirName.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  bool checkForeignLang() {
    if (providerChooseEdu.listTitleEduDir[0].fLangId == "4" &&
        !providerChooseEdu.boolSelectForeignLang) {
      return false;
    } else if (providerChooseEdu.listTitleEduDir[0].fLangId == "4" &&
        providerChooseEdu.boolSelectForeignLang) {
      return true;
    } else //if( providerChooseEdu.listTitleEduDir[0].fLangId =="0")
    {
      return true;
    }
  }

  String textEduList({required int index}) {
    return providerChooseEdu.listTitleEduDir[index].nameEdu.length < 4
        ? "${index + 1}${" ${providerChooseEdu.listTitleEduDir[index].nameTitle}"}"
        : "${index + 1}${" ${providerChooseEdu.listTitleEduDir[index].nameEdu}"}";
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      chooseDirect(context: context, providerChooseEdu: providerChooseEdu),
      MyWidgets.robotoFontText(text: "selectedDirection".tr(), textSize: 20),
      const SizedBox(height: 20),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: MyColors.appColorWhite(),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: ListView.builder(
            // primary: true,
            // shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: providerChooseEdu.listTitleEduDir.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                if (checkFillSelected() && checkFillDir(index: index)) {
                  pushNewScreen(context,
                      screen: SelectDirection(
                        providerChooseEdu: providerChooseEdu,
                        indexEduDir: int.parse(
                            providerChooseEdu.listTitleEduDir[index].id),
                      ));
                } else {
                  MyWidgets.scaffoldMessengerBottom(
                      context: context,
                      valueText: "Yuqoridagilarni to'ldiring");
                }
              },
              child: ListTile(
                subtitle: Text(
                    providerChooseEdu.listTitleEduDir[index].dirName.isEmpty?"":
                    "${providerChooseEdu.listTitleEduDir[index].emodeName} -> ${providerChooseEdu.listTitleEduDir[index].dirName}"),
                title: MyWidgets.robotoFontText(
                  text: textEduList(index: index),
                  textColor: checkFillSelected()
                      ? checkFillDir(index: index)
                          ? MyColors.appColorBlack()
                          : MyColors.appColorGrey400()
                      : MyColors.appColorGrey400(),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_sharp),
              ),
            ),
          ),
        ),
      ),
      Visibility(
        visible: providerChooseEdu.boolForeignLang,
        child: Container(
          color: MyColors.appColorWhite(),
          child: ListTile(
            title: MyWidgets.robotoFontText(
                text: providerChooseEdu.stringForeignLangName.isEmpty
                    ? "Chet tilini tanlang"
                    : providerChooseEdu.stringForeignLangName,
                textColor: MyColors.appColorBlack()),
            onTap: () {
              sheetForeignLang(
                  contexts: context, providerChooseEdu: providerChooseEdu);
            },
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
          ),
        ),
      ),
      const SizedBox(height: 10),
      MaterialButton(
        onPressed: () {
          if (checkFillSelected() &&
              checkFillDir(index: 1) &&
              providerChooseEdu.boolForeignLang) {
            // if(!providerChooseEdu.boolCheckUseCertificateDataNot && providerChooseEdu.mapCert.isNotEmpty){
            if (providerChooseEdu.listCheckCertificate.isEmpty) {
              providerChooseEdu.setDataEduDir(context: context);
            } else if (providerChooseEdu.mapCert.isNotEmpty) {
              providerChooseEdu.setDataEduDir(context: context);
            } else {
              MyWidgets.scaffoldMessengerBottom(
                  context: context, valueText: "Sertifikatni tanlang");
            }
          } else {
            providerChooseEdu.setDataEduDir(context: context);
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: checkFillSelected() && checkFillDir(index: 1)
            ? checkForeignLang()
                ? MyColors.appColorBlue1()
                : MyColors.appColorGrey400()
            : MyColors.appColorGrey400(),
        minWidth: double.infinity,
        height: 50,
        child: MyWidgets.robotoFontText(
            text: "access".tr(), textColor: MyColors.appColorWhite()),
      )
    ],
  );
}
