import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/check_info_perevod/provider_check_perevod.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget buttonContinue({required BuildContext context, required ProviderCheckInfoPerevod providerCheckInfoPerevod, required Function functions}){
  return    MaterialButton(
    onPressed: () {
      providerCheckInfoPerevod.checkInfo(
          providerCheckInfoPerevod: providerCheckInfoPerevod,
          index: 4,
          context: context,
          func: functions);
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    height: 50,
    minWidth: MediaQuery.of(context).size.width * 0.9,
    color: MyColors.appColorBlue1(),
    child: Text("continue".tr(),
        style: TextStyle(color: MyColors.appColorWhite())),
  );
}