import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/m6_profile/provider_profile.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget captchaGetPassport(
    {required BuildContext context,
      required ProviderProfile providerProfile}) {
  return Column(
    children: [
      MyWidgets.robotoFontText(text: "Arfimetik amalni bajaring"),
      const SizedBox(height: 2),
      Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.7,
        padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
        decoration: BoxDecoration(
          // border: Border.all(color: MyColors.appColorGrey100()),
            borderRadius: BorderRadius.circular(10),
            color: MyColors.appColorWhite()),
        child: providerProfile.boolGetCaptcha
            ? Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
             Image.memory(base64Decode(providerProfile
                .modelParseCaptcha.data.captchaImg
                .substring(22))),
             SizedBox(
                height: 50,
              width: 50,

              /// Ps Set
              child: TextFormField(
                controller:
                providerProfile.textCaptchaEditingControllerPassport,
                maxLength: 3,
                maxLines: 1,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                ],
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  counter: const SizedBox.shrink(),
                  contentPadding: const EdgeInsets.all(8),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: MyColors.appColorGreen2(),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: MyColors.appColorGrey400(),
                      width: 1.5,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: MyColors.appColorBlue1(),
                      width: 1.5,
                    ),
                  ),
                  errorStyle: TextStyle(
                    color: MyColors.appColorRed(),
                    fontWeight: FontWeight.w500,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: MyColors.appColorBlue1(),
                      width: 1.5,
                    ),
                  ),
                ),
                // validator: (value){
                //   if(value == null  || value.isEmpty){
                //
                //     return "";}
                //   else{
                //
                //     return null;
                //   }
                // },
              ),
            ),
          ],
        )
            : const Center(child: CupertinoActivityIndicator()),
      ),
    ],
  );
}