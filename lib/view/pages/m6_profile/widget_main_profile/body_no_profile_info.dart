import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m6_profile/provider_profile.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget bodyNoProfileInfo({required BuildContext context, required ProviderProfile providerProfile}){
  return Container(
    margin: const EdgeInsets.all(10),
    child: Center(child:  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Image.asset("assets/images/dtm.png", height: 70),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            const SizedBox(height: 20),
            MyWidgets.robotoFontText(text: "noAccount".tr()),
            const SizedBox(height: 10),
            MaterialButton(
              height: 50,
              minWidth: double.infinity,
              color: MyColors.appColorBlue1(),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              onPressed: (){
                providerProfile.goLoginPage(context: context);
              }, child: MyWidgets.robotoFontText(text: "enterSystem".tr(), textColor: MyColors.appColorWhite()),)
          ],),
        )

      ],
    )),);

}