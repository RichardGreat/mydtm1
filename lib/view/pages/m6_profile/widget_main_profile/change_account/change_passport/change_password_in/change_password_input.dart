import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/change_account/change_passport/change_password_in/provider_change_pass_in.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class ChangePasswordInput extends StatefulWidget {
  String passResetToken;

  ChangePasswordInput({Key? key, required this.passResetToken})
      : super(key: key);

  @override
  State<ChangePasswordInput> createState() => _ChangePasswordInputState();
}

class _ChangePasswordInputState extends State<ChangePasswordInput> {
  ProviderChangePasswordInputs providerChangePasswordInputs =
      ProviderChangePasswordInputs();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerChangePasswordInputs,
      child: Consumer<ProviderChangePasswordInputs>(
        builder: (context, value, child) => Form(
          key: providerChangePasswordInputs.formKeyChangeNewInputPassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: WillPopScope(
            onWillPop: () async {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              return true;
            },
            child: Scaffold(
              backgroundColor: MyColors.appColorWhite(),
              appBar: AppBar(
                  iconTheme: IconThemeData(color: MyColors.appColorBlack()),
                  elevation: 0,
                  backgroundColor: MyColors.appColorWhite()),
              body: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      MyWidgets.robotoFontText(
                          text: "changePassport".tr(), textSize: 24),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: providerChangePasswordInputs.textEditingPass1,
                        textAlignVertical: TextAlignVertical.center,
                        maxLines: 1,
                        maxLength: 20,
                        obscureText:
                            providerChangePasswordInputs.boolPasswordVisible,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              providerChangePasswordInputs
                                  .boolPasswordVisibleMethod();
                              setState(() {});
                            },
                            child:
                                providerChangePasswordInputs.boolPasswordVisible
                                    ? Icon(
                                        CupertinoIcons.eye_slash,
                                        color: MyColors.appColorGrey600(),
                                        size: 18,
                                      )
                                    : Icon(
                                        CupertinoIcons.eye,
                                        color: MyColors.appColorBlue2(),
                                        size: 18,
                                      ),
                          ),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: MyColors.appColorBlue2(),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: MyColors.appColorGrey100(),
                              width: 2.0,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: MyColors.appColorGrey100(),
                              width: 2.0,
                            ),
                          ),
                          errorStyle: TextStyle(
                            color: MyColors.appColorRed(),
                            fontWeight: FontWeight.w500,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: MyColors.appColorGrey100(),
                              width: 2.0,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.length < 8) {
                            providerChangePasswordInputs.boolButtonCol2(
                                boolValue: false);
                            return "passwordLength".tr();
                          } else {
                            providerChangePasswordInputs.boolButtonCol2(
                                boolValue: true);
                            return "";
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: providerChangePasswordInputs.textEditingPass2,
                        textAlignVertical: TextAlignVertical.center,
                        maxLines: 1,
                        maxLength: 20,
                        obscureText:
                            providerChangePasswordInputs.boolPasswordVisible2,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              providerChangePasswordInputs
                                  .boolPasswordVisibleMethod2();
                              setState(() {});
                            },
                            child:
                                providerChangePasswordInputs.boolPasswordVisible2
                                    ? Icon(
                                        CupertinoIcons.eye_slash,
                                        color: MyColors.appColorGrey600(),
                                        size: 18,
                                      )
                                    : Icon(
                                        CupertinoIcons.eye,
                                        color: MyColors.appColorBlue2(),
                                        size: 18,
                                      ),
                          ),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: MyColors.appColorBlue2(),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: MyColors.appColorGrey100(),
                              width: 2.0,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: MyColors.appColorGrey100(),
                              width: 2.0,
                            ),
                          ),
                          errorStyle: TextStyle(
                            color: MyColors.appColorRed(),
                            fontWeight: FontWeight.w500,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: MyColors.appColorGrey100(),
                              width: 2.0,
                            ),
                          ),
                        ),
                        validator: (value) {
                          // ignore: unrelated_type_equality_checks

                          if (value!.length >= 8 &&
                              providerChangePasswordInputs.textEditingPass1.text
                                      .trim() ==
                                  value.trim()) {
                            providerChangePasswordInputs.passwordButtonColor(
                                boolBtnCol: true);
                            return "";
                            // if (value.toString().trim() !=
                            //     providerChangePasswordInputs
                            //         .textEditingPass2.text) {
                            //   providerChangePasswordInputs.passwordButtonColor(
                            //       boolBtnCol: false);
                            //   return "passwordNotMatch".tr();
                            // } else {
                            //   providerChangePasswordInputs.passwordButtonColor(
                            //       boolBtnCol: true);
                            //   return "true";
                            // }
                          } else {
                            return "passwordNotMatch".tr();
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      MaterialButton(
                          onPressed: () {
                            setState(() {});

                            if (providerChangePasswordInputs.textEditingPass1.text
                                    .trim() ==
                                providerChangePasswordInputs.textEditingPass2.text
                                    .trim()) {
                              providerChangePasswordInputs.getNewPassport(
                                  passportResetToken: widget.passResetToken,
                                  textNewPassport: providerChangePasswordInputs
                                      .textEditingPass2.text
                                      .trim(),
                                  context: context);
                            }
                          },
                          height: 50,
                          minWidth: double.infinity,
                          color: MyColors.appColorBlue2(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: MyWidgets.robotoFontText(
                              text: "access".tr(),
                              textColor: MyColors.appColorWhite()))
                    ],
                ),
              ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
