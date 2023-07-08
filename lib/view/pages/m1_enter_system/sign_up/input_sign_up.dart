import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pw_validator/Resource/Strings.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/provider_sign_up.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget inputsSignUp(
    {required BuildContext context, required ProviderSignUp providerSignUp}) {
  log(MediaQuery.of(context).size.height.toString());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MyWidgets.robotoFontText(text: "phoneNumber".tr()),
      TextFormField(
          controller: providerSignUp.textSingUpLogin,
          maxLines: 1,
          textAlignVertical: TextAlignVertical.center,
          maxLength: 9,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          decoration: InputDecoration(
            prefixText: "+998 ",
            contentPadding: const EdgeInsets.all(8),
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
            // focusedBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: MyColors.appColorBackC4()),
            // ),
            errorMaxLines: 2,
          ),
          validator: (value) {
            if (value == null || value.length < 9) {
              providerSignUp.boolButtonCol1(boolValue: false);
              if (value!.length > 1) {
                String kod = value.substring(0, 2);
                for (var element in MyWidgets.checkTelephoneCompanyCode) {
                  if (element.contains(kod)) {
                    providerSignUp.myBoolWidget = true;
                    break;
                  } else {
                    providerSignUp.myBoolWidget = false;
                  }
                }
                if (!providerSignUp.myBoolWidget && value.length < 3) {
                  return "kodError".tr();
                } else {
                  return "kodLength".tr();
                }
              } else {
                return "phoneNumber".tr();
              }
            } else {
              String kod = value.substring(0, 2);
              for (var element in MyWidgets.checkTelephoneCompanyCode) {
                if (element.contains(kod)) {
                  providerSignUp.myBoolWidget = true;
                  providerSignUp.boolButtonCol1(boolValue: true);
                  break;
                } else {
                  providerSignUp.boolButtonCol1(boolValue: false);
                  providerSignUp.myBoolWidget = false;
                }
              }
              if (!providerSignUp.myBoolWidget) {
                providerSignUp.boolButtonCol1(boolValue: false);
                return "kodError".tr();
              } else {
                providerSignUp.boolButtonCol1(boolValue: true);
              }
            }
            return null;
          }),
      const SizedBox(height: 5),
      MyWidgets.robotoFontText(text: "password".tr()),
      TextFormField(
        controller: providerSignUp.textSingUpPassword,
        textAlignVertical: TextAlignVertical.center,
        maxLines: 1,
        maxLength: 20,
        obscureText: providerSignUp.boolPasswordVisible,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          suffixIcon: GestureDetector(
            onTap: () {
              providerSignUp.boolPasswordVisibleMethod();
            },
            child: providerSignUp.boolPasswordVisible
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
          errorMaxLines: 2,
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
            return "";
          } else {
            return "";
          }
        },
      ),
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
              controller: providerSignUp.textSingUpPassword,
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
              strings: FrenchStrings(),
              successColor: MyColors.appColorBlue2(),
              onSuccess: () {
                providerSignUp.boolButtonCol2(boolValue: true);
              },
              onFail: () {
                providerSignUp.boolButtonCol2(boolValue: false);
              }),
        ),
      )
    ],
  );
}

class FrenchStrings implements FlutterPwValidatorStrings {
  @override
  // TODO: implement atLeast
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

  @override
  // TODO: implement lowercaseLetters
  String get lowercaseLetters => throw UnimplementedError();
}
