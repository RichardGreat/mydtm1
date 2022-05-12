import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/provider_enter_first.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

PreferredSizeWidget enterFirstAppBar(
    {required BuildContext context,
    required ProviderEnterFirst providerEnterFirst}) {
  return AppBar(
    elevation: 0,
    backgroundColor: MyColors.appColorWhite(),
  );
}
