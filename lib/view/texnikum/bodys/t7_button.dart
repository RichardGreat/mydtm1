import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/provider_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget buttonInfoTexnikum({
  required BuildContext context,
  required ProviderTexnikum providerTexnikum,
}) {
  return MaterialButton(
    onPressed: () {},
    height: 50,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    color: MyColors.appColorBlue1(),
    child: MyWidgets.robotoFontText(
        text: "continue".tr(), textColor: MyColors.appColorWhite()),
  );
}
