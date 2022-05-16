import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget buttonGradueted({required BuildContext context, required ProviderGradueted providerGradueted}){
  return MaterialButton(
    minWidth: double.infinity,
    height: 50,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    color: MyColors.appColorBlue1(),
    onPressed: (){},
  child: MyWidgets.robotoFontText(text: "Davom etish", textColor: MyColors.appColorWhite()),
  );
}