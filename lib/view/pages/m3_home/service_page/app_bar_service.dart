import 'package:flutter/material.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

PreferredSizeWidget appBarService({required BuildContext context}) {
  return AppBar(
    iconTheme: IconThemeData(color: MyColors.appColorBlack()),
    elevation: 0,
    backgroundColor: MyColors.appColorWhite(),
  );
}
