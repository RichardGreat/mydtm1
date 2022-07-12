import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/widgets/app_widget/sms_auto_fill/state_menegment/provider_sms.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

Widget registrated(
    {required BuildContext context,
    required ProviderSms providerSms,
    required String message}) {
  return Center(
    child: Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("regUser".tr(),textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),),
          const SizedBox(height: 30),
          MaterialButton(
            height: 50,
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: const Color.fromRGBO(255, 255, 255, 1),
            minWidth: double.infinity,
            color: MyColors.appColorBlue1(),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child:  Text("goMainScreen".tr()),
          )
        ],
      ),
    ),
  );
}
