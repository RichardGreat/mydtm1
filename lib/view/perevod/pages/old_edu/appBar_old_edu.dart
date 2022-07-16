import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/old_edu/provider_old_edu.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

PreferredSizeWidget appBarOldEdu({required BuildContext context, required ProviderOldEdu providerOldEdu}){
  return AppBar(elevation: 0,
  iconTheme: IconThemeData(color: MyColors.appColorBlack()),
  backgroundColor: MyColors.appColorGrey100()
  );
}