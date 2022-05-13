import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/provider_sign_up.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

PreferredSizeWidget appBarSignUp(
    {required BuildContext context, required ProviderSignUp providerSignUp}) {
  return AppBar(
    backgroundColor: MyColors.appColorWhite(),
    elevation: 0,
    iconTheme: IconThemeData(color: MyColors.appColorBlack()),
  );
}