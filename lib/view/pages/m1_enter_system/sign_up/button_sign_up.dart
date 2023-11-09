import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/provider_sign_up.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget buttonSignUp(
    {required BuildContext context, required ProviderSignUp providerSignUp}) {
  return Column(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    MaterialButton(
    height: 50,
    minWidth: double.infinity,
    color: providerSignUp.boolButtonColor1 &&
            providerSignUp.boolButtonColor2 &&
            providerSignUp.textCaptchaSignUpController.text.isNotEmpty
        ? MyColors.appColorBlue1()
        : MyColors.appColorGrey400(),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: MyWidgets.robotoFontText(
        text: "registration".tr(), textColor: MyColors.appColorWhite()),
    onPressed: () {
      if(providerSignUp.formKey123456.currentState!.validate()){}
      if( providerSignUp.boolButtonColor1 &&
          providerSignUp.boolButtonColor2 &&
          providerSignUp.textCaptchaSignUpController.text.isNotEmpty){
      providerSignUp.getRegistration(context: context);
      }else{
        MyWidgets.scaffoldMessengerBottom(context: context, valueText: "checkField".tr());
      }

    },
  ),
    const SizedBox(height: 30),
    ],
  );
}
