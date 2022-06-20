import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/provider_sign_up.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget inputsSignUp(
    {required BuildContext context, required ProviderSignUp providerSignUp}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MyWidgets.robotoFontText(text: "Telefon"),
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
      validator: (value){
  if (value == null || value.length < 8) {
    providerSignUp.boolButtonCol2(boolValue: false);
    return "passwordLength".tr();
  }else{
    providerSignUp.boolButtonCol2(boolValue: true);
    return "";
  }
      },
      )

    ],
  );
}
