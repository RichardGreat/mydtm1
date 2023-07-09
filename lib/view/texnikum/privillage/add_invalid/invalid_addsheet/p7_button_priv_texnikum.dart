import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/texnikum/privillage/add_invalid/provider_add_invalide.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget privilegeAddButtonTexnikum({required BuildContext context,  required ProviderAddInvalideTexnikum providerAddInvalideTexnikum}){
  var box = Hive.box("online");
  return  MaterialButton(
      onPressed: () {
        providerAddInvalideTexnikum
            .formKeyInvalide.currentState!
            .validate();
        if (
            providerAddInvalideTexnikum
                .textEditingController.text
                .toString()
                .trim()
                .length >
                6 &&
            providerAddInvalideTexnikum
                .invalidDate1.length >
                6 &&
            box.get("imageTexnikum").toString().length > 200

        ) {
          providerAddInvalideTexnikum.sendServer(
              context: context,
          files: providerAddInvalideTexnikum.fileToServer!
          );
        } else {
          if( box.get("imageTexnikum").toString().length > 200) {
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
                    btnCancelColor: MyColors.appColorBlue1(),
                    btnCancelOnPress: () {},
                    btnCancelText: "OK")
                .show();
          }else{
            AwesomeDialog(
                context: context,
                dialogType: DialogType.noHeader,
                animType: AnimType.bottomSlide,
                dismissOnTouchOutside: false,
                title: "BBA",
                desc: "Rasm kiriting",
                titleTextStyle: TextStyle(
                    color: MyColors.appColorBlue1(),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                descTextStyle: TextStyle(
                    color: MyColors.appColorBlack(),
                    fontWeight: FontWeight.bold),
                btnCancelColor: MyColors.appColorBlue1(),
                btnCancelOnPress: () {},
                btnCancelText: "OK")
                .show();
          }
        }
      },
      height: 45,
      minWidth: double.infinity,
      color: MyColors.appColorBlue1(),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: MyWidgets.robotoFontText(
          text: "access".tr(),
          textColor: MyColors.appColorWhite()));

}