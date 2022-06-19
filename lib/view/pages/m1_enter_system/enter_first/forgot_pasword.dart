import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/provider_enter_first.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/reset_passwod/reset_password.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget forgotPassword(
    {required BuildContext context,
    required ProviderEnterFirst providerEnterFirst}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, CupertinoPageRoute(builder: (context) => ResetPasswords(providerEnterFirst: providerEnterFirst),));
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          child: MyWidgets.robotoFontText(
              text: "resetPassword".tr(), textColor: MyColors.appColorGrey400()),
        ),
      ],
    ),
  );
}
