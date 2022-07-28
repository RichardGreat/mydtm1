import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/provider_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget privillageInfoTexnikum({required BuildContext context, required ProviderTexnikum providerTexnikum,}){
  return  Container(
    decoration: BoxDecoration(
        color: MyColors.appColorWhite(),
        borderRadius: BorderRadius.circular(5)),
    child: ListTile(
      dense: true,
      visualDensity: const VisualDensity(vertical: 0),
      onTap: () {
        // providerCheckInfoPerevod.checkInfo(
        //     providerCheckInfoPerevod: providerCheckInfoPerevod,
        //     index: 0,
        //     context: context,
        //     func: functions);
      },
      trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 14),
      leading: MyWidgets.robotoFontText(
          text: "personInformation".tr(), textSize: 16),
      title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            providerTexnikum.modelCheckUserInfoTexnikum.person
                ? Icon(Icons.check_circle, color: MyColors.appColorGreen1())
                : const SizedBox.shrink(),
          ]),
    ),
  );
}