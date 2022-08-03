import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/choose_edu/edu_widgets/sheet_widgets/sh4_sheet_direction.dart';
import 'package:mydtm/view/texnikum/choose_edu/provider_choose_edu_t.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget eduDirTexnikum(
    {required BuildContext context,
    required ProviderChooseEduTexnikum providerChooseEduTexnikum}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const SizedBox(height: 15),
      MyWidgets.robotoFontText(
          text: "chooose edu Dir", textColor: MyColors.appColorGrey600()),
      const SizedBox(height: 5),
      Container(
        color: MyColors.appColorWhite(),
        child: ListTile(
          title: MyWidgets.robotoFontText(
              text: providerChooseEduTexnikum.directionNameTexnikum.length < 5
                  ? "Choose edu Dir"
                  : providerChooseEduTexnikum.directionNameTexnikum,
              textColor: MyColors.appColorBlack()),
          onTap: () {
            sheetDirectionTexnikum(
                contexts: context,
                providerChooseEduTexnikum: providerChooseEduTexnikum);
          },
          trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 16),
        ),
      ),
    ],
  );
}
