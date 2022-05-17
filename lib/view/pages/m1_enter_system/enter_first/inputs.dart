import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/m1_enter_system/enter_first/provider_enter_first.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget enterFirstBodyInput(
    {required BuildContext context,
    required ProviderEnterFirst providerEnterFirst}) {
  return Column(
    // mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MyWidgets.robotoFontText(text: "Telefon"),
      TextFormField(
          controller: providerEnterFirst.textAuthLogin,
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
            focusedErrorBorder:  OutlineInputBorder(
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
            errorBorder:  OutlineInputBorder(
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
              if (value!.length > 1) {
                String kod = value.substring(0, 2);
                for (var element in MyWidgets.checkTelephoneCompanyCode) {
                  if (element.contains(kod)) {
                    providerEnterFirst.myBoolWidget = true;
                    break;
                  } else {
                    providerEnterFirst.myBoolWidget = false;
                  }
                }
                if (!providerEnterFirst.myBoolWidget && value.length < 3) {
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
                  providerEnterFirst.myBoolWidget = true;
                  providerEnterFirst.boolButtonCol1(boolValue: true);
                  break;
                } else {
                  providerEnterFirst.boolButtonCol1(boolValue: false);
                  providerEnterFirst.myBoolWidget = false;
                }
              }
              if (!providerEnterFirst.myBoolWidget) {
                providerEnterFirst.boolButtonCol1(boolValue: false);
                return "kodError".tr();
              } else {
                providerEnterFirst.boolButtonCol1(boolValue: true);
              }
            }
            return null;
          }
      ),
      const SizedBox(height: 10),
      MyWidgets.robotoFontText(text: "Parol"),
      TextFormField(
        controller: providerEnterFirst.textAuthPassword,
          textAlignVertical: TextAlignVertical.center,
          maxLines: 1,
          maxLength: 20,
          autofocus:false,
          obscureText: providerEnterFirst.boolPasswordVisible,
          keyboardType:
          TextInputType.visiblePassword,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            suffixIcon: GestureDetector(
              onTap: () {
                providerEnterFirst.boolPasswordVisibleMethod();
              },
              child: providerEnterFirst.boolPasswordVisible
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
            focusedErrorBorder:  OutlineInputBorder(
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
            errorBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: MyColors.appColorGrey100(),
                width: 2.0,
              ),
            ),
          ),
        validator: (value) {
          if(value!.isEmpty || value.length < 8){
            return "er";
          }
  }
      ),
    ],
  );
}
