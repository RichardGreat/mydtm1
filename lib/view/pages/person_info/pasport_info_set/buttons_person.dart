import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/model_sheet_nation.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/person_received/person_received.dart';
import 'package:mydtm/view/pages/person_info/pasport_info_set/provider_person_info.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
Widget buttonsPersonInfo(
    {required BuildContext context,
    required ProviderPersonInfo providerPersonInfo}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      GestureDetector(
        child: Container(
            height: 50,
            padding: const EdgeInsets.only(left: 10, right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border:
                    Border.all(color: MyColors.appColorGrey400(), width: 1.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyWidgets.robotoFontText(
                    text: providerPersonInfo.nationNames.length < 2
                        ? "choose".tr()
                        : providerPersonInfo.nationNames,
                    textColor: providerPersonInfo.nationNames.length < 2
                        ? MyColors.appColorGrey400()
                        : MyColors.appColorBlack(),
                    textSize: 16),
                const Icon(Icons.arrow_drop_down, size: 32)
              ],
            )),
        onTap: () {
          modelSheetNation(
              context: context, providerPersonInfo: providerPersonInfo);
        },
      ),
      MaterialButton(
        minWidth: double.infinity,
        height: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          providerPersonInfo.boolJShShIR &&
                  providerPersonInfo.boolPsSer &&
                  providerPersonInfo.boolPsNum &&
                  providerPersonInfo.boolChooseNation
              ? {
            if(providerPersonInfo.formKey123.currentState!.validate()){
              providerPersonInfo.setPersonInfoServer(context: context)
              // modelSheetPersonReceived(context: context, providerPersonInfo: providerPersonInfo)
            }

          }
              : {
                  ScaffoldMessenger.of(context).showSnackBar(

                      SnackBar(
                        backgroundColor: MyColors.appColorBlack(),
                      duration: const Duration(seconds: 1),
                          content: MyWidgets.robotoFontText(
                          text: "fillInfo".tr(),
                      textColor: MyColors.appColorRed2()
                      )))
                };
        },
        color: providerPersonInfo.boolJShShIR &&
                providerPersonInfo.boolPsSer &&
                providerPersonInfo.boolPsNum &&
                providerPersonInfo.boolChooseNation
            ? MyColors.appColorBlue1()
            : MyColors.appColorGrey400(),
        child: MyWidgets.robotoFontText(
            text: "continue".tr(), textColor: MyColors.appColorWhite()),
      )
    ],
  );
}
