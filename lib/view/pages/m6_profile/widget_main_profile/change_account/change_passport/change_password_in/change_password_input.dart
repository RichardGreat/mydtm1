import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/Resource/Strings.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/change_account/change_passport/change_password_in/provider_change_pass_in.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class ChangePasswordInput extends StatefulWidget {
  String passResetToken;
  String phoneNumber;

  ChangePasswordInput(
      {Key? key, required this.passResetToken, required this.phoneNumber})
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
                        controller:
                            providerChangePasswordInputs.textEditingPass1,
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
                          errorMaxLines: 2,
                        ),
                        validator: (value) {
                          if (value == null || value.length < 8) {
                            return "passwordLength".tr();
                          } else {
                            return "";
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: MediaQuery.of(context).size.height > 900
                            ? MediaQuery.of(context).size.height * 0.3
                            : MediaQuery.of(context).size.height > 800
                            ? MediaQuery.of(context).size.height * 0.32
                            : MediaQuery.of(context).size.height > 700
                            ? MediaQuery.of(context).size.height * 0.3
                            : MediaQuery.of(context).size.height > 600
                            ? MediaQuery.of(context).size.height * 0.25
                            : MediaQuery.of(context).size.height * 0.23,
                        child: SingleChildScrollView(
                          child: FlutterPwValidator(
                              controller:
                                  providerChangePasswordInputs.textEditingPass1,
                              minLength: 8,
                              uppercaseCharCount: 1,
                              numericCharCount: 1,
                              specialCharCount: 1,
                              width: MediaQuery.of(context).size.width * 0.8,
                              height:
                              MediaQuery.of(context).size.height > 900
                                  ? MediaQuery.of(context).size.height * 0.35
                                  : MediaQuery.of(context).size.height > 800
                                  ? MediaQuery.of(context).size.height * 0.38
                                  : MediaQuery.of(context).size.height > 700
                                  ? MediaQuery.of(context).size.height * 0.43
                                  : MediaQuery.of(context).size.height > 600
                                  ? MediaQuery.of(context).size.height * 0.5
                                  : MediaQuery.of(context).size.height * 0.5,
                              successColor: MyColors.appColorBlue1(),

                              strings: FrenchString(),
                              onSuccess: () {
                                providerChangePasswordInputs
                                    .boolGetAccessTypePassword(boolValue: true);
                                // providerSignUp.boolButtonCol2(boolValue: true);
                              },
                              onFail: () {
                                providerChangePasswordInputs
                                    .boolGetAccessTypePassword(boolValue: false);
                                // providerSignUp.boolButtonCol2(boolValue: false);
                              }),
                        ),
                      ),
                      const SizedBox(height: 20),
                      MaterialButton(
                          onPressed: () {
                            setState(() {});
                            if (providerChangePasswordInputs
                                .boolAccessNewPassword) {
                              providerChangePasswordInputs.getNewPassport(
                                  phoneNumber: widget.phoneNumber,
                                  passportResetToken: widget.passResetToken,
                                  textNewPassport: providerChangePasswordInputs
                                      .textEditingPass1.text
                                      .trim(),
                                  context: context);
                            }
                          },
                          height: 50,
                          minWidth: double.infinity,
                          color: MyColors.appColorBlue1(),
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

class FrenchString implements FlutterPwValidatorStrings {
  //TODO implement atLeast
  @override
  String get atLeast => "passwordLength".tr();

  @override
  // TODO: implement normalLetters
  String get normalLetters => "2";

  @override
  // TODO: implement numericCharacters
  String get numericCharacters => "enterNumber".tr();

  @override
  // TODO: implement specialCharacters
  String get specialCharacters => "enterSpecialSymbols".tr();

  @override
  // TODO: implement uppercaseLetters
  String get uppercaseLetters => "enterCapitalLatter".tr();
}
