import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/choose_edu/edu_widgets/sheet_widgets/sh5_sheet_lang_foreig_tex.dart';
import 'package:mydtm/view/texnikum/choose_edu/provider_choose_edu_t.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget eduLangDirTexnikum({required BuildContext context, required ProviderChooseEduTexnikum providerChooseEduTexnikum}){
  return
    Visibility(
      visible: providerChooseEduTexnikum.boolEduLangTexnikum,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          MyWidgets.robotoFontText(text:"chooose edu Lang", textColor: MyColors.appColorGrey600()),
          const  SizedBox(height: 5),
          Container(
            color: MyColors.appColorWhite(),
            child: ListTile(
              title: MyWidgets.robotoFontText(
                  text: providerChooseEduTexnikum.foreignLangNames.length < 5 ? "chooose edu Lang":providerChooseEduTexnikum.foreignLangNames,
                  textColor: MyColors.appColorBlack()),
              onTap: () {
                sheetLangForeignTexnikum(contexts: context, providerChooseEduTexnikum: providerChooseEduTexnikum);
                // directionNameTexnikum
              },
              trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 16),
            ),
          ),
        ],
      ),
    );

}