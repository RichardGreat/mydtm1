import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/choose_edu/provider_choose_edu_t.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget eduButtonTexnikum({required BuildContext context, required ProviderChooseEduTexnikum providerChooseEduTexnikum}){
  return Column(
    children: [
      const SizedBox(height: 20),
      MaterialButton(
        onPressed: (){},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        height: 50,
        minWidth: double.infinity,
        color: MyColors.appColorBlue1(),
        child: MyWidgets.robotoFontText(text:"Button", textColor: MyColors.appColorWhite()),),
    ],
  );

}