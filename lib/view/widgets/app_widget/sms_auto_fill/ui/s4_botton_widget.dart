import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/state_menegment/provider_sms.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget bottomUI(
    {required BuildContext context, required ProviderSms providerSms}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Text("reSentSms".tr()),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      providerSms.timeFormatString == "00:00" ? const SizedBox.shrink() :
      MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minWidth: double.infinity,
        height: 45,
        color: MyColors.appColorBlue1(),
        onPressed: () {
          // providerSms.sentServer(
          //     appId: providerSms.smsIdActivate,
          //     smsCode: providerSms.controller.text);
          if (providerSms.controller.text.length > 4) {
            if (providerSms.smsSentStatus == 7) {
              providerSms.sentServer2Edu(context: context);
            }
            else if (providerSms.smsSentStatus == 1) {

              providerSms.sendRegistrationServer(
              smsCode:  providerSms.controller.text,
              smsId:   providerSms.smsId,
                context: context
              );
            }
            else if(providerSms.smsSentStatus == 3){
              providerSms.changePhoneNumber(phoneNum: providerSms.numberPhones, smsId: providerSms.captchaKeys, smsCode: providerSms.controller.text, context: context);
            }
            else if(providerSms.smsSentStatus == 2){

            }
          }

          ///
        },
        child: Text("continue".tr(),
            style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
      )
    ],
  );
}
