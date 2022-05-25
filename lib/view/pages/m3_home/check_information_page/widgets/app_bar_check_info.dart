import 'package:flutter/material.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

PreferredSizeWidget appBarCheckInfo({required BuildContext context}) {
  return AppBar(
    elevation: 0,
    backgroundColor: MyColors.appColorGrey100(),
    iconTheme: IconThemeData(color: MyColors.appColorBlack()),
  );
}
