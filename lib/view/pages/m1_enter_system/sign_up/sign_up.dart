import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/app_bar_sign_up.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/button_sign_up.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/captcha_sing_up.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/input_sign_up.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/provider_sign_up.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  ProviderSignUp providerSignUp = ProviderSignUp();

  @override
  void initState() {
    providerSignUp.getCaptcha();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerSignUp,
      child: Consumer<ProviderSignUp>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: MyColors.appColorWhite(),
            appBar:
                appBarSignUp(context: context, providerSignUp: providerSignUp),
            body: Form(
                key: providerSignUp.formKey123456,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                       Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [

                         textWords(
                             context: context, providerSignUp: providerSignUp),
                         inputsSignUp(
                             context: context, providerSignUp: providerSignUp),
                         const SizedBox(height: 5),
                       ],),
                        Column(children: [
                          captchaSignUp(
                              context: context, providerSignUp: providerSignUp),
                          buttonSignUp(
                              context: context, providerSignUp: providerSignUp),
                        ],),


                      ],
                    ),
                  ),
                ))),
      ),
    );
  }

  Widget textWords(
      {required BuildContext context, required ProviderSignUp providerSignUp}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyWidgets.robotoFontText(
            text: "registration".tr(),
            textColor: MyColors.appColorBlack(),
            textFontWeight: FontWeight.bold,
            textSize: 22),
        const SizedBox(height: 10),
        FittedBox(
          child: MyWidgets.robotoFontText(
              text: "phoneNumberNewPassword".tr(),
              textColor: MyColors.appColorGrey600(),
              textSize: 13),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
