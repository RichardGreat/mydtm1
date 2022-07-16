import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/provider_new_edu.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

PreferredSizeWidget appBarNewPerevod(
    {required BuildContext context,
    required ProviderNewEduPerevod providerNewEduPerevod}) {
  return AppBar(
    backgroundColor: MyColors.appColorGrey100(),
    iconTheme: IconThemeData(color: MyColors.appColorBlack()),
    elevation: 0,

  );
}
