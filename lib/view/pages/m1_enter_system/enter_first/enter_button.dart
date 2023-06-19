import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/provider_enter_first.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
Widget enterButton(
    {required BuildContext context,
    required ProviderEnterFirst providerEnterFirst}) {
  return Column(
    children: [
      MaterialButton(
          height: 50,
          minWidth: double.infinity,
          color: MyColors.appColorBlue1(),
          textColor: MyColors.appColorWhite(),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            // providerEnterFirst.enterPersonPassport(context: context);
            if(providerEnterFirst.formKey.currentState!.validate() && providerEnterFirst.textCaptchaEditingController.text.trim().isNotEmpty){
              providerEnterFirst.getAuthorization(context: context);
              providerEnterFirst.textCaptchaEditingController.clear();
            }else{
              MyWidgets.scaffoldMessengerBottom(context: context, valueText: "fillInField".tr());
            }
          },
          child: MyWidgets.robotoFontText(
              text: "enterSystem".tr(), textColor: MyColors.appColorWhite())),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: [
         const  Divider(),
            Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  color: MyColors.appColorWhite(),
                  // margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "or".tr(),
                    style: TextStyle(backgroundColor: MyColors.appColorWhite()),
                  ),
                ))
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          providerEnterFirst.textCaptchaEditingController.clear();
          providerEnterFirst.enterSignUp(context: context);
        },
        child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: MyColors.appColorBlack())),
            child: Center(
                child: MyWidgets.robotoFontText(text: "registration".tr()))),
      ),
    ],
  );
}
