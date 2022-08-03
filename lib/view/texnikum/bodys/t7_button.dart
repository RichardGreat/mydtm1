import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/applications.dart';
import 'package:mydtm/view/texnikum/provider_texnikum.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

Widget buttonInfoTexnikum({required BuildContext context, required ProviderTexnikum providerTexnikum,required Function function}) {
  return MaterialButton(
    onPressed: () {
      pushNewScreen(context, screen: ApplicationTexnikum(providerTexnikum: providerTexnikum));
      
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
