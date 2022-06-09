import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/state_menegment/provider_sms.dart';

Widget uiText({required BuildContext context, required String phoneNum, required ProviderSms providerSms}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      providerSms.timeFormatString == "00:00"?const SizedBox.shrink():
      Text("smsSent".tr(),
          style: TextStyle(
              fontSize: 17,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w400)),
      const SizedBox(height: 5),
      providerSms.timeFormatString == "00:00"?const SizedBox.shrink():
      Text("+998 ${returnPhoneFormat(phoneNumber: phoneNum)}",
          style: const TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.w600)),
      providerSms.timeFormatString == "00:00"?const SizedBox.shrink():
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width:
            MediaQuery.of(context).size.width * 0.75,
            child: TextFormField(
              controller: providerSms.controller,
              maxLines: 1,
              maxLength: 6,
              decoration: InputDecoration(
                labelText: "enterSms".tr(),
                labelStyle: const TextStyle(
                    color: Color.fromRGBO(
                        48, 192, 192, 1)),
                focusedBorder:
                const UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(
                          48, 192, 192, 1)),
                ),
                errorStyle: const TextStyle(
                  color: Color(0xFFB71C1C),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Align(
            alignment: Alignment.centerRight,
            child:MyWidgets.robotoFontText(
                text:providerSms.timeFormatString??"05:00",
            textSize: 16
            ),
          ),

        ],
      ),
      const SizedBox(height: 5),
    ],
  );
}

String returnPhoneFormat({required String phoneNumber}) {
  String p = "(${phoneNumber.substring(0, 2)})-";
  String h = "${phoneNumber.substring(2, 5)}-";
  String o = "${phoneNumber.substring(5, 7)}-";
  String n = phoneNumber.substring(7, 9);
  return p + h + o + n;
}
