import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/forigion_lang/provider_foriegn_lang.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

PreferredSizeWidget appBarForeignLang(
    {required BuildContext context,
    required ProviderForeignLang providerForeignLang}) {
  return AppBar(
    elevation: 0,
    backgroundColor: MyColors.appColorGrey100(),
    iconTheme: IconThemeData(color: MyColors.appColorBlack()),
  );
}
