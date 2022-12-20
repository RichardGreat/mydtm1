import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget chooseLanguages() {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
        color: MyColors.appColorWhite(),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: MyColors.appColorGrey400())),
    child: ListTile(
      onTap: (){},
      leading: Text("chooseLangTest".tr()),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      horizontalTitleGap: 0,
    ),
  );
}
