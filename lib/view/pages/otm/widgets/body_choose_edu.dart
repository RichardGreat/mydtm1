import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/pages/otm/widgets/choose_direction/choose_direct.dart';
import 'package:mydtm/view/pages/otm/widgets/choose_direction/sheet_fan_majmua.dart';
import 'package:mydtm/view/pages/otm/widgets/select_direction/otm/foreign_lang.dart';
import 'package:mydtm/view/pages/otm/widgets/select_direction/select_direction.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:showcaseview/showcaseview.dart';

Widget bodyChooseEdu({
  required BuildContext context,
  required ProviderChooseEdu providerChooseEdu,
  required GlobalKey birChoose,
  required GlobalKey ikkiChoose,
  required GlobalKey uchChoose,
  required GlobalKey tortChoose,
  required GlobalKey beshChoose,
  required GlobalKey oltiChoose,
  required GlobalKey yettiChoos,
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
    if (index == 0) {
      if (providerChooseEdu.listTitleEduDir[0].dirName.isNotEmpty) {
        return "${0 + 1}.${" ${providerChooseEdu.listTitleEduDir[0].nameEdu}"}";
      } else {
        providerChooseEdu.listTitleEduDir[0].eduId = "";
        providerChooseEdu.listTitleEduDir[0].nameEdu = "";
        return "${0 + 1}.${" ${providerChooseEdu.listTitleEduDir[0].nameTitle}"}";
      }
    } else {
      if (providerChooseEdu.listTitleEduDir[index].dirName.length > 3) {
        return "${index + 1}.${" ${providerChooseEdu.listTitleEduDir[index].nameEdu}"}";
      } else {
        providerChooseEdu.listTitleEduDir[index].eduId = "";
        providerChooseEdu.listTitleEduDir[index].nameEdu = "";
        return providerChooseEdu.listTitleEduDir[index].nameEdu.length < 4
            ? "${index + 1}.${" ${providerChooseEdu.listTitleEduDir[index].nameTitle}"}"
            : "${index + 1}.${" ${providerChooseEdu.listTitleEduDir[index].nameEdu}"}";
      }
    }
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      chooseDirect(
          birChooses: birChoose,
          ikkiChooses: ikkiChoose,
          uchChooses: uchChoose,
          tortChooses: tortChoose,
          beshChooses: beshChoose,
          context: context,
          providerChooseEdu: providerChooseEdu),
      MyWidgets.robotoFontText(text: "selectedDirection".tr(), textSize: 18),
      const SizedBox(height: 20),
      Expanded(
        child: Showcase(
          key: beshChoose,
          description: "chooseDirs".tr(),
          child: Container(
            decoration: BoxDecoration(
              color: MyColors.appColorWhite(),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: providerChooseEdu.listTitleEduDir.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  if (checkFillSelected() && checkFillDir(index: index)) {
                    if (providerChooseEdu.boolCheckUseCertificateDataNot) {

                      Navigator.push(context, CupertinoPageRoute(builder: (context) =>  SelectDirection(
                        providerChooseEdu: providerChooseEdu,
                        indexEduDir: int.parse(
                            providerChooseEdu.listTitleEduDir[index].id),
                      )));

                    } else {
                      if (providerChooseEdu.boolSetUserNationCert) {

                       Navigator.push(context, CupertinoPageRoute(builder: (context) =>  SelectDirection(
                         providerChooseEdu: providerChooseEdu,
                         indexEduDir: int.parse(
                             providerChooseEdu.listTitleEduDir[index].id),
                       )));

                      } else {
                        MyWidgets.scaffoldMessengerBottom(
                            context: context, valueText: "chooseCert".tr());
                      }
                    }
                  } else {
                    MyWidgets.scaffoldMessengerBottom(
                        context: context, valueText: "fillUpRow".tr());
                  }
                },
                child: ListTile(
                  subtitle: Text(
                      providerChooseEdu.listTitleEduDir[index].dirName.isEmpty
                          ? ""
                          : "${providerChooseEdu.listTitleEduDir[index].emodeName} - ${providerChooseEdu.listTitleEduDir[index].dirName}",
                      maxLines: 1),
                  title: Text(
                    textEduList(index: index),
                    maxLines: 1,
                    style: TextStyle(
                        color: checkFillSelected()
                            ? checkFillDir(index: index)
                                ? MyColors.appColorBlack()
                                : MyColors.appColorGrey400()
                            : MyColors.appColorGrey400(),
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Roboto-Medium'),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 16),
                ),
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
                        ? "chooseForeignLang".tr()
                        : providerChooseEdu.stringForeignLangName,
                    textColor: MyColors.appColorBlack())
                .animate(
                    onPlay: (controller) => controller.repeat(reverse: true))
                .scaleXY(
                    end: 1,
                    delay: const Duration(milliseconds: 1500),
                    curve: Curves.linear)
                .shimmer(
                    color: Colors.green,
                    delay: const Duration(milliseconds: 1500))
                .elevation(end: 0),
            onTap: () {
              sheetForeignLang(
                  contexts: context, providerChooseEdu: providerChooseEdu);
            },
            trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 16),
          ),
        ),
      ),
      const SizedBox(height: 15),
      providerChooseEdu.listTitleEduDir[0].dirId.length > 2
          ? Card(
              color: MyColors.appColorWhite(),
              child: ListTile(
                title: MyWidgets.robotoFontText(
                    text: "testSubjects".tr(), textSize: 15),
                onTap: () {
                  sheetFanMajmuaTest(
                      context: context, providerChooseEdu: providerChooseEdu);
                },
                trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 16),
              ),
            )
          : const SizedBox.shrink(),
      const SizedBox(height: 15),
      MaterialButton(
        onPressed: () {
          if (checkFillSelected() &&
              checkFillDir(index: 1) &&
              providerChooseEdu.boolForeignLang) {
            // if(!providerChooseEdu.boolCheckUseCertificateDataNot && providerChooseEdu.mapCert.isNotEmpty){
            if (providerChooseEdu.listCheckCertificate.isEmpty) {
              providerChooseEdu.stringForeignLangName.length >= 4
                  ? providerChooseEdu.setDataEduDir(context: context)
                  : {};
            } else if (providerChooseEdu.mapCert.isNotEmpty) {
              providerChooseEdu.stringForeignLangName.length >= 4
                  ? providerChooseEdu.setDataEduDir(context: context)
                  : {};
            } else {
              MyWidgets.scaffoldMessengerBottom(
                  context: context, valueText: "chooseCert".tr());
            }
          } else {
            providerChooseEdu.setDataEduDir(context: context);
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: checkFillSelected() && checkFillDir(index: 1)
            ? checkForeignLang()
                ? MyColors.appColorBBA()
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
