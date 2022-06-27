import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/m1_enter_system/sign_up/provider_sign_up.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

Widget captchaSignUp(
    {required BuildContext context, required ProviderSignUp providerSignUp}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width*0.7,
              child: MyWidgets.robotoFontText(text: "solve".tr())),
          const SizedBox(height: 2),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.7,
            padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
            decoration: BoxDecoration(
                // border: Border.all(color: MyColors.appColorGrey100()),
                borderRadius: BorderRadius.circular(10),
                color: MyColors.appColorWhite()),
            child: providerSignUp.boolGetCaptcha
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.memory(base64Decode(providerSignUp
                          .modelParseCaptcha.data.captchaImg
                          .substring(22))),
                      SizedBox(

                        width: 50,
                        height: 100,

                        /// Ps Set
                        child: TextFormField(
                          controller: providerSignUp.textCaptchaSignUpController,
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
                          //     return "..";}
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
      ),
    ],
  );
}
