import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget updateInfoGradueted(
    {required BuildContext context,
    required Function function,
    required ProviderGraduated providerGraduated}) {
  return MaterialButton(
    onPressed: () {
      providerGraduated.getUpdate2022(context: context);
      function();
    },
    height: 45,
    minWidth: MediaQuery.of(context).size.width,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    elevation: 2,
    color: MyColors.appColorGrey100(),
    child: Text(
        providerGraduated.boolAllInfoGraduatedNot
            ? "textGraduatedInfo".tr()
            : "updateGraduetedInfo".tr(),
        style: TextStyle(
            color: MyColors.appColorBlack(), fontWeight: FontWeight.bold)),
  );
}
