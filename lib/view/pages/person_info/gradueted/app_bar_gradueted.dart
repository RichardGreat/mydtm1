import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/gradueted/provider_graduetid.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

PreferredSizeWidget appBarGradueted(
    {required BuildContext context, required ProviderGraduated providerGradueted}) {
  return AppBar(
    toolbarHeight: 40,
    backgroundColor: MyColors.appColorWhite(),
    elevation: 0,
    iconTheme: IconThemeData(color: MyColors.appColorBlack()),
  );
}