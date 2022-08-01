import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/privillage/provider_privillage_texnika.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

PreferredSizeWidget appBarPrivilegeTexnikum(
    {required BuildContext context,
    required ProviderPrivilegeTexnikum providerPrivilegeTexnikum}) {
  return AppBar(
    backgroundColor: MyColors.appColorGrey100(),
    iconTheme: IconThemeData(color: MyColors.appColorBlack()),
    elevation: 0,title:       MyWidgets.robotoFontText(text: "privileges".tr(), textSize: 28),



  );
}
