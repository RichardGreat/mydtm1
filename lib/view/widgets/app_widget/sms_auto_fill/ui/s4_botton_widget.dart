import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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
      MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minWidth: double.infinity,
        height: 45,
        color:MyColors.appColorBlue1(),
        onPressed: () {
          log(providerSms.smsId.toString());
          // providerSms.sentServer(
          //     appId: providerSms.smsIdActivate,
          //     smsCode: providerSms.controller.text);
          if (providerSms.controller.text.length > 5) {
           if(providerSms.smsSentStatus == 7){
             providerSms.sentServer2Edu(context: context);

           }else{
             providerSms.sentServer2Edu(context: context);
            // providerSms.sentServer(
            //   context: context,
            //     appId: providerSms.smsIdActivate,
            //     smsCode: providerSms.controller.text);
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
