import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/privillage/provider_privilege.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

PreferredSizeWidget appBarPrivilege(
    {required BuildContext context,
    required ProviderPrivilege providerPrivilege}) {
  return AppBar(
    backgroundColor: MyColors.appColorWhite(),
    iconTheme: IconThemeData(color: MyColors.appColorBlack()),
    elevation: 0,

  );
}
