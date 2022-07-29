import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/provider_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget certificateTexnikum({required BuildContext context, required ProviderTexnikum providerTexnikum,required Function function}){
  return  Container(
    decoration: BoxDecoration(
        color: MyColors.appColorWhite(),
       ),
    child: ListTile(
      dense: true,
      visualDensity: const VisualDensity(vertical: 0),
      onTap: () {
        providerTexnikum.checkInfo(
            providerTexnikum: providerTexnikum,
            index: 3,
            context: context,
            func: function);
      },
      trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 14),
      leading: MyWidgets.robotoFontText(
          text: "certificates".tr(), textSize: 16),
      title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            providerTexnikum.modelCheckUserInfoTexnikum.certificate
                ? Icon(Icons.check_circle, color: MyColors.appColorGreen1())
                : const SizedBox.shrink(),
          ]),
    ),
  );
}