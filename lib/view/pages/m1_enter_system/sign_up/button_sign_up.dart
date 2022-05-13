import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/provider_sign_up.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget buttonSignUp(
    {required BuildContext context, required ProviderSignUp providerSignUp}) {
  return Expanded(child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      MaterialButton(
        height: 50,
        minWidth: double.infinity,
        color: MyColors.appColorBlue1(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: MyWidgets.robotoFontText(text: "Ro'yxatdan o'tish",textColor: MyColors.appColorWhite()),
        onPressed: () {},
      ),
    ],
  ));
}
