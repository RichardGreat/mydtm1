import 'package:flutter/material.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

PreferredSizeWidget appBarQaydVaraqa() {
  return AppBar(
    backgroundColor: MyColors.appColorGrey100(),
    elevation: 0,
    iconTheme: IconThemeData(color: MyColors.appColorBlack()),
  );
}
