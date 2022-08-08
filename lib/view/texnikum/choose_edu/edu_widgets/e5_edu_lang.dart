import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/choose_edu/edu_widgets/sheet_widgets/sh5_sheet_lang_foreig_tex.dart';
import 'package:mydtm/view/texnikum/choose_edu/provider_choose_edu_t.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget eduLangDirTexnikum({required BuildContext context, required ProviderChooseEduTexnikum providerChooseEduTexnikum}){
  return
    Visibility(
      visible: providerChooseEduTexnikum.boolEduLangTexnikum,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          MyWidgets.robotoFontText(text:"foreignLang".tr(), textColor: MyColors.appColorGrey600()),
          const  SizedBox(height: 5),
          Container(
            color: MyColors.appColorWhite(),
            child: ListTile(
              title: MyWidgets.robotoFontText(
                  text: providerChooseEduTexnikum.foreignLangNames.length < 5 ? "choose".tr():providerChooseEduTexnikum.foreignLangNames,
                  textColor:  providerChooseEduTexnikum.foreignLangNames.length >= 5 ? MyColors.appColorBlack():MyColors.appColorGrey600()),
              onTap: () {
                providerChooseEduTexnikum.directionNameTexnikum.toString().length > 5?
                sheetLangForeignTexnikum(contexts: context, providerChooseEduTexnikum: providerChooseEduTexnikum):{};
                // directionNameTexnikum
              },
              trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 16),
            ),
          ),
        ],
      ),
    );

}