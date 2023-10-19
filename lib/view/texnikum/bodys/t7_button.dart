import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/applications.dart';
import 'package:mydtm/view/texnikum/provider_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';


Widget buttonInfoTexnikum({required BuildContext context, required ProviderTexnikum providerTexnikum,required Function function}) {
  return MaterialButton(
    onPressed: () {

      Navigator.push(context, CupertinoPageRoute(builder: (context) => ApplicationTexnikum(providerTexnikum: providerTexnikum),));
      //
      // providerTexnikum.checkInfo(
      //     providerTexnikum: providerTexnikum,
      //     index:5,
      //     context: context,
      //     func: function);
    },
    height: 50,
    minWidth: double.infinity,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    color: MyColors.appColorBlue1(),
    child: MyWidgets.robotoFontText(
        text: "continue".tr(), textColor: MyColors.appColorWhite()),
  );
}
