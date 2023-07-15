import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/state_menegment/provider_sms.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget bottomUI(
    {required BuildContext context,
      required String phoneNumber,
      required ProviderSms providerSms}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      providerSms.timeFormatString =="00:01"?
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
      ):const SizedBox.shrink(),
      const SizedBox(height: 25),
      providerSms.timeFormatString == "00:00" ? const SizedBox.shrink() :
      MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minWidth: double.infinity,
        height: 45,
        color: MyColors.appColorBBA(),
        onPressed: () {
          providerSms.boolSentServerRequest ? {
          if (5 > 4) {
            if (providerSms.smsSentStatus == 7) {
              providerSms.sentServer2Edu(context: context),
            }
            else if (providerSms.smsSentStatus == 1) {
              providerSms.sendRegistrationServer(
                  smsCode:providerSms.textEditingControllerSms.text.toString().trim(),
                  smsId: providerSms.smsId,
                  context: context
              ),
            }
            else if (providerSms.smsSentStatus == 3) {
              providerSms.changePhoneNumber(
                  phoneNum: providerSms.numberPhones,
                  smsId: providerSms.captchaKeys,
                  smsCode: providerSms.textEditingControllerSms.text.toString().trim(), context: context),
            }
            else if (providerSms.smsSentStatus == 2) {
              providerSms.getResetPass(
                phoneNum: phoneNumber,
                  smsCode: providerSms.textEditingControllerSms.text.toString().trim(),
                  context: context,
                  smsId: providerSms.captchaKeys),
            }
          }
        }:{};

          ///
        },
        child: Text("continue".tr(),
            style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
      )
    ],
  );
}
