import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget chooseButtons() {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
        color: MyColors.appColorWhite(),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: MyColors.appColorGrey400())),
    child: MaterialButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: MyColors.appColorBlue1(),
      child: Text(
        "access".tr(),
        style: TextStyle(color: MyColors.appColorWhite()),
      ),
    ),
  );
}
